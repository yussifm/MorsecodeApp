
class MorseAndText {

  String morseToText({required String text}) {
     var de = enCode(text);
    return de;
  }

  String textToMorse({required String morse}) {
    var de = deCode(morse);
    return de;
  }



    Map morseCodeMap = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '0': '-----',
    ',': '--..--',
    '.': '.-.-.-',
    '?': '..--..',
    '/': '-..-.',
    '-': '-....-',
    '(': '-.--.',
    ')': '-.--.-',
    "'":".----.",
    '"':'.-..-.'

  };
 
  
  // MorseCode([this.value, this.value2]);
  String enCode(String value) {
    var name = value.toUpperCase();
    var morseCode = "";
    var listString = name.split("");
    var indexList = morseCodeMap.keys.toList();
    // print(indexList.indexOf(" "));
    for (int i = 0; i < listString.length; i++) {
      if (listString[i] == " ") {
        morseCode += "/ ";
      } else {
        morseCode +=
            (morseCodeMap.values.elementAt(indexList.indexOf(listString[i])) +
                " ");
      }
    }
    return (morseCode);
  }

  deCode(String value2) {
    var mName = value2.split(" ");
    int j = 0;
    String decodedMorse = "";
    for (j; j < mName.length; j++) {
      if (mName[j] == "/") {
        decodedMorse += " ";
      } else {
        int indexofMorse = morseCodeMap.values.toList().indexOf(mName[j]);
        var correspondingAlphaValue = morseCodeMap.keys.toList()[indexofMorse];
        decodedMorse += correspondingAlphaValue;
      }
    }
    return decodedMorse;
  }
}



