import 'package:flutter/material.dart';

class TotalOrdersCard extends StatelessWidget {
  const TotalOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Orders Today',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '125',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.trending_up, color: Colors.green),
                const SizedBox(width: 4),
                Text(
                  '+12% from last period',
                  style: TextStyle(color: Colors.green.shade700, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
