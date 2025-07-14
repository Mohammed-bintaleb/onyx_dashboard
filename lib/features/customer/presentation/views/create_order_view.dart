// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/utils/app_localizations.dart';
import '../../data/models/order_model.dart';
import '../../domain/Entities/product_row_entity.dart';
import '../manger/order_cubit/order_cubit.dart';
import 'widgets/order_details_step.dart';
import 'widgets/review_step_section.dart';
import 'widgets/stepper_section.dart';
import 'widgets/title_section.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  final stepTitles = ["Order Details", "Review"];
  List<ProductRowEntity> _reviewProducts = [];
  double _reviewGrandTotal = 0.0;

  void _submitForm() {
    // تحقق أولاً أن البيانات موجودة
    if (_reviewFormData.isEmpty) {
      print("Review form data is empty. Cannot submit.");
      return;
    }

    print("Submitting order with data: $_reviewFormData");

    final id = UniqueKey().toString();
    final customer = _reviewFormData['customer_name'] ?? '';
    final date = DateTime.now().toString().split(' ').first;
    const status = 'pending';
    final amount = _reviewGrandTotal;

    final order = OrderModel(
      id: id,
      customer: customer,
      date: date,
      status: status,
      amount: amount,
    );

    context.read<OrderCubit>().addOrder(order);
    print("Order submission complete");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Order created successfully")));

    setState(() {
      _currentStep = 0;
      _formKey.currentState?.reset();
      _reviewProducts = [];
      _reviewGrandTotal = 0.0;
      _reviewFormData = {};
    });
  }

  void _onContinue() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState!.value;
      print("Form data captured on continue: $data");

      setState(() {
        _currentStep++;
        _reviewFormData = data;
      });
    } else {
      print("Form is invalid");
    }
  }

  Map<String, dynamic> _reviewFormData = {};

  void _onProductsUpdated(List<ProductRowEntity> products, double grandTotal) {
    setState(() {
      _reviewProducts = products;
      _reviewGrandTotal = grandTotal;
    });
  }

  void _onStepTapped(int step) {
    setState(() => _currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final containerColor = isDarkMode
        ? const Color(0xFF1D1E33)
        : (Colors.grey[300] ?? Colors.grey);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    final List<String> stepTitles = [
      t.translate("order_details"),
      t.translate("review"),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSection(textColor: textColor),
            const SizedBox(height: 20),
            StepperSection(
              containerColor: containerColor,
              stepTitles: stepTitles,
              currentStep: _currentStep,
              onStepTapped: _onStepTapped,
            ),
            const SizedBox(height: 10),
            if (_currentStep == 0)
              OrderDetailsStep(
                formKey: _formKey,
                onContinue: _onContinue,
                onProductsUpdated: _onProductsUpdated,
              )
            else
              ReviewStepSection(
                formData: _formKey.currentState?.value ?? {},
                products: _reviewProducts,
                grandTotal: _reviewGrandTotal,
                onBack: () => setState(() => _currentStep--),
                onSubmit: _submitForm,
                textColor: textColor,
              ),
          ],
        ),
      ),
    );
  }
}
