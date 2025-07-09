import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Customer Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("Enter the customer's information for the new order"),
          const SizedBox(height: 16),
          _buildField(
            'customer_name',
            "Customer Name",
            required: true,
            initialValue: "John Doe",
          ),
          _buildField(
            'phone',
            "Phone Number (Optional)",
            initialValue: "(123) 456-7890",
            keyboardType: TextInputType.phone,
          ),
          _buildField(
            'address',
            "Shipping Address",
            required: true,
            initialValue: "123 Main St",
          ),
          _buildField('city', "City", required: true, initialValue: "Anytown"),
          _buildField(
            'zip_code',
            "ZIP Code",
            required: true,
            initialValue: "12345",
            keyboardType: TextInputType.number,
          ),
          _buildField(
            'email',
            "Customer Email",
            required: true,
            email: true,
            initialValue: "john.doe@example.com",
          ),
          _buildField('state', "State", initialValue: "CA"),
        ],
      ),
    );
  }

  Widget _buildField(
    String name,
    String label, {
    bool required = false,
    bool email = false,
    String? initialValue,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: FormBuilderTextField(
        name: name,
        initialValue: initialValue,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: FormBuilderValidators.compose([
          if (required)
            FormBuilderValidators.required(errorText: "This field is required"),
          if (email) FormBuilderValidators.email(errorText: "Invalid email"),
        ]),
      ),
    );
  }
}
