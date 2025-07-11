import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomerFormRow extends StatelessWidget {
  final String name;
  final String label;
  final String initialValue;
  final Color labelColor;
  final Color bgColor;
  final Color borderColor;
  final Color inputColor;
  final bool required;

  const CustomerFormRow({
    super.key,
    required this.name,
    required this.label,
    required this.initialValue,
    required this.labelColor,
    required this.bgColor,
    required this.borderColor,
    required this.inputColor,
    this.required = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FormBuilderTextField(
            name: name,
            initialValue: initialValue,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: inputColor,
            ),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            validator: required
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
