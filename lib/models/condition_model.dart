interface class HashTable<T> {
  final Map<T, String> _hashTable = {};

  String? getValue(T inputValue) {
    return _hashTable[inputValue];
  }
}

class ConditionModel extends HashTable {
  @override
  Map<dynamic, String> get _hashTable => {
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
}

class Weekdays extends HashTable {
  @override
  Map<dynamic, String> get _hashTable => {
        1: 'Пн',
        2: 'Вт',
        3: 'Ср',
        4: 'Чт',
        5: 'Пт',
        6: 'Сб',
        7: 'Вс',
      };
}
