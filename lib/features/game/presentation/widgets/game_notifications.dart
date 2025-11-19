import 'package:flutter/material.dart';
import '../../../../shared/theme/bingo_colors.dart';

/// Shows a snackbar notification for game events
class GameNotifications {
  static void showNumberCalled(BuildContext context, int number, String letter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: BingoColors.getBallColor(number),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$letter-$number called!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: BingoColors.cardBackground,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  static void showBingoClaimed(BuildContext context, String playerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.celebration, color: BingoColors.primaryGold),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '$playerName claimed BINGO!',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: BingoColors.success,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showPlayerJoined(BuildContext context, String playerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$playerName joined the game'),
        backgroundColor: BingoColors.info,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showPlayerLeft(BuildContext context, String playerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$playerName left the game'),
        backgroundColor: BingoColors.warning,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
