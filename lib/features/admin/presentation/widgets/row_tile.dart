import 'package:flutter/material.dart';

class RowTile extends StatelessWidget {
  const RowTile({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            SizedBox(width: 4),
            Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
