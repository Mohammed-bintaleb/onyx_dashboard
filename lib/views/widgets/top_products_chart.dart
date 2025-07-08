import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductData {
  final String productName;
  final int orders;

  ProductData(this.productName, this.orders);
}

class TopProductsChart extends StatelessWidget {
  final List<ProductData> data = [
    ProductData('Widget A', 400),
    ProductData('Widget B', 300),
    ProductData('Gadget Pro', 500),
    ProductData('Super Thing', 100),
    ProductData('Mega Gear', 200),
  ];

  TopProductsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final maxY =
        (data.map((d) => d.orders).reduce((a, b) => a > b ? a : b) * 1.2)
            .ceil();

    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        canShowMarker: false,
        duration: 0,
        enable: true,
        builder:
            (
              dynamic data,
              dynamic point,
              dynamic series,
              int pointIndex,
              int seriesIndex,
            ) {
              final product = data as ProductData;
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'orders',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${product.orders}',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
      ),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: maxY.toDouble(),
        interval: maxY / 5,
        majorGridLines: MajorGridLines(width: 0),
        labelStyle: const TextStyle(color: Colors.transparent),
      ),
      series: [
        BarSeries<ProductData, String>(
          dataSource: data,
          xValueMapper: (ProductData data, _) => data.productName,
          yValueMapper: (ProductData data, _) => data.orders,
          name: 'Orders',
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          enableTooltip: true,
        ),
      ],
    );
  }
}
