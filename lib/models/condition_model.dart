abstract final class ConditionModel {
  static final Map<String, String> _conditionTable = {
    'clear': 'ясно',
    'partly-cloudy': 'малооблачно',
    'cloudy': 'облачно с прояснениями',
    'overcast': 'пасмурно',
    'light-rain': 'небольшой дождь',
    'rain': 'дождь',
    'heavy-rain': 'cильный дождь',
    'showers': 'ливень',
    'wet-snow': 'дождь со снегом',
    'light-snow': 'небольшой снег',
    'snow': 'снег',
    'snow-showers': 'снегопад',
    'hail': 'град',
    'thunderstorm': 'гроза',
    'thunderstorm-with-rain': 'дождь с грозой',
    'thunderstorm-with-hail': 'гроза с градом',
  };

  static String? returnCondition(String forecastFromServer) {
    return _conditionTable[forecastFromServer];
  }
}
