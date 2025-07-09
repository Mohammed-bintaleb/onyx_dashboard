import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../models/text_step.dart';
import 'customer_details_form.dart';
import 'rectangular_stepper.dart';
import 'review_step.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormBuilderState>();

  void _submitForm() {
    final formData = _formKey.currentState?.value;
    debugPrint('Form submitted: $formData');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Order created successfully!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _currentStep = 0;
        _formKey.currentState?.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RectangularStepper(
      currentStep: _currentStep,
      onStepTapped: (step) {
        if (step < _currentStep ||
            (_formKey.currentState?.validate() ?? false)) {
          setState(() => _currentStep = step);
        }
      },
      onStepContinue: () {
        if (_currentStep == 0) {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            setState(() => _currentStep += 1);
          }
        } else {
          _submitForm();
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() => _currentStep -= 1);
        }
      },
      steps: [
        TextStep(
          title: "Order Details",
          content: CustomerDetailsForm(formKey: _formKey),
        ),
        TextStep(
          title: "Review",
          content: ReviewStep(formData: _formKey.currentState?.value ?? {}),
        ),
      ],
    );
  }
}
