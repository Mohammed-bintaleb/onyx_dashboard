import 'package:flutter/material.dart';

class ReviewStep extends StatelessWidget {
  final Map<String, dynamic> formData;

  const ReviewStep({super.key, required this.formData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildReviewItem("Customer name", formData['customer_name']),
        _buildReviewItem(
          "Phone number",
          formData['phone'],
          fallback: "Not provided",
        ),
        _buildReviewItem("Shipping address", formData['address']),
        _buildReviewItem("City", formData['city']),
        _buildReviewItem("ZIP Code", formData['zip_code']),
        _buildReviewItem("Email", formData['email']),
        _buildReviewItem("State", formData['state']),
      ],
    );
  }

  Widget _buildReviewItem(String label, dynamic value, {String fallback = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value?.toString().isNotEmpty == true ? value : fallback,
            ),
          ),
        ],
      ),
    );
  }
}
