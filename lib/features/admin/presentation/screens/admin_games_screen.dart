import 'package:eyo_bingo/features/number_bingo/presentation/providers/number_bingo_providers.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Admin Games Management Screen
class AdminGamesScreen extends ConsumerStatefulWidget {
  const AdminGamesScreen({super.key});

  @override
  ConsumerState<AdminGamesScreen> createState() => _AdminGamesScreenState();
}

class _AdminGamesScreenState extends ConsumerState<AdminGamesScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch games on init
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
    final games = ref.watch(availableGamesProvider);
    final isLoading = ref.watch(bingoLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Games', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: Colors.white),
            onPressed: () => ref.read(fetchGamesActionProvider)(),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColors.foundation),
            )
          : games.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(0xFF1E293B).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.games_outlined,
                      size: 64,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'No games yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your first game!',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(fetchGamesActionProvider)(),
              color: AppColors.foundation,
              backgroundColor: Color(0xFF1E293B),
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  final statusColor = _getStatusColor(game.status);

                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: statusColor.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        if (game.status == 'completed') {
                          context.push('/admin/game-details/${game.gameId}');
                        }
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        statusColor,
                                        statusColor.withOpacity(0.7),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.games_rounded,
                                    color: Colors.white,
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      if (game.gamePin != null)
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.pin,
                                              size: 14,
                                              color: Colors.white.withOpacity(
                                                0.6,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'PIN: ${game.gamePin}',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(
                                                  0.6,
                                                ),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
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
                                    color: statusColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: statusColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    game.status.toUpperCase(),
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Stats
                            Row(
                              children: [
                                Expanded(
                                  child: _buildStatItem(
                                    icon: Icons.people_rounded,
                                    label: 'Players',
                                    value:
                                        '${game.currentPlayers}/${game.maxPlayers}',
                                    color: Color(0xFF3B82F6),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatItem(
                                    icon: Icons.attach_money_rounded,
                                    label: 'Entry Fee',
                                    value: '\$${game.playerEntryFee}',
                                    color: Color(0xFF10B981),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatItem(
                                    icon: Icons.pattern_rounded,
                                    label: 'Pattern',
                                    value: game.winningPattern,
                                    color: Color(0xFF8B5CF6),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Actions
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                if (game.status == 'preparing')
                                  _buildActionButton(
                                    label: 'Prepare',
                                    icon: Icons.check_circle_rounded,
                                    color: Color(0xFF3B82F6),
                                    onPressed: () => _handleGameAction(
                                      game.gameId,
                                      'prepare',
                                    ),
                                  ),
                                if (game.status == 'ready')
                                  _buildActionButton(
                                    label: 'Start',
                                    icon: Icons.play_arrow_rounded,
                                    color: Color(0xFF10B981),
                                    onPressed: () =>
                                        _handleGameAction(game.gameId, 'start'),
                                  ),
                                if (game.status == 'active')
                                  _buildActionButton(
                                    label: 'Pause',
                                    icon: Icons.pause_rounded,
                                    color: Color(0xFFF59E0B),
                                    onPressed: () =>
                                        _handleGameAction(game.gameId, 'pause'),
                                  ),
                                if (game.status == 'paused')
                                  _buildActionButton(
                                    label: 'Resume',
                                    icon: Icons.play_arrow_rounded,
                                    color: Color(0xFF10B981),
                                    onPressed: () => _handleGameAction(
                                      game.gameId,
                                      'resume',
                                    ),
                                  ),
                                if (game.status == 'active' ||
                                    game.status == 'paused')
                                  _buildActionButton(
                                    label: 'Stop',
                                    icon: Icons.stop_rounded,
                                    color: Color(0xFFEF4444),
                                    onPressed: () =>
                                        _handleGameAction(game.gameId, 'stop'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.foundation,
              AppColors.foundation.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.foundation.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () => context.push('/admin/create-game'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: Icon(Icons.add_circle_rounded, color: Colors.white),
          label: Text(
            'Create Game',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
}
