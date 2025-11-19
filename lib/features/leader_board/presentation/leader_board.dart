import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Demo data - in production this would come from a provider/repository
  final List<LeaderboardPlayer> _allTimePlayers = [
    LeaderboardPlayer(rank: 1, name: 'Champion Player', wins: 156, gamesPlayed: 200, avatar: '🏆'),
    LeaderboardPlayer(rank: 2, name: 'Pro Gamer', wins: 142, gamesPlayed: 195, avatar: '⭐'),
    LeaderboardPlayer(rank: 3, name: 'Lucky Star', wins: 128, gamesPlayed: 180, avatar: '🌟'),
    LeaderboardPlayer(rank: 4, name: 'Bingo Master', wins: 115, gamesPlayed: 175, avatar: '🎯'),
    LeaderboardPlayer(rank: 5, name: 'Card Shark', wins: 98, gamesPlayed: 160, avatar: '🦈'),
    LeaderboardPlayer(rank: 6, name: 'Number Ninja', wins: 87, gamesPlayed: 150, avatar: '🥷'),
    LeaderboardPlayer(rank: 7, name: 'Pattern Pro', wins: 76, gamesPlayed: 140, avatar: '🎨'),
    LeaderboardPlayer(rank: 8, name: 'Grid Guru', wins: 65, gamesPlayed: 130, avatar: '🧙'),
    LeaderboardPlayer(rank: 9, name: 'Caller King', wins: 54, gamesPlayed: 120, avatar: '👑'),
    LeaderboardPlayer(rank: 10, name: 'Dauber Dan', wins: 43, gamesPlayed: 110, avatar: '✨'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events, color: Colors.amber, size: 32),
                        SizedBox(width: 12),
                        Text(
                          'Leaderboard',
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Tabs
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1A202C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.amber.shade600, Colors.amber.shade800],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColors.lightGrey.withOpacity(0.6),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        tabs: [
                          Tab(text: 'All Time'),
                          Tab(text: 'Weekly'),
                          Tab(text: 'Monthly'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildLeaderboardContent(_allTimePlayers),
                    _buildLeaderboardContent(_allTimePlayers.take(7).toList()),
                    _buildLeaderboardContent(_allTimePlayers.take(5).toList()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardContent(List<LeaderboardPlayer> players) {
    if (players.length < 3) {
      return Center(
        child: Text(
          'Not enough data',
          style: TextStyle(color: AppColors.lightGrey),
        ),
      );
    }

    return Column(
      children: [
        // Top 3 Podium
        _buildPodium(players.take(3).toList()),
        
        SizedBox(height: 16),
        
        // Rest of the rankings
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: players.length - 3,
            itemBuilder: (context, index) {
              return _buildRankingCard(players[index + 3]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPodium(List<LeaderboardPlayer> topThree) {
    // Reorder for podium display: 2nd, 1st, 3rd
    final second = topThree[1];
    final first = topThree[0];
    final third = topThree[2];

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 2nd Place
          _buildPodiumPlace(second, 2, 140, Colors.grey.shade400),
          SizedBox(width: 12),
          // 1st Place
          _buildPodiumPlace(first, 1, 180, Colors.amber),
          SizedBox(width: 12),
          // 3rd Place
          _buildPodiumPlace(third, 3, 120, Colors.orange.shade700),
        ],
      ),
    );
  }

  Widget _buildPodiumPlace(LeaderboardPlayer player, int place, double height, Color color) {
    return Expanded(
      child: Column(
        children: [
          // Avatar
          Container(
            width: place == 1 ? 80 : 60,
            height: place == 1 ? 80 : 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.8),
                  color,
                ],
              ),
              border: Border.all(color: color, width: 3),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                player.avatar,
                style: TextStyle(fontSize: place == 1 ? 40 : 30),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Name
          Text(
            player.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.lightGrey,
              fontSize: place == 1 ? 14 : 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          // Wins
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${player.wins} wins',
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          // Podium
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color.withOpacity(0.6),
                  color.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              border: Border.all(color: color, width: 2),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    place == 1 ? Icons.emoji_events : Icons.military_tech,
                    color: Colors.white,
                    size: place == 1 ? 40 : 30,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '#$place',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: place == 1 ? 24 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingCard(LeaderboardPlayer player) {
    final winRate = (player.wins / player.gamesPlayed * 100).toStringAsFixed(1);
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2D3748),
            Color(0xFF1A202C),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.amber.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                '#${player.rank}',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.purple.shade400, Colors.purple.shade700],
              ),
            ),
            child: Center(
              child: Text(player.avatar, style: TextStyle(fontSize: 24)),
            ),
          ),
          SizedBox(width: 16),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.name,
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.emoji_events, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text(
                      '${player.wins} wins',
                      style: TextStyle(
                        color: AppColors.lightGrey.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.sports_esports, color: Colors.blue, size: 14),
                    SizedBox(width: 4),
                    Text(
                      '${player.gamesPlayed} games',
                      style: TextStyle(
                        color: AppColors.lightGrey.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Win Rate
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade600, Colors.green.shade800],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$winRate%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model class for leaderboard player
class LeaderboardPlayer {
  final int rank;
  final String name;
  final int wins;
  final int gamesPlayed;
  final String avatar;

  LeaderboardPlayer({
    required this.rank,
    required this.name,
    required this.wins,
    required this.gamesPlayed,
    required this.avatar,
  });
}
