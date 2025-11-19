
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
        required this.hintText,
        required this.labelText,
        required this.controller,
        required this.obscureText,
        required this.keyboardType,
        this.prefixIcon,
        this.suffixIcon,
        this.validator,
        this.onChanged,
        this.onFieldSubmitted
      });

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$labelText',
          style:  TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            fontWeight: FontWeight.w400, // Medium weight for the label
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4), // Space between label and field
        SizedBox(
          height: 40,
          child: TextFormField(
            style: const TextStyle(
              color:AppColors.primary,
              fontSize: 16,
            ),
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: '$hintText',
              // Optional placeholder; matches the empty state
              hintStyle:  TextStyle(
                color: Colors.grey.shade50, // White with ~38% opacity
                fontSize: 12,
              ),

              filled: true,
              fillColor:  AppColors.secondary,
              prefixIcon: suffixIcon,

              // Exact field background
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                // Fully rounded corners
                borderSide: BorderSide.none, // No border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide:  BorderSide(
                  color: Colors.grey.shade500,
                  // Optional gold focus ring to match app theme
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  // Optional gold focus ring to match app theme
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }}