import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';
import 'package:onyx_dashboard/views/widgets/add_products.dart';
import 'widgets/chart_custom_container.dart';
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

  // Widget _buildCurrentContent() {
  //   if (_currentStep == 0) {
  //     return CustomerDetailsForm(formKey: _formKey);
  //   } else {
  //     return ReviewStep(formData: _formKey.currentState?.value ?? {});
  //   }
  // }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create Order", style: AppStyles.styleBold32(context)),
            SizedBox(height: 10),
            Text(
              "Fill out the form below to create a new customer order",
              style: AppStyles.style16(context),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(5),
              child: RectangularStepper(
                stepTitles: _stepTitles,
                currentStep: _currentStep,
                onStepTapped: (step) {
                  if (step < _currentStep ||
                      (_formKey.currentState?.validate() ?? false)) {
                    setState(() => _currentStep = step);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),

            // // _buildCurrentContent(),
            // const SizedBox(height: 20),
            ChartCustomContainer(
              title: "Customer Details",
              subtitle: "Enter the customer's information for the new order.",
              child: CustomerDetailsForm(),
            ),
            const SizedBox(height: 25),
            ChartCustomContainer(
              title: "Add Products",
              subtitle: "Search for products and add them to the order.",
              child: ProductTable(),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_currentStep > 0)
                  OutlinedButton(
                    onPressed: () => setState(() => _currentStep--),
                    child: const Text('Back'),
                  ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep == 0) {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        setState(() => _currentStep++);
                      }
                    } else {
                      _submitForm();
                    }
                  },
                  child: Text(_currentStep == 0 ? 'Continue' : 'Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
