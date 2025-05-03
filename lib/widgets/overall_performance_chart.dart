import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverallPerformanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the chart - replace with your actual data
    final List<FlSpot> projectDoneData = [
      FlSpot(2015, 30),
      FlSpot(2016, 35),
      FlSpot(2017, 25),
      FlSpot(2018, 45),
      FlSpot(2019, 38),
      FlSpot(2020, 42),
    ];

    final List<FlSpot> pendingDoneData = [
      FlSpot(2015, 40),
      FlSpot(2016, 45),
      FlSpot(2017, 35),
      FlSpot(2018, 55),
      FlSpot(2019, 48),
      FlSpot(2020, 52),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false, // Don't draw vertical grid lines
          drawHorizontalLine: true, // Explicitly draw horizontal grid lines
          getDrawingHorizontalLine: (value) { // Use getDrawingHorizontalLine
            return FlLine(
              color: Colors.grey.withOpacity(0.5), // Example grid line color with opacity
              strokeWidth: 0.5,
            );
          },
          horizontalInterval: 10, // Interval for horizontal grid lines
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                // Display years on the x-axis
                final year = value.toInt();
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$year',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 11,
                    ),
                  ),
                );
              },
              interval: 1, // Show title for every year
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                // Display values on the y-axis
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.left,
                );
              },
              interval: 10, // Interval for y-axis titles
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1), // Customize border
        ),
        minX: 2015, // Minimum value for x-axis (year)
        maxX: 2020, // Maximum value for x-axis (year)
        minY: 0, // Minimum value for y-axis
        maxY: 60, // Maximum value for y-axis (adjust based on your data range)
        lineBarsData: [
          // Data for "Project Done" line
          LineChartBarData(
            spots: projectDoneData,
            isCurved: true,
            color: Colors.pinkAccent, // Color for Project Done line
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: true), // Show dots on data points
            belowBarData: BarAreaData(show: false), // Don't fill below the line
          ),
          // Data for "Pending Done" line
          LineChartBarData(
            spots: pendingDoneData,
            isCurved: true,
            color: Colors.blueAccent, // Color for Pending Done line
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: true), // Show dots on data points
            belowBarData: BarAreaData(show: false), // Don't fill below the line
          ),
        ],
        // Optional: Add touch interaction if needed
        // lineTouchData: LineTouchData(enabled: true),
      ),
    );
  }
}