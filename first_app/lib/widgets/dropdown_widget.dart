// lib/widgets/dropdown_widget.dart
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  DropDownWidget({required this.title, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
