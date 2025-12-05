import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.enabled = true,
    this.helperText,
    this.keyboardType,
    this.validator,
  });
    final TextEditingController controller;
    final String label;
    final String hint;
    final IconData icon;
    final bool enabled;
    final String? helperText;
    final TextInputType? keyboardType;
    final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          enabled: enabled,
          validator: validator,
          style: TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
            helperText: helperText,
            helperStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
            prefixIcon: Icon(icon, color: Color(0xFF3B82F6)),
            filled: true,
            fillColor: Color(0xFF1E293B),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF3B82F6), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFEF4444)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFEF4444), width: 2),
            ),
            errorStyle: TextStyle(color: Color(0xFFEF4444)),
          ),
        ),
      ],
    );
  }
}