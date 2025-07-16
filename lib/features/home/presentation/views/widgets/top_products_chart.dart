import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../data/models/product_data_mode.dart';

class TopProductsChart extends StatelessWidget {
  const TopProductsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final t = AppLocalizations.of(context)!;

    final List<ProductDataMode> data = [
      ProductDataMode(t.translate('product_widget_a'), 400),
      ProductDataMode(t.translate('product_widget_b'), 300),
      ProductDataMode(t.translate('product_gadget_pro'), 500),
      ProductDataMode(t.translate('product_super_thing'), 100),
      ProductDataMode(t.translate('product_mega_gear'), 200),
    ];

    //* نعكس ترتيب البيانات لو كانت اللغة RTL
    final List<ProductDataMode> displayedData = isRTL
        ? data.reversed.toList()
        : data;

    //* حساب أقصى قيمة Y
    final maxY =
        (displayedData.map((d) => d.orders).reduce((a, b) => a > b ? a : b) *
                1.2)
            .ceil();

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: SfCartesianChart(
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
                final product = data as ProductDataMode;
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
                          Text(
                            t.translate('orders'),
                            style: const TextStyle(color: Colors.grey),
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
        primaryXAxis: CategoryAxis(isInversed: isRTL),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: maxY.toDouble(),
          interval: maxY / 5,
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: const TextStyle(color: Colors.transparent),
        ),
        series: [
          BarSeries<ProductDataMode, String>(
            color: Colors.blue[500],
            dataSource: displayedData,
            xValueMapper: (ProductDataMode data, _) => data.productName,
            yValueMapper: (ProductDataMode data, _) => data.orders,
            name: t.translate('orders'),
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            enableTooltip: true,
          ),
        ],
      ),
    );
  }
}
