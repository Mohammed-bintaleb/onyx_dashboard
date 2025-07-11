import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    "customer_name",
                    "Customer Name",
                    "John Doe",
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildFormField(
                    "customer_email",
                    "Customer Email",
                    "john.doe@example.com",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildFormField(
              "phone",
              "Phone Number (Optional)",
              "123456-7890",
              required: false,
            ),
            const SizedBox(height: 24),
            _buildFormField("address", "Shipping Address", "123 Main St"),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildFormField("city", "City", "Anytown")),
                const SizedBox(width: 16),
                Expanded(child: _buildFormField("state", "State", "CA")),
              ],
            ),
            const SizedBox(height: 24),
            _buildFormField("zip", "ZIP Code", "12345"),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    String name,
    String label,
    String initialValue, {
    bool required = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[400]!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FormBuilderTextField(
            name: name,
            initialValue: initialValue,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
