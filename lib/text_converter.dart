//text_converter.dart
class MorseCharacter {
  final String character;

  MorseCharacter(this.character);
}

class MorseToAlphabet {
  static final Map<String, MorseCharacter> morseMap = {
    '.-': MorseCharacter('A'),
    '-...': MorseCharacter('B'),
    '-.-.': MorseCharacter('C'),
    '-..': MorseCharacter('D'),
    '.': MorseCharacter('E'),
    '..-.': MorseCharacter('F'),
    '--.': MorseCharacter('G'),
    '....': MorseCharacter('H'),
    '..': MorseCharacter('I'),
    '.---': MorseCharacter('J'),
    '-.-': MorseCharacter('K'),
    '.-..': MorseCharacter('L'),
    '--': MorseCharacter('M'),
    '-.': MorseCharacter('N'),
    '---': MorseCharacter('O'),
    '.--.': MorseCharacter('P'),
    '--.-': MorseCharacter('Q'),
    '.-.': MorseCharacter('R'),
    '...': MorseCharacter('S'),
    '-': MorseCharacter('T'),
    '..-': MorseCharacter('U'),
    '...-': MorseCharacter('V'),
    '.--': MorseCharacter('W'),
    '-..-': MorseCharacter('X'),
    '-.--': MorseCharacter('Y'),
    '--..': MorseCharacter('Z'),
    '-----': MorseCharacter('0'),
    '.----': MorseCharacter('1'),
    '..---': MorseCharacter('2'),
    '...--': MorseCharacter('3'),
    '....-': MorseCharacter('4'),
    '.....': MorseCharacter('5'),
    '-....': MorseCharacter('6'),
    '--...': MorseCharacter('7'),
    '---..': MorseCharacter('8'),
    '----.': MorseCharacter('9'),
    '.-.-.-': MorseCharacter('.'),
    '--..--': MorseCharacter(','),
    '..--..': MorseCharacter('?'),
    '-.-.--': MorseCharacter('!'),
    '-....-': MorseCharacter('-'),
    '.----.': MorseCharacter("'"),
    '-..-.': MorseCharacter('/'),
    '-.--.': MorseCharacter('('),
    '-.--.-': MorseCharacter(')'),
    '.-...': MorseCharacter('&'),
    '---...': MorseCharacter(':'),
    '-.-.-.': MorseCharacter(';'),
    '-...-': MorseCharacter('='),
    '.-.-.': MorseCharacter('+'),
    '..--.-': MorseCharacter('_'),
    '.--.-.': MorseCharacter('@'),
  };

  static String? translate(String morseCode) {
    return morseMap[morseCode]?.character;
  }
}
