import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/domain/entities/bingo_card.dart';
import '../../../core/domain/entities/player.dart';
import '../../../core/domain/entities/game.dart';
import '../../../core/game_engine/bingo_card_generator.dart';
import '../../../shared/theme/bingo_colors.dart';
import 'widgets/bingo_card_widget.dart';
import 'widgets/called_numbers_display.dart';
import 'widgets/game_button.dart';
import 'widgets/player_list_widget.dart';
import 'providers/game_provider.dart';
import 'providers/socket_provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  final String? pin;
  final String? cartelaNumber;
  
  const GameScreen({super.key, this.pin, this.cartelaNumber});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Log received parameters
      if (widget.pin != null && widget.cartelaNumber != null) {
        debugPrint('Game started with PIN: ${widget.pin}, Cartela: ${widget.cartelaNumber}');
      }
      
      _initializeDemoData();
      ref.read(socketEventListenerProvider);
    });
    

  }

  void _initializeDemoData() {
    // Generate demo card
    final generator = BingoCardGenerator();
    var playerCard = generator.generateCard('demo-player-1');

    // Mark some numbers for demo
    playerCard = playerCard.markNumber(12);
    playerCard = playerCard.markNumber(45);
    playerCard = playerCard.markNumber(23);
    
    // Set card in provider
    ref.read(playerCardProvider.notifier).setCard(playerCard);

    // Create demo players
    final demoPlayers = [
      Player(
        id: 'demo-player-1',
        name: 'You',
        joinedAt: DateTime.now(),
        isOnline: true,
        totalWins: 5,
      ),
      Player(
        id: 'demo-player-2',
        name: 'Player 2',
        joinedAt: DateTime.now(),
        isOnline: true,
        totalWins: 3,
      ),
      Player(
        id: 'demo-player-3',
        name: 'Player 3',
        joinedAt: DateTime.now(),
        isOnline: true,
        totalWins: 8,
      ),
      Player(
        id: 'demo-player-4',
        name: 'Player 4',
        joinedAt: DateTime.now(),
        isOnline: false,
        totalWins: 2,
      ),
    ];
    
    // Set players in provider
    ref.read(gamePlayersProvider.notifier).setPlayers(demoPlayers);

    // Create demo game
    final demoGame = Game(
      id: 'demo-game-1',
      pin: '1234',
      hostId: 'demo-player-1',
      playerIds: demoPlayers.map((p) => p.id).toList(),
      status: GameStatus.inProgress,
      winPattern: WinPattern.anyLine,
      maxPlayers: 50,
      entryFee: 100,
      prizePool: 400,
      calledNumbers: const [12, 45, 67, 23, 8, 56, 34, 71, 19, 42],
      createdAt: DateTime.now(),
      startedAt: DateTime.now(),
      numberCallInterval: 3,
    );
    
    // Set game in provider
    ref.read(currentGameProvider.notifier).setGame(demoGame);
    
    // Set called numbers
    ref.read(calledNumbersProvider.notifier).setNumbers(
      [12, 45, 67, 23, 8, 56, 34, 71, 19, 42],
    );
  }

  Future<void> _onBingoClaimPressed() async {
    final game = ref.read(currentGameProvider);
    final playerId = ref.read(currentPlayerIdProvider);
    
    if (game == null || playerId == null) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Checking your card...'),
        backgroundColor: BingoColors.info,
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    // Claim bingo through provider
    await ref.read(bingoClaimActionProvider.notifier).claimBingo(
      game.id,
      playerId,
    );
  }

  void _onLeaveGame() {
    // TODO: Implement leave game logic
    context.go(Routes.homeRouteName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: BingoColors.gameBackground,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              // Main content
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Responsive layout
                    // return _buildWideLayout();
                    if (constraints.maxWidth > 900) {
                      return _buildWideLayout();
                    } else {
                      return _buildNarrowLayout();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final game = ref.watch(currentGameProvider);
    final statusText = ref.watch(gameStatusTextProvider);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BingoColors.cardBackground,
            BingoColors.cardBackground.withOpacity(0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Back button
          IconButton(
            onPressed: _onLeaveGame,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 8),

          // Game info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Game PIN: ${game?.pin ?? "----"}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: BingoColors.success,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        game?.status.name.toUpperCase() ?? 'WAITING',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      color: BingoColors.primaryGold,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Prize: \ETB ${game?.prizePool ?? 0}',
                      style: TextStyle(
                        color: BingoColors.primaryGold,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.pattern,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      game?.winPattern.name ?? 'Any Line',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        // Left side - Card and controls
        Expanded(
          flex: 2,
          child: _buildCardSection(),
        ),

        // Right side - Called numbers and players
        Expanded(
          flex: 1,
          child: _buildSidePanel(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    final calledNumbers = ref.watch(calledNumbersProvider);
    final latestNumber = ref.watch(calledNumbersProvider.notifier).latest;
    final players = ref.watch(gamePlayersProvider);
    final currentPlayerId = ref.watch(currentPlayerIdProvider);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Called numbers
          CalledNumbersDisplay(
            calledNumbers: calledNumbers,
            latestNumber: latestNumber,
            maxDisplay: 8,
          ),
          const SizedBox(height: 16),
          // Bingo card
          _buildCardSection(),
          const SizedBox(height: 16),
          // Players list
          PlayerListWidget(
            players: players,
            currentPlayerId: currentPlayerId,
          ), // Space for floating button
        ],
      ),
    );
  }

  Widget _buildCardSection() {
    final playerCard = ref.watch(playerCardProvider);
    
    if (playerCard == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: BingoColors.primaryGold,
        ),
      );
    }
    
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bingo card
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: BingoCardWidget(
                card: playerCard,
                interactive: true,
              ),
            ), // Space for floating button
          ],
        ),
      ),
    );
  }

  Widget _buildSidePanel() {
    final calledNumbers = ref.watch(calledNumbersProvider);
    final latestNumber = ref.watch(calledNumbersProvider.notifier).latest;
    final players = ref.watch(gamePlayersProvider);
    final currentPlayerId = ref.watch(currentPlayerIdProvider);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CalledNumbersDisplay(
            calledNumbers: calledNumbers,
            latestNumber: latestNumber,
          ),
          const SizedBox(height: 16),
          PlayerListWidget(
            players: players,
            currentPlayerId: currentPlayerId,
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBingoButton() {
    final canClaim = ref.watch(canClaimBingoProvider);
    final isClaiming = ref.watch(bingoClaimActionProvider);
    
    return BingoClaimButton(
      onPressed: isClaiming ? null : _onBingoClaimPressed,
      isEnabled: canClaim && !isClaiming,
    );
  }
}
