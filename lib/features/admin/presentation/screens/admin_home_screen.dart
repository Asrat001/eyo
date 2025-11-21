import 'package:eyo_bingo/features/auth/presentation/providers/auth_providers.dart';
import 'package:eyo_bingo/features/number_bingo/presentation/providers/number_bingo_providers.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Admin Dashboard Home Screen
class AdminHomeScreen extends ConsumerStatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  ConsumerState<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends ConsumerState<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fetchGamesActionProvider)();
    });
  }

  Future<void> _handleGameAction(String gameId, String action) async {
    final actionProvider = switch (action) {
      'prepare' => ref.read(prepareGameActionProvider),
      'start' => ref.read(startGameActionProvider),
      'pause' => ref.read(pauseGameActionProvider),
      'resume' => ref.read(resumeGameActionProvider),
      'stop' => ref.read(stopGameActionProvider),
      _ => null,
    };

    if (actionProvider == null) return;

    final result = await actionProvider(gameId);

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
        ref.read(fetchGamesActionProvider)();
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $error'),
            backgroundColor: Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final games = ref.watch(availableGamesProvider);
    final isLoading = ref.watch(bingoLoadingProvider);

    final activeGames = games.where((g) => g.status == 'active').length;
    final readyGames = games.where((g) => g.status == 'ready').length;
    final totalPlayers = games.fold<int>(
      0,
      (sum, game) => sum + game.currentPlayers,
    );

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: RefreshIndicator(
        onRefresh: () => ref.read(fetchGamesActionProvider)(),
        color: AppColors.foundation,
        backgroundColor: AppColors.primary,
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              backgroundColor: Color(0xFF0A0E27),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF3B82F6),
                        Color(0xFF2563EB),
                        Color(0xFF0A0E27),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.admin_panel_settings,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome back,',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      user?.username ?? 'Admin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
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
                                  color: Color(0xFFFBBF24).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFFFBBF24),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.stars,
                                      color: Color(0xFFFBBF24),
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '${user?.credits ?? 0}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.refresh_rounded, color: Colors.white),
                  onPressed: () => ref.read(fetchGamesActionProvider)(),
                ),
              ],
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Statistics Grid
                    if (isLoading)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(
                            color: AppColors.foundation,
                          ),
                        ),
                      )
                    else
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.24,
                        children: [
                          _buildStatCard(
                            title: 'Total Games',
                            value: '${games.length}',
                            icon: Icons.games_rounded,
                            gradient: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                          ),
                          _buildStatCard(
                            title: 'Active Games',
                            value: '$activeGames',
                            icon: Icons.play_circle_rounded,
                            gradient: [Color(0xFF10B981), Color(0xFF059669)],
                          ),
                          _buildStatCard(
                            title: 'Ready Games',
                            value: '$readyGames',
                            icon: Icons.check_circle_rounded,
                            gradient: [Color(0xFFF59E0B), Color(0xFFD97706)],
                          ),
                          _buildStatCard(
                            title: 'Total Players',
                            value: '$totalPlayers',
                            icon: Icons.people_rounded,
                            gradient: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                          ),
                        ],
                      ),

                    SizedBox(height: 16),

                    // Recent Games
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RECENT GAMES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.push('/admin/all-games'),
                          child: Text(
                            'View All',
                            style: TextStyle(color: AppColors.foundation),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    if (games.isEmpty)
                      Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.games_outlined,
                                size: 60,
                                color: Colors.white,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'No games yet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Create your first game to get started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      // Sort by creation date and take only 3 latest
                      ...(games.toList()..sort(
                            (a, b) => b.createdAt.compareTo(a.createdAt),
                          ))
                          .take(3)
                          .map(
                            (game) => Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: InkWell(
                                onTap: () {
                                  if (game.status == 'completed') {
                                    context.push(
                                      '/admin/game-details/${game.gameId}',
                                    );
                                  }
                                },
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1E293B),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: _getStatusColor(
                                            game.status,
                                          ).withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.games_rounded,
                                          color: _getStatusColor(game.status),
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Game #${game.gameId}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '${game.currentPlayers}/${game.maxPlayers} players • ${game.status}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (game.status == 'completed')
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      else ...[
                                        if (game.status == 'preparing')
                                          IconButton(
                                            icon: Icon(
                                              Icons.check_circle_rounded,
                                              color: Color(0xFF3B82F6),
                                            ),
                                            onPressed: () => _handleGameAction(
                                              game.gameId,
                                              'prepare',
                                            ),
                                            tooltip: 'Prepare Game',
                                          ),
                                        if (game.status == 'ready')
                                          IconButton(
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: Color(0xFF10B981),
                                            ),
                                            onPressed: () => _handleGameAction(
                                              game.gameId,
                                              'start',
                                            ),
                                            tooltip: 'Start Game',
                                          ),
                                        if (game.status == 'active')
                                          IconButton(
                                            icon: Icon(
                                              Icons.pause_rounded,
                                              color: Color(0xFFF59E0B),
                                            ),
                                            onPressed: () => _handleGameAction(
                                              game.gameId,
                                              'pause',
                                            ),
                                            tooltip: 'Pause Game',
                                          ),
                                        if (game.status == 'paused')
                                          IconButton(
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: Color(0xFF10B981),
                                            ),
                                            onPressed: () => _handleGameAction(
                                              game.gameId,
                                              'resume',
                                            ),
                                            tooltip: 'Resume Game',
                                          ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withOpacity(0.4),
            blurRadius: 24,
            offset: Offset(0, 12),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 2),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    return switch (status) {
      'preparing' => Colors.grey,
      'ready' => Color(0xFF3B82F6),
      'active' => Color(0xFF10B981),
      'paused' => Color(0xFFF59E0B),
      'completed' => Color(0xFF8B5CF6),
      _ => Colors.grey,
    };
  }
}
