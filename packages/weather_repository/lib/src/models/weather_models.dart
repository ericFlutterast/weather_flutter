export 'weather_models.dart';

class WeatherObject {
  final String nowDate;
  final Fact fact;
  final List<Forecast> forecast;

  WeatherObject({
    required this.nowDate,
    required this.fact,
    required this.forecast,
  });

  factory WeatherObject.fromJason(Map<String, dynamic> data) {
    return WeatherObject(
      nowDate: data['now_dt'],
      fact: Fact.fromJson(data['fact']),
      forecast:
          (data['forecasts'] as List<dynamic>).map((dynamic element) => Forecast.fromJson(element)).toList(),
    );
  }
}

class Fact {
  final int temp;
  final int feelsLikes;
  final String condition;
  final dynamic windSpeed;
  final dynamic windGust;
  final int humidity;
  final String daytime;
  final String season;
  final int precType;
  final dynamic precStrength;
  final bool isThunder;
  final dynamic cloudness;
  final int tempWater;
  final String icon;

  Fact({
    required this.cloudness,
    required this.isThunder,
    required this.temp,
    required this.tempWater,
    required this.feelsLikes,
    required this.icon,
    required this.condition,
    required this.windSpeed,
    required this.windGust,
    required this.humidity,
    required this.daytime,
    required this.season,
    required this.precType,
    required this.precStrength,
  });

  factory Fact.fromJson(Map<String, dynamic> data) {
    return Fact(
      cloudness: data['cloudness'],
      isThunder: data['is_thunder'],
      precStrength: data['prec_strength'],
      precType: data['prec_type'],
      temp: data['temp'],
      tempWater: data['temp_water'] ?? 0,
      feelsLikes: data['feels_like'],
      icon: data['icon'],
      condition: data['condition'],
      windSpeed: data['wind_speed'],
      windGust: data['wind_gust'],
      humidity: data['humidity'],
      daytime: data['daytime'],
      season: data['season'],
    );
  }
}

class Forecast {
  final String date;
  final int week;
  final String sunrise;
  final String sunset;
  final int moonCode;
  final String moonText;
  final Parts parts;
  final List<Hour> hours;

  Forecast({
    required this.date,
    required this.moonCode,
    required this.moonText,
    required this.parts,
    required this.sunrise,
    required this.sunset,
    required this.week,
    required this.hours,
  });

  factory Forecast.fromJson(Map<String, dynamic> data) {
    return Forecast(
      date: data['date'],
      moonCode: data['moon_code'],
      moonText: data['moon_text'],
      parts: Parts.fromJson(data['parts']),
      sunrise: data['sunrise'],
      sunset: data['sunset'],
      week: data['week'],
      hours: (data['hours'] as List<dynamic>).map((dynamic element) => Hour.fromJson(element)).toList(),
    );
  }
}

class Parts {
  final TimeOfDayForecat night;
  final TimeOfDayForecat morning;
  final TimeOfDayForecat day;
  final TimeOfDayForecat evening;

  Parts({
    required this.day,
    required this.morning,
    required this.night,
    required this.evening,
  });

  factory Parts.fromJson(Map<String, dynamic> data) {
    return Parts(
      night: TimeOfDayForecat.fromJson(data['night']),
      morning: TimeOfDayForecat.fromJson(data['morning']),
      day: TimeOfDayForecat.fromJson(data['day']),
      evening: TimeOfDayForecat.fromJson(data['evening']),
    );
  }
}

class Hour {
  final dynamic temp;
  final String hour;
  final String icon;

  Hour({
    required this.hour,
    required this.icon,
    required this.temp,
  });

  factory Hour.fromJson(Map<String, dynamic> data) {
    return Hour(
      hour: data['hour'],
      icon: data['icon'],
      temp: data['temp'],
    );
  }
}

class TimeOfDayForecat {
  final int tempMin;
  final int tempMax;
  final int feelsLike;
  final String icon;
  final String condition;
  final String daytime;
  final int humidity;
  final int precType;
  final dynamic cloudness;

  TimeOfDayForecat({
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.icon,
    required this.condition,
    required this.daytime,
    required this.humidity,
    required this.precType,
    required this.cloudness,
  });

  factory TimeOfDayForecat.fromJson(Map<String, dynamic> data) {
    return TimeOfDayForecat(
      tempMax: data['temp_max'],
      tempMin: data['temp_min'],
      condition: data['condition'],
      precType: data['prec_type'],
      humidity: data['humidity'],
      icon: data['icon'],
      feelsLike: data['feels_like'],
      daytime: data['daytime'],
      cloudness: data['cloudness'],
    );
  }
}
