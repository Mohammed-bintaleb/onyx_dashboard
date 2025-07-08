import 'package:flutter/material.dart';

class OrdersTable extends StatelessWidget {
  final List<Map<String, dynamic>> orders;
  final Function(String) onSearch;
  final Function(String?) onStatusFilter;

  const OrdersTable({
    super.key,
    required this.orders,
    required this.onSearch,
    required this.onStatusFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // شريط البحث والفلتر
        _buildSearchAndFilter(),
        const SizedBox(height: 16),
        // الجدول
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 24,
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              columns: const [
                DataColumn(label: Text('Order ID')),
                DataColumn(label: Text('Customer Name')),
                DataColumn(label: Text('Order Date')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Total Amount')),
                DataColumn(label: Text('Actions')),
              ],
              rows: orders.map((order) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        order['id'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataCell(Text(order['customerName'])),
                    DataCell(Text(order['orderDate'])),
                    DataCell(_buildStatusCell(order['status'])),
                    DataCell(
                      Text('\$${order['totalAmount'].toStringAsFixed(2)}'),
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name or order ID...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: onSearch,
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'All Statuses',
              items: const [
                DropdownMenuItem(
                  value: 'All Statuses',
                  child: Text('All Statuses'),
                ),
                DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                DropdownMenuItem(value: 'Shipped', child: Text('Shipped')),
                DropdownMenuItem(value: 'Completed', child: Text('Completed')),
                DropdownMenuItem(value: 'Canceled', child: Text('Canceled')),
              ],
              onChanged: onStatusFilter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCell(String status) {
    final (color, text) = _getStatusProperties(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  (Color, String) _getStatusProperties(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return (Colors.orange, 'Pending');
      case 'shipped':
        return (Colors.blue, 'Shipped');
      case 'completed':
        return (Colors.green, 'Completed');
      case 'canceled':
        return (Colors.red, 'Canceled');
      default:
        return (Colors.grey, status);
    }
  }
}
