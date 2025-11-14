
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.buttonText, required this.onPressed,this.showArrow=false});

  final String buttonText;
  final VoidCallback onPressed;
  final bool showArrow;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.foundation,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Text(
              buttonText,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            if(showArrow)
            Icon(Icons.arrow_forward_outlined)
          ],
        ),
      ),
    );
  }
}
