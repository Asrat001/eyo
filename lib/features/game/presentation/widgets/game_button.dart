import 'package:flutter/material.dart';
import '../../../../shared/theme/bingo_colors.dart';

/// Game control button with premium styling
class GameButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final bool isLoading;
  final bool isPrimary;
  final double? width;

  const GameButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color,
    this.isLoading = false,
    this.isPrimary = true,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ??
        (isPrimary ? BingoColors.primaryGold : BingoColors.cellBackground);

    return SizedBox(
      width: width,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: isPrimary ? Colors.black : Colors.white,
          disabledBackgroundColor: buttonColor.withOpacity(0.5),
          elevation: 8,
          shadowColor: buttonColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isPrimary ? Colors.black : Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 24),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Floating BINGO claim button
class BingoClaimButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const BingoClaimButton({
    Key? key,
    this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<BingoClaimButton> createState() => _BingoClaimButtonState();
}

class _BingoClaimButtonState extends State<BingoClaimButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isEnabled ? _pulseAnimation.value : 1.0,
          child: child,
        );
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: widget.isEnabled
              ? BingoColors.winGradient
              : LinearGradient(
                  colors: [Colors.grey, Colors.grey.shade700],
                ),
          boxShadow: widget.isEnabled
              ? [
                  BoxShadow(
                    color: BingoColors.primaryGold.withOpacity(0.6),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isEnabled ? widget.onPressed : null,
            customBorder: const CircleBorder(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.celebration,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'BINGO!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      shadows: const [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
