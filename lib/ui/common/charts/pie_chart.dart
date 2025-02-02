import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({Key? key}) : super(key: key);

  @override
  State<PieChartSample3> createState() => _PieChartSample3State();
}

class _PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = 0;

  var data = [100.0, 0.0, 0.0, 0.0, 0.0];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        data = [0.0, 15.0, 15.0, 40.0, 30.0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections: displaySections(),
      ),
      duration: Duration(milliseconds: 1200),
      curve: Curves.decelerate,
    );
  }

  List<PieChartSectionData> displaySections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0x00000000),
            value: data[0],
            showTitle: false,
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFFF8B250),
            value: data[1],
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
            badgeWidget: _Badge(
              'assets/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xFFF8B250),
            ),
            titlePositionPercentageOffset: 1.4,
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xFF845BEF),
            value: data[2],
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
            badgeWidget: _Badge(
              'assets/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xFF845BEF),
            ),
            titlePositionPercentageOffset: 1.4,
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xFF13D38E),
            value: data[3],
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
            badgeWidget: _Badge(
              'assets/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xFF13D38E),
            ),
            titlePositionPercentageOffset: 1.4,
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Ha ocurrido un error al cargar la gráfica.';
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(Icons.umbrella, color: Colors.black),
      ),
    );
  }
}
