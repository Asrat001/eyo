import 'package:flutter/material.dart';
import '../../../../core/domain/entities/player.dart';
import '../../../../shared/theme/bingo_colors.dart';

/// Displays list of players in the game
class PlayerListWidget extends StatelessWidget {
  final List<Player> players;
  final String? currentPlayerId;
  final String? winnerId;

  const PlayerListWidget({
    Key? key,
    required this.players,
    this.currentPlayerId,
    this.winnerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: BingoColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: BingoColors.cardBorder.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                color: BingoColors.primaryGold,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Players',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: BingoColors.primaryGold.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${players.length}',
                  style: TextStyle(
                    color: BingoColors.primaryGold,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.white24),
          const SizedBox(height: 8),
          ...players.map((player) => _buildPlayerTile(player)),
        ],
      ),
    );
  }

  Widget _buildPlayerTile(Player player) {
    final isCurrentPlayer = player.id == currentPlayerId;
    final isWinner = player.id == winnerId;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isCurrentPlayer
            ? BingoColors.primaryGold.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCurrentPlayer
              ? BingoColors.primaryGold.withOpacity(0.5)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  BingoColors.primaryGold,
                  BingoColors.accentAmber,
                ],
              ),
            ),
            child: Center(
              child: Text(
                player.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        player.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: isCurrentPlayer
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isCurrentPlayer) ...[
                      const SizedBox(width: 4),
                      Text(
                        '(You)',
                        style: TextStyle(
                          color: BingoColors.primaryGold,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
                if (player.totalWins > 0)
                  Text(
                    '${player.totalWins} wins',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),
          
          // Status indicators
          if (isWinner)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                gradient: BingoColors.winGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.emoji_events, size: 14, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    'WINNER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          else if (player.isOnline)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: BingoColors.success,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: BingoColors.success.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
