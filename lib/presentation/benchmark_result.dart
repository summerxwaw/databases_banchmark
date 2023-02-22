import 'dart:math';

import 'package:benchmark_test/benchmark.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BenchmarkResult extends StatelessWidget {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor =const Color(0xffff5182);
  final double width = 12;

  final List<Result> results;

  const BenchmarkResult(this.results, {super.key});

  List<String> get labels {
    return results.map((r) => r.runner.name).toList();
  }

  int get maxResultTime {
    var max = 0;

    for (var result in results) {
      if (result.modelTime > max) {
        max = result.modelTime;
      }
    }
    return max;
  }

  List<BarChartGroupData> get barGroups {
    var x = 0;
    return [
      for (final result in results)
        BarChartGroupData(
          barsSpace: 4,
          x: x++,
          barRods: [
            BarChartRodData(
              color: leftBarColor,
              width: width,
              borderRadius: BorderRadius.circular(6),
              toY: max(result.modelTime.toDouble(), 1),
            ),
          ],
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: _buildChart(),
        ),
      ],
    );
  }

  _buildChart() {
    var maxTime = maxResultTime;
    return SizedBox(
      child: BarChart(
        BarChartData(
          maxY: maxTime.toDouble(),
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (i, _) {
                  return Center(
                    child: Text(
                      labels[i.toInt()],
                      style: const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (i, _) {
                  return Center(
                    child: Text(
                      '${results[i.toInt()].modelTime} ms',
                      style: const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }
}