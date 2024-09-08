class MorseCharacter {
  final List<int> signals; // Representing each Morse signal as 1 (dot) or 2 (dash)

  MorseCharacter(this.signals);
}

Map<String, MorseCharacter> morseMap = {
  // Alphabets
  'a': MorseCharacter([1, 2]),
  'b': MorseCharacter([2, 1, 1, 1]),
  'c': MorseCharacter([2, 1, 2, 1]),
  'd': MorseCharacter([2, 1, 1]),
  'e': MorseCharacter([1]),
  'f': MorseCharacter([1, 1, 2, 1]),
  'g': MorseCharacter([2, 2, 1]),
  'h': MorseCharacter([1, 1, 1, 1]),
  'i': MorseCharacter([1, 1]),
  'j': MorseCharacter([1, 2, 2, 2]),
  'k': MorseCharacter([2, 1, 2]),
  'l': MorseCharacter([1, 2, 1, 1]),
  'm': MorseCharacter([2, 2]),
  'n': MorseCharacter([2, 1]),
  'o': MorseCharacter([2, 2, 2]),
  'p': MorseCharacter([1, 2, 2, 1]),
  'q': MorseCharacter([2, 2, 1, 2]),
  'r': MorseCharacter([1, 2, 1]),
  's': MorseCharacter([1, 1, 1]),
  't': MorseCharacter([2]),
  'u': MorseCharacter([1, 1, 2]),
  'v': MorseCharacter([1, 1, 1, 2]),
  'w': MorseCharacter([1, 2, 2]),
  'x': MorseCharacter([2, 1, 1, 2]),
  'y': MorseCharacter([2, 1, 2, 2]),
  'z': MorseCharacter([2, 2, 1, 1]),

  // Numbers
  '1': MorseCharacter([1, 2, 2, 2, 2]),
  '2': MorseCharacter([1, 1, 2, 2, 2]),
  '3': MorseCharacter([1, 1, 1, 2, 2]),
  '4': MorseCharacter([1, 1, 1, 1, 2]),
  '5': MorseCharacter([1, 1, 1, 1, 1]),
  '6': MorseCharacter([2, 1, 1, 1, 1]),
  '7': MorseCharacter([2, 2, 1, 1, 1]),
  '8': MorseCharacter([2, 2, 2, 1, 1]),
  '9': MorseCharacter([2, 2, 2, 2, 1]),
  '0': MorseCharacter([2, 2, 2, 2, 2]),

  // Common punctuation marks
  ',': MorseCharacter([2, 2, 1, 1, 2, 2]),
  '.': MorseCharacter([1, 2, 1, 2, 1, 2]),
  '?': MorseCharacter([1, 1, 2, 2, 1, 1]),
  '-': MorseCharacter([2, 1, 1, 1, 1, 2]),
  '/': MorseCharacter([2, 1, 1, 2, 1]),
};

List<MorseCharacter> convertTextToMorse(String text) {
  List<MorseCharacter> morseText = [];
  for (var char in text.toLowerCase().split('')) {
    if (morseMap.containsKey(char)) {
      morseText.add(morseMap[char]!);
    }
  }
  return morseText;
}

String convertMorseToText(List<String> morseSignals) {
  String result = '';
  morseSignals.forEach((signal) {
    morseMap.forEach((key, value) {
      if (value.signals.join('') == signal) {
        result += key;
      }
    });
  });
  return result;
}
