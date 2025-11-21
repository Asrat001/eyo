import 'package:eyo_bingo/features/number_bingo/presentation/providers/number_bingo_providers.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// All Games Screen with Filtering
class AllGamesScreen extends ConsumerStatefulWidget {
  const AllGamesScreen({super.key});

  @override
  ConsumerState<AllGamesScreen> createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends ConsumerState<AllGamesScreen> {
  String _selectedFilter =
      'all'; // all, active, ready, preparing, completed, paused

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
    final allGames = ref.watch(availableGamesProvider);
    final isLoading = ref.watch(bingoLoadingProvider);

    // Filter games based on selected filter
    final filteredGames = _selectedFilter == 'all'
        ? allGames
        : allGames.where((game) => game.status == _selectedFilter).toList();

    // Sort by creation date (newest first)
    filteredGames.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text('All Games', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: Colors.white),
            onPressed: () => ref.read(fetchGamesActionProvider)(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', 'all', allGames.length),
                  SizedBox(width: 8),
                  _buildFilterChip(
                    'Active',
                    'active',
                    allGames.where((g) => g.status == 'active').length,
                  ),
                  SizedBox(width: 8),
                  _buildFilterChip(
                    'Ready',
                    'ready',
                    allGames.where((g) => g.status == 'ready').length,
                  ),
                  SizedBox(width: 8),
                  _buildFilterChip(
                    'Preparing',
                    'preparing',
                    allGames.where((g) => g.status == 'preparing').length,
                  ),
                  SizedBox(width: 8),
                  _buildFilterChip(
                    'Paused',
                    'paused',
                    allGames.where((g) => g.status == 'paused').length,
                  ),
                  SizedBox(width: 8),
                  _buildFilterChip(
                    'Completed',
                    'completed',
                    allGames.where((g) => g.status == 'completed').length,
                  ),
                ],
              ),
            ),
          ),

          // Games List
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.foundation,
                    ),
                  )
                : filteredGames.isEmpty
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
                          'No ${_selectedFilter == 'all' ? '' : _selectedFilter} games',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Try a different filter',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () => ref.read(fetchGamesActionProvider)(),
                    color: AppColors.foundation,
                    backgroundColor: Color(0xFF1E293B),
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = filteredGames[index];
                        final statusColor = _getStatusColor(game.status);

                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (game.status == 'completed') {
                                context.push('/admin/game-details/${game.id}');
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'PIN: ${game.gamePin}',
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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

                                  SizedBox(height: 16),

                                  // Stats
                                  Row(
                                    children: [
                                      _buildStatChip(
                                        Icons.people_rounded,
                                        '${game.currentPlayers}/${game.maxPlayers}',
                                        Color(0xFF3B82F6),
                                      ),
                                      SizedBox(width: 8),
                                      _buildStatChip(
                                        Icons.pattern_rounded,
                                        game.winningPattern,
                                        Color(0xFF8B5CF6),
                                      ),
                                      SizedBox(width: 8),
                                      _buildStatChip(
                                        Icons.person,
                                        game.createdBy,
                                        Color(0xFF10B981),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12),

                                  // Date
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        _formatDate(game.createdAt),
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 12,
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
                                          onPressed: () => _handleGameAction(
                                            game.gameId,
                                            'start',
                                          ),
                                        ),
                                      if (game.status == 'active')
                                        _buildActionButton(
                                          label: 'Pause',
                                          icon: Icons.pause_rounded,
                                          color: Color(0xFFF59E0B),
                                          onPressed: () => _handleGameAction(
                                            game.gameId,
                                            'pause',
                                          ),
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
                                          onPressed: () => _handleGameAction(
                                            game.gameId,
                                            'stop',
                                          ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, int count) {
    final isSelected = _selectedFilter == value;
    final color = _getFilterColor(value);

    return InkWell(
      onTap: () => setState(() => _selectedFilter = value),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(colors: [color, color.withOpacity(0.8)])
              : null,
          color: isSelected ? null : Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.white.withOpacity(0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.2)
                    : color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 16),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
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

  Color _getFilterColor(String filter) {
    return switch (filter) {
      'all' => AppColors.foundation,
      'active' => Color(0xFF10B981),
      'ready' => Color(0xFF3B82F6),
      'preparing' => Color(0xFF6B7280),
      'paused' => Color(0xFFF59E0B),
      'completed' => Color(0xFF8B5CF6),
      _ => AppColors.foundation,
    };
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
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
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
