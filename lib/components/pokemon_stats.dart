import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/get_data.dart';


class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.points, required this.bgColor}) : super(key: key);

  final List<PokemonBaseStat> points;
  final Color bgColor;

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState(points: this.points, bgColor: this.bgColor);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PokemonBaseStat> points;
  final Color bgColor;

  _BarChartWidgetState({required this.points, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 8,
              ),
            ),
            maxY: 100.0,
            barGroups: _chartGroups(),
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide())),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            backgroundColor: bgColor,
          ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    final List fixedList = Iterable<int>.generate(points.length).toList();
    final invertColor = bgColor.withBlue(1 - bgColor.blue).withGreen(1 - bgColor.green).withRed(1- bgColor.red);
    return fixedList.map((idx) =>
      BarChartGroupData(
        x: idx,
        barRods: [
          BarChartRodData(
            toY: points[idx].baseStat.toDouble(),
            color: invertColor,
          )
        ]
      )

    ).toList();
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      // index points by value and return the name
      var currStat = points[value.toInt()];
      text = currStat.label;

      // rotate text 90 degrees and save y position
      // offset y 10 pixels times text length
      // 90 degrees 
      var offsetY = 2.5 * text.length;
      return Transform.translate(offset: Offset(0, offsetY), 
        child: Transform.rotate(angle: 90 * math.pi / 180, child: Text(text, style: TextStyle(color: bgColor)))
      );

      // return Transform.rotate(
      //   angle: 90 * 3.1415927 / 180,
      //   child: Text(text),
      // );
      // return Text(text);
    },
  );
}