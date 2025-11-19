import 'package:flutter/material.dart';
import '../../../../shared/theme/bingo_colors.dart';

/// Displays the latest called numbers in an attractive ball format
class CalledNumbersDisplay extends StatelessWidget {
  final List<int> calledNumbers;
  final int? latestNumber;
  final int maxDisplay;

  const CalledNumbersDisplay({
    Key? key,
    required this.calledNumbers,
    this.latestNumber,
    this.maxDisplay = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayNumbers = calledNumbers.reversed.take(maxDisplay).toList();

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
                Icons.history,
                color: BingoColors.primaryGold,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Called Numbers',
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
                  '${calledNumbers.length}/75',
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
          
          // Latest number (large)
          if (latestNumber != null) ...[
            Center(
              child: _buildBall(
                latestNumber!,
                size: 80,
                isLatest: true,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.white24),
            const SizedBox(height: 12),
          ],
          
          // Recent numbers (small)
          if (displayNumbers.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: displayNumbers
                  .where((n) => n != latestNumber)
                  .map((number) => _buildBall(number, size: 40))
                  .toList(),
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No numbers called yet',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBall(int number, {double size = 40, bool isLatest = false}) {
    final color = BingoColors.getBallColor(number);
    final letter = BingoColors.getBallLetter(number);

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: isLatest ? 500 : 0),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: isLatest ? value : 1.0,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  color,
                  color.withOpacity(0.8),
                ],
                stops: const [0.6, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: isLatest ? 20 : 8,
                  spreadRadius: isLatest ? 2 : 1,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Shine effect
                Positioned(
                  top: size * 0.15,
                  left: size * 0.25,
                  child: Container(
                    width: size * 0.3,
                    height: size * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                // Number
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLatest && size > 60)
                      Text(
                        letter,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size * 0.2,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    Text(
                      number.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size * (isLatest ? 0.35 : 0.5),
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
