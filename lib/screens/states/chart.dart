import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  //创建柱状图的数据,并返回 BarChartGroupData，让 fl_chart 能够绘制柱状图。
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      //负责定义 “这个 X 轴上的柱子长什么样”。
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: GradientRotation(pi / 20),
          ),
          width: 20,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            color: Colors.grey.shade400,
            toY: 5,
          ),
        )
      ],
    );
  }

  //8条竖列  生成柱状图的所有数据，然后传递给 fl_chart 进行绘制。
  List<BarChartGroupData> showingGroup() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 3.8);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        //// 是否显示轴标题
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              //间距
              reservedSize: 38,
              getTitlesWidget: getTitles),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      //让外面的框取消显示
      borderData: FlBorderData(show: false),
      //让里面的竖线取消显示
      gridData: FlGridData(show: false),
      //这里调用 将showingGroup()的数据传入mainBarData,数据时8 组柱状图数据。
      //barGroups负责 存储柱状图的数据
      barGroups: showingGroup(),
    );
  }

  //坐标轴标题 决定 X 轴的刻度文本，也就是 X 轴上每个柱子的标签。
  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    //value里的数据是通过barGroup(showingGroup)里的数据传过来的
    switch (value.toInt()) {
      case 0:
        text = Text("01", style: style);
        break;
      case 1:
        text = Text("02", style: style);
        break;
      case 2:
        text = Text("03", style: style);
        break;
      case 3:
        text = Text("04", style: style);
        break;
      case 4:
        text = Text("05", style: style);
        break;
      case 5:
        text = Text("06", style: style);
        break;
      case 6:
        text = Text("07", style: style);
        break;
      case 7:
        text = Text("08", style: style);
        break;
      default:
        text = Text("default", style: style);
        break;
    }
    //返回一个
    return SideTitleWidget(
      child: text,
      axisSide: meta.axisSide,
      space: 16,
    );
  }

//设置 Y 轴（左侧）的刻度和文本
  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text;
    if ((value == 0)) {
      text = "£0k";
    } else if (value == 1) {
      text = "£1k";
    } else if (value == 2) {
      text = "£2k";
    } else if (value == 3) {
      text = "£3k";
    } else if (value == 4) {
      text = "£4k";
    }else if (value == 5) {
      text = "£5k";
    } else {
      return Container();
    }
    return SideTitleWidget(
      child: Text(
        text,
        //TODO 未来需要将这个style规范化一下
        style: style,
      ),
      axisSide: meta.axisSide,
      space: 0,
    );
  }
}
