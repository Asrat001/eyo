import 'package:eyo_bingo/core/data/models/bingo/bingo_game_detail_model.dart';
import 'package:eyo_bingo/core/utils/network_exceptions_utils.dart';
import 'package:eyo_bingo/features/number_bingo/presentation/providers/number_bingo_providers.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Game Details and Management Screen
class GameDetailsScreen extends ConsumerStatefulWidget {
  final String gameId;

  const GameDetailsScreen({super.key, required this.gameId});

  @override
  ConsumerState<GameDetailsScreen> createState() => GameDetailsScreenState();
}

class GameDetailsScreenState extends ConsumerState<GameDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.invalidate(fetchGameDetailsProvider(widget.gameId));
    });
  }

  double _totalPrizePool(BingoGameDetailModel game) {
    final entryFee = game.playerEntryFee;
    final totalPlayers = game.currentPlayers;
    final totalPot = entryFee * totalPlayers;
    final profitPercent = game.profitPercentage;
    return totalPot * (1 - (profitPercent / 100));
  }

  Future<void> _handleGameAction({
    required String action,
    required BingoGameDetailModel game,
  }) async {
    final actionProvider = switch (action) {
      'prepare' => ref.read(prepareGameActionProvider),
      'start' => ref.read(startGameActionProvider),
      'pause' => ref.read(pauseGameActionProvider),
      'resume' => ref.read(resumeGameActionProvider),
      'stop' => ref.read(stopGameActionProvider),
      _ => null,
    };

    if (actionProvider == null) return;

    final result = await actionProvider(game.gameId);

    if (!mounted) return;

    result.when(
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Game ${action}d successfully!'),
            backgroundColor: Color(0xFF10B981),
            behavior: SnackBarBehavior.floating,
          ),
        );
        // Refresh game list and reload details
        ref.invalidate(fetchGameDetailsProvider(widget.gameId));
        Future.delayed(Duration(milliseconds: 500), () {});
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${NetworkExceptions.getErrorMessage(error)}'),
            backgroundColor: Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameDetailsAsync = ref.watch(fetchGameDetailsProvider(widget.gameId));

    return gameDetailsAsync.when(
      loading: () {
        return Scaffold(
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        );
      },
      error: (err, st) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(fetchGameDetailsProvider(widget.gameId));
            },
            child: Center(
              child: Text(
                'Error Loading Game Detail : ${err.toString()}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      data: (game) {
        if (game == null) return Text("Game not found");

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            title: Text(
              'Game #${game!.gameId}',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh_rounded, color: Colors.white),
                onPressed: () {
                  ref.read(fetchGamesActionProvider)();
                  Future.delayed(Duration(milliseconds: 500), () {});
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Prize Pool Card
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8B5CF6).withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRIZE POOL',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${_totalPrizePool(game).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.emoji_events_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Winner Section
                if (game!.winners.isNotEmpty) ...[
                  _buildSectionTitle('WINNER'),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xFF10B981), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF10B981).withOpacity(0.2),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: game!.winners.map((winner) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(
                                0xFF10B981,
                              ).withOpacity(0.2),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF10B981),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    winner.cardNumber.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Card #${winner.cardNumber}',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF10B981).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'WINNER',
                                style: TextStyle(
                                  color: Color(0xFF10B981),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 24),
                ],

                // Called Numbers
                if (game!.calledNumbers.isNotEmpty) ...[
                  _buildSectionTitle(
                    'CALLED NUMBERS (${game!.calledNumbers.length})',
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: game!.calledNumbers.reversed.map((number) {
                        final isLast = number == game!.calledNumbers.last;
                        return Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isLast
                                ? AppColors.foundation
                                : Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: isLast
                                ? Border.all(color: Colors.white, width: 2)
                                : null,
                          ),
                          child: Text(
                            '$number',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: isLast
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 24),
                ],

                // Game Info
                _buildSectionTitle('GAME INFORMATION'),
                SizedBox(height: 12),
                _buildInfoCard([
                  _buildInfoRow(Icons.tag, 'Game ID', game!.gameId),
                  _buildInfoRow(Icons.person, 'Created By', "blank"),
                  _buildInfoRow(
                    Icons.calendar_today,
                    'Created',
                    _formatDateTime(game.startedAt),
                  ),
                
                    _buildInfoRow(
                      Icons.play_circle,
                      'Started',
                      _formatDateTime(game.startedAt),
                    ),
              
                    _buildInfoRow(
                      Icons.check_circle,
                      'Completed',
                      _formatDateTime(game.completedAt),
                    ),
                ]),

                SizedBox(height: 24),

                // Game Settings
                _buildSectionTitle('GAME SETTINGS'),
                SizedBox(height: 12),
                _buildInfoCard([
                  _buildInfoRow(
                    Icons.people,
                    'Players',
                    '${game!.currentPlayers}/${game!.maxPlayers}',
                  ),
                  _buildInfoRow(
                    Icons.pattern,
                    'Winning Pattern',
                    game!.winningPattern,
                  ),
                  _buildInfoRow(
                    Icons.timer,
                    'Auto Call Interval',
                    '${game!.autoCallInterval}ms',
                  ),
                  if (game!.markingMode != null)
                    _buildInfoRow(
                      Icons.edit,
                      'Marking Mode',
                      game!.markingMode!,
                    ),
                  if (game!.playerEntryFee != null)
                    _buildInfoRow(
                      Icons.attach_money,
                      'Entry Fee',
                      '\$${game!.playerEntryFee}',
                    ),
                  if (game!.profitPercentage != null)
                    _buildInfoRow(
                      Icons.percent,
                      'Profit %',
                      '${game!.profitPercentage}%',
                    ),
                ]),

                SizedBox(height: 24),

                // Game Stats (for completed games)
                if (game!.status == 'completed') ...[
                  _buildSectionTitle('GAME STATISTICS'),
                  SizedBox(height: 12),
                  _buildInfoCard([
                
                      _buildInfoRow(
                        Icons.numbers,
                        'Numbers Called',
                        '${game.calledNumbers.length}',
                      ),
                      _buildInfoRow(
                        Icons.emoji_events,
                        'Has Winner',
                        game.winners.isNotEmpty ? 'Yes' : 'No',
                      ),
                    _buildInfoRow(
                      Icons.people_outline,
                      'Total Players',
                      '${game.currentPlayers}',
                    ),
                  ]),
                  SizedBox(height: 24),
                ],

                // Players List
                if (game.currentPlayers!=0) ...[
                  _buildSectionTitle('PLAYERS (${game.currentPlayers})'),
                  SizedBox(height: 12),
                  // Container(
                  //   padding: EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFF1E293B),
                  //     borderRadius: BorderRadius.circular(16),
                  //     border: Border.all(
                  //       color: Colors.white.withOpacity(0.1),
                  //       width: 1,
                  //     ),
                  //   ),
                  //   child: Column(
                  //     children: game.players.map((player) {
                  //       final playerName = player is Map
                  //           ? player['username'] ?? 'Unknown'
                  //           : player.toString();
                  //       return Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8),
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               padding: EdgeInsets.all(8),
                  //               decoration: BoxDecoration(
                  //                 color: AppColors.foundation.withOpacity(0.2),
                  //                 borderRadius: BorderRadius.circular(8),
                  //               ),
                  //               child: Icon(
                  //                 Icons.person,
                  //                 color: AppColors.foundation,
                  //                 size: 20,
                  //               ),
                  //             ),
                  //             SizedBox(width: 12),
                  //             Text(
                  //               playerName,
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 16,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  // SizedBox(height: 24),
                ],

                // Action Buttons
                _buildSectionTitle('ACTIONS'),
                SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    if (game.status == 'preparing')
                      _buildActionButton(
                        'Prepare Game',
                        Icons.check_circle_rounded,
                        Color(0xFF3B82F6),
                        () => _handleGameAction(action: 'prepare', game: game),
                      ),
                    if (game.status == 'ready')
                      _buildActionButton(
                        'Start Game',
                        Icons.play_arrow_rounded,
                        Color(0xFF10B981),
                        () => _handleGameAction(action: 'start', game: game),
                      ),
                    if (game.status == 'active')
                      _buildActionButton(
                        'Pause Game',
                        Icons.pause_rounded,
                        Color(0xFFF59E0B),
                        () => _handleGameAction(action: 'pause', game: game),
                      ),
                    if (game.status == 'paused')
                      _buildActionButton(
                        'Resume Game',
                        Icons.play_arrow_rounded,
                        Color(0xFF10B981),
                        () => _handleGameAction(action: 'resume', game: game),
                      ),
                    if (game.status == 'active' || game.status == 'paused')
                      _buildActionButton(
                        'Stop Game',
                        Icons.stop_rounded,
                        Color(0xFFEF4444),
                        () => _handleGameAction(action: "stop", game: game),
                      ),
                  ],
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.foundation.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.foundation, size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    return switch (status) {
      'preparing' => Color(0xFF6B7280),
      'ready' => Color(0xFF3B82F6),
      'active' => Color(0xFF10B981),
      'paused' => Color(0xFFF59E0B),
      'completed' => Color(0xFF8B5CF6),
      _ => Color(0xFF6B7280),
    };
  }

  String _formatDateTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
