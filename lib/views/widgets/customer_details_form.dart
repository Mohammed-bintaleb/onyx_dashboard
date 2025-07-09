import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _buildTextField("Customer Name", "John Doe")),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  "Customer Email",
                  "john.doe@example.com",
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Phone Number
          _buildTextField("Phone Number (Optional)", "123456-7890"),
          const SizedBox(height: 24),

          // Shipping Address
          _buildTextField("Shipping Address", "123 Main St"),
          const SizedBox(height: 24),

          // City and State Row
          Row(
            children: [
              Expanded(child: _buildTextField("City", "Anytown")),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField("State", "CA")),
            ],
          ),
          const SizedBox(height: 24),

          // ZIP Code
          _buildTextField("ZIP Code", "12345"),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // خلفية رمادية للحقل
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[400]!), // حدود رمادية
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextFormField(
            initialValue: initialValue,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: InputBorder.none, // إزالة الحدود الداخلية
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
