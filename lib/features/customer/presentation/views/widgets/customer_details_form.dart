import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // ألوان حسب الوضع
    final fieldBackgroundColor = isDarkMode
        ? const Color(0xFF2C2F4A)
        : Colors.grey[200]!;
    final fieldBorderColor = isDarkMode ? Colors.grey[700]! : Colors.grey[400]!;
    final labelColor = isDarkMode ? Colors.grey[400]! : Colors.grey;
    final inputTextColor = isDarkMode ? Colors.white : Colors.black87;

    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSmallScreen) ...[
              _buildFormField(
                "customer_name",
                "Customer Name",
                "John Doe",
                labelColor,
                fieldBackgroundColor,
                fieldBorderColor,
                inputTextColor,
              ),
              const SizedBox(height: 16),
              _buildFormField(
                "customer_email",
                "Customer Email",
                "john.doe@example.com",
                labelColor,
                fieldBackgroundColor,
                fieldBorderColor,
                inputTextColor,
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      "customer_name",
                      "Customer Name",
                      "John Doe",
                      labelColor,
                      fieldBackgroundColor,
                      fieldBorderColor,
                      inputTextColor,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildFormField(
                      "customer_email",
                      "Customer Email",
                      "john.doe@example.com",
                      labelColor,
                      fieldBackgroundColor,
                      fieldBorderColor,
                      inputTextColor,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            _buildFormField(
              "phone",
              "Phone Number (Optional)",
              "123456-7890",
              labelColor,
              fieldBackgroundColor,
              fieldBorderColor,
              inputTextColor,
              required: false,
            ),
            const SizedBox(height: 24),
            _buildFormField(
              "address",
              "Shipping Address",
              "123 Main St",
              labelColor,
              fieldBackgroundColor,
              fieldBorderColor,
              inputTextColor,
            ),
            const SizedBox(height: 24),
            if (isSmallScreen) ...[
              _buildFormField(
                "city",
                "City",
                "Anytown",
                labelColor,
                fieldBackgroundColor,
                fieldBorderColor,
                inputTextColor,
              ),
              const SizedBox(height: 16),
              _buildFormField(
                "state",
                "State",
                "CA",
                labelColor,
                fieldBackgroundColor,
                fieldBorderColor,
                inputTextColor,
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      "city",
                      "City",
                      "Anytown",
                      labelColor,
                      fieldBackgroundColor,
                      fieldBorderColor,
                      inputTextColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildFormField(
                      "state",
                      "State",
                      "CA",
                      labelColor,
                      fieldBackgroundColor,
                      fieldBorderColor,
                      inputTextColor,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            _buildFormField(
              "zip",
              "ZIP Code",
              "12345",
              labelColor,
              fieldBackgroundColor,
              fieldBorderColor,
              inputTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    String name,
    String label,
    String initialValue,
    Color labelColor,
    Color backgroundColor,
    Color borderColor,
    Color inputTextColor, {
    bool required = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
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
              color: inputTextColor,
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
