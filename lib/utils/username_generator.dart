import 'dart:math';

class UsernameGenerator {
  /// A separator for the username
  String separator = '';

  /// A list of adjectives for generating a random username from
  final Random _random = Random();

  /// Generate username from email or name, date or numbers
  String generate(String obj,
      {List<String> adjectives = const [],
      DateTime? date,
      bool hasNumbers = true,
      int numberSeed = 1000,
      String prefix = '',
      String suffix = ''}) {
    // Check if emailOrName is email
    if (obj.contains('@')) {
      obj = obj.substring(0, obj.indexOf('@')).replaceAll(RegExp(r'[^a-zA-Z\d]'), '');
    }

    obj = obj.trim().replaceAll(RegExp(r'[^a-zA-Z\d\s]'), ' ').replaceAll(RegExp(r'\s{2,}'), ' ').replaceAll(' ', separator);

    var adjective = '';
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = '';
    if (hasNumbers) {
      numberString = _random.nextInt(numberSeed).toString();
    }

    return [prefix, adjective, obj, numberString, suffix].where((element) => element.isNotEmpty).join(separator).toLowerCase();
  }

  /// Get a random element from the list given
  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
