
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.buttonText, required this.onPressed, required this.fullWidth});

  final String buttonText;
  final VoidCallback onPressed;
  final bool fullWidth;



  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width:fullWidth? double.infinity:MediaQuery.of(context).size.width*0.56,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  Text(
          buttonText,
          style: TextStyle(fontSize: 12, color:AppColors.extraLightGrey,fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
