import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart'; 

class WeeklyRevenueChart extends StatelessWidget {
  const WeeklyRevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final days = [
      t.translate('saturday'),
      t.translate('sunday'),
      t.translate('monday'),
      t.translate('tuesday'),
      t.translate('wednesday'),
      t.translate('thursday'),
      t.translate('friday'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 320,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          space: 10,
                          meta: meta,
                          child: Text(
                            days[value.toInt()],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 2000,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          space: 10,
                          meta: meta,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 8000,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 2000),
                      FlSpot(1, 3500),
                      FlSpot(2, 4200),
                      FlSpot(3, 6000),
                      FlSpot(4, 7500),
                      FlSpot(5, 5000),
                      FlSpot(6, 3000),
                    ],
                    isCurved: false,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.blue,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
