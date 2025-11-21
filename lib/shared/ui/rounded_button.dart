import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.showArrow = false,
    this.isLoading = false,
  });

  final String buttonText;
  final VoidCallback? onPressed;
  final bool showArrow;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.foundation,
          disabledBackgroundColor: AppColors.foundation.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  if (showArrow) Icon(Icons.arrow_forward_outlined),
                ],
              ),
      ),
    );
  }
}
