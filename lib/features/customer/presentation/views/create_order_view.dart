import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/add_products.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/review_step.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/chart_custom_container.dart';
import '../../data/models/product_row.dart';
import 'widgets/customer_details_form.dart';
import 'widgets/rectangular_stepper.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  final _stepTitles = ["Order Details", "Review"];
  List<ProductRow> _reviewProducts = [];
  double _reviewGrandTotal = 0.0;

  void _submitForm() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState?.value ?? {};
      print("Order Submitted: $formData");
      // يمكنك إضافة منطق إرسال الطلب هنا
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final containerColor = isDarkMode ? Color(0xFF1D1E33) : Colors.grey[300];
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Order",
              style: AppStyles.styleBold32(context).copyWith(color: textColor),
            ),
            const SizedBox(height: 10),
            Text(
              "Fill out the form below to create a new customer order",
              style: AppStyles.style16(context).copyWith(color: textColor),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(5),
              child: RectangularStepper(
                stepTitles: _stepTitles,
                currentStep: _currentStep,
                onStepTapped: (step) {
                  setState(() => _currentStep = step);
                },
                // يمكنك تعديل RectangularStepper لدعم الثيم أو استقبال ألوان حسب الوضع
              ),
            ),
            const SizedBox(height: 10),
            if (_currentStep == 0) ...[
              ChartCustomContainer(
                title: "Customer Details",
                subtitle: "Enter the customer's information for the new order.",
                child: CustomerDetailsForm(formKey: _formKey),
                // يمكن تعديل ChartCustomContainer ليأخذ لون خلفية بناءً على الوضع أيضاً
              ),
              const SizedBox(height: 25),
              ChartCustomContainer(
                title: "Add Products",
                subtitle: "Search for products and add them to the order.",
                child: ProductTable(
                  onContinue: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      setState(() => _currentStep++);
                    }
                  },
                  onProductsUpdated: (products, grandTotal) {
                    setState(() {
                      _reviewProducts = products;
                      _reviewGrandTotal = grandTotal;
                    });
                  },
                ),
              ),
            ] else ...[
              ChartCustomContainer(
                title: "Review Order",
                subtitle: "Review the details below and submit the order.",
                child: ReviewStep(
                  formData: _formKey.currentState?.value ?? {},
                  products: _reviewProducts,
                  grandTotal: _reviewGrandTotal,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => setState(() => _currentStep--),
                    style: OutlinedButton.styleFrom(foregroundColor: textColor),
                    child: const Text("Back"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text("Create Order"),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
