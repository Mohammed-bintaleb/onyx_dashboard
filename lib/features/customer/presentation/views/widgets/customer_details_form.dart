import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/data_source/customer_form_fields.dart';
import '../../manger/flutter_form_builder_cubit/flutter_form_builder_cubit.dart';
import 'customer_form_row.dart';

class CustomerDetailsForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const CustomerDetailsForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isDark = context.isDarkMode;
    final fieldBgColor = isDark
        ? AppColors.darkFieldBg
        : AppColors.lightFieldBg;
    final fieldBorderColor = isDark
        ? AppColors.darkBorder
        : AppColors.lightBorder;
    final labelColor = isDark ? AppColors.darkLabel : AppColors.lightLabel;
    final inputTextColor = isDark ? AppColors.darkText : AppColors.lightText;

    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    Widget buildField(Map<String, dynamic> field) {
      return BlocBuilder<FlutterFormBuilderCubit, FlutterFormBuilderState>(
        builder: (context, formState) {
          final currentValue =
              formState.fields[field['name']]?.toString() ?? '';
          return CustomerFormRow(
            name: field['name'],
            label: t.translate(field['label']),
            hintText: field['hint'],
            labelColor: labelColor,
            bgColor: fieldBgColor,
            borderColor: fieldBorderColor,
            inputColor: inputTextColor,
            required: field['required'],
            initialValue: currentValue,
            onChanged: (value) {
              context.read<FlutterFormBuilderCubit>().updateField(
                field['name'],
                value,
              );
            },
          );
        },
      );
    }

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
