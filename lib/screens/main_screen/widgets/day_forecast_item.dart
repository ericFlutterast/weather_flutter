import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter/models/condition_model.dart';
import 'package:weather_flutter/models/week_forecast_parametrs.dart';

import 'degrees.dart';
import 'horizontal_display_of_degrees.dart';

class DayForecastItem extends StatelessWidget {
  final String weekday;
  final int maxTemp;
  final int minTemp;
  final String icon;
  final int currentTemValue;
  final WeekForecastParametrs weekForecastParametrs;

  const DayForecastItem({
    super.key,
    required this.weekForecastParametrs,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.weekday,
    this.currentTemValue = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              weekday.length == 1 ? Weekdays().getValue(int.parse(weekday))! : weekday,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(253, 251, 253, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SvgPicture.network('https://yastatic.net/weather/i/icons/funky/dark/$icon.svg'),
          const SizedBox(width: 30),
          // DegreesWidget(
          //   color: const Color.fromRGBO(174, 153, 172, 1),
          //   size: 23,
          //   currentTemp: minTemp.toString(),
          // ),
          Row(
            children: [
              Text(
                minTemp.toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(174, 153, 172, 1),
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CustomPaint(
                painter: DegreesCircle(
                  color: const Color.fromRGBO(174, 153, 172, 1),
                  size: 5,
                  width: 2,
                  offset: const Offset(0, 0),
                ),
                size: const Size(0, 14),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: CustomPaint(
              painter: HorizontalDisplayOfDegrees(
                currentTemValue,
                renderParametrs: weekForecastParametrs,
                thisDayMaxTemp: maxTemp,
                thisDayMinTemp: minTemp,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            maxTemp.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(253, 251, 253, 1),
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomPaint(
            painter: DegreesCircle(
              color: const Color.fromRGBO(253, 251, 253, 1),
              size: 5,
              width: 2,
              offset: const Offset(0, 0),
            ),
            size: const Size(0, 14),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
