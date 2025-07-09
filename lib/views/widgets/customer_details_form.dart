import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';
import 'package:onyx_dashboard/views/widgets/chart_custom_container.dart';
import 'package:onyx_dashboard/views/widgets/custom_container.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.sizeOf(context).width * .4;
    return FormBuilder(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Customer Details", style: AppStyles.styleBold32(context)),
            const SizedBox(height: 4),
            Text(
              "Enter the customer's information for the new order",
              style: AppStyles.style16(context),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: fieldWidth,
                  child: _buildField('customer_name', "John Doe"),
                ),
                const SizedBox(width: 16),
                Expanded(child: _buildField('email', "john.doe@example.com")),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: fieldWidth,
              child: _buildField(
                'phone',
                "(123) 456-7890",
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 24),
            _buildField('address', "123 Main St"),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildField('city', "AnyTown")),
                const SizedBox(width: 16),
                Expanded(child: _buildField('state', "CA")),
              ],
            ),
            const SizedBox(height: 24),
            _buildField(
              'zip_code',
              "12345",
              keyboardType: TextInputType.number,
            ),
          ],
        ),
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
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),
      ),
      validator: FormBuilderValidators.compose([
        if (required)
          FormBuilderValidators.required(errorText: "This field is required"),
        if (email) FormBuilderValidators.email(errorText: "Invalid email"),
      ]),
    );
  }
}
