import 'package:flutter/material.dart';
import '../../../../core/domain/entities/bingo_card.dart';
import '../../../../shared/theme/bingo_colors.dart';

/// Individual bingo cell widget with animations and game aesthetics
class BingoCellWidget extends StatefulWidget {
  final BingoCell cell;
  final VoidCallback? onTap;
  final bool isWinningCell;
  final bool animate;

  const BingoCellWidget({
    Key? key,
    required this.cell,
    this.onTap,
    this.isWinningCell = false,
    this.animate = true,
  }) : super(key: key);

  @override
  State<BingoCellWidget> createState() => _BingoCellWidgetState();
}

class _BingoCellWidgetState extends State<BingoCellWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(BingoCellWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cell.isMarked && !oldWidget.cell.isMarked && widget.animate) {
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient: widget.cell.isMarked
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      BingoColors.cellMarked,
                      BingoColors.cellMarked.withOpacity(0.8),
                    ],
                  )
                : null,
            color: widget.cell.isMarked ? null : BingoColors.cellBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isWinningCell
                  ? BingoColors.primaryGold
                  : widget.cell.isMarked
                      ? BingoColors.cellMarkedBorder
                      : BingoColors.cellBackground.withOpacity(0.3),
              width: widget.isWinningCell ? 3 : 2,
            ),
            boxShadow: widget.cell.isMarked
                ? [
                    BoxShadow(
                      color: BingoColors.cellMarkedBorder.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : widget.isWinningCell
                    ? [
                        BoxShadow(
                          color: BingoColors.primaryGold.withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
          ),
          child: Center(
            child: widget.cell.isFreeSpace
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: BingoColors.primaryGold,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'FREE',
                        style: TextStyle(
                          color: BingoColors.primaryGold,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        widget.cell.number?.toString() ?? '',
                        style: TextStyle(
                          color: widget.cell.isMarked
                              ? Colors.white
                              : Colors.white.withOpacity(0.9),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.cell.isMarked)
                        Positioned.fill(
                          child: CustomPaint(
                            painter: _DauberPainter(
                              color: BingoColors.cellMarkedBorder,
                            ),
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

/// Custom painter for dauber mark effect
class _DauberPainter extends CustomPainter {
  final Color color;

  _DauberPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
