import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  int _currentStep = 0;

  Widget _buildCustomerDetails() {
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 1) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: Text("Order details"),
              content: _buildCustomerDetails(),
              isActive: _currentStep == 0,
            ),
            Step(
              title: Text("Review"),
              content: _buildCustomerDetails(),
              isActive: _currentStep == 1,
            ),
          ],
        ),
      ),
    );
  }
}
