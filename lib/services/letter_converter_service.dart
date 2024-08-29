class LetterConverterService {
  static String convertTurkishToEnglish(String input) {
    Map<String, String> turkishToEnglishMap = {
      'ç': 'c',
      'ğ': 'g',
      'ı': 'i',
      'i': 'i',
      'ö': 'o',
      'ş': 's',
      'ü': 'u',
      'Ç': 'C',
      'Ğ': 'G',
      'İ': 'I',
      'Ö': 'O',
      'Ş': 'S',
      'Ü': 'U'
    };

    return input.replaceAllMapped(
      RegExp('[çÇğĞıİöÖşŞüÜ]'),
      (match) => turkishToEnglishMap[match.group(0)]!,
    );
  }
}
