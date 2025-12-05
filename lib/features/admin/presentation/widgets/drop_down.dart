import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.items,
    required this.onChanged,
  });

    final String label;
    final String value;
    final IconData icon;
    final List<DropdownItem> items;
    final void Function(String?) onChanged;

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
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            dropdownColor: Color(0xFF1E293B),
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Color(0xFF3B82F6)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item.value,
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(width: 12),
                    Text(item.label, style: TextStyle(color: Colors.white)),
                  ],
                ),
              );
            }).toList(),
            onChanged: onChanged,
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
class DropdownItem {
  final String value;
  final String label;
  final IconData icon;

  DropdownItem(this.value, this.label, this.icon);
}