import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../data/data_source/customer_form_fields.dart';
import 'customer_form_row.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final fieldBgColor = isDarkMode
        ? const Color(0xFF2C2F4A)
        : Colors.grey[200]!;
    final fieldBorderColor = isDarkMode ? Colors.grey[700]! : Colors.grey[400]!;
    final labelColor = isDarkMode ? Colors.grey[400]! : Colors.grey;
    final inputTextColor = isDarkMode ? Colors.white : Colors.black87;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    Widget buildField(Map<String, dynamic> field) => CustomerFormRow(
      name: field['name'],
      label: t.translate(field['label']),
      initialValue: field['initial'],
      labelColor: labelColor,
      bgColor: fieldBgColor,
      borderColor: fieldBorderColor,
      inputColor: inputTextColor,
      required: field['required'],
    );

    Widget buildRow(List<Map<String, dynamic>> fields) {
      if (isSmallScreen) {
        return Column(
          children: fields
              .map(
                (f) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: buildField(f),
                ),
              )
              .toList(),
        );
      } else {
        return Row(
          children: fields
              .map(
                (f) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: f != fields.last ? 16 : 0),
                    child: buildField(f),
                  ),
                ),
              )
              .toList(),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRow(customerFormFields.sublist(0, 2)),
            const SizedBox(height: 24),
            buildField(customerFormFields[2]),
            const SizedBox(height: 24),
            buildField(customerFormFields[3]),
            const SizedBox(height: 24),
            buildRow(customerFormFields.sublist(4, 6)),
            const SizedBox(height: 24),
            buildField(customerFormFields[6]),
          ],
        ),
      ),
    );
  }
}
