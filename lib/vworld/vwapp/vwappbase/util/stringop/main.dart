class Stringop {
  static String? getStringQuery(List<String> list, String phraseConnector) {
    String? returnValue;

    for (int la = 0; la < list.length; la++) {
      String currentElement = list.elementAt(la);

      if (currentElement != null) {
        if (returnValue == null) {
          returnValue = currentElement;
        } else {
          returnValue = "${returnValue} ${phraseConnector} ${currentElement}";
        }
      }
    }

    return returnValue;
  }

  static int getSpecialTagCount(String inputString) {
    int lReturnValue = 0;
    String currentString = inputString;

    const start = "{";
    const end = "}";

    int startIndex = currentString.indexOf(start);
    int endIndex = currentString.indexOf(end, startIndex + start.length);

    while (startIndex > 0 && endIndex > 0 && endIndex > startIndex) {
      currentString =
          currentString.substring(endIndex, currentString.length - endIndex);

      startIndex = currentString.indexOf('{');
      endIndex = currentString.indexOf('}', startIndex + start.length);
      lReturnValue++;
    }

    return lReturnValue;
  }

  static String? extractSpecialTag(String inputString, int index) {
    String? lReturnValue;
    const start = "{";
    const end = "}";

    if ((Stringop.getSpecialTagCount(inputString) - 1) >= index) {
      String currentString = inputString;
      int currentIndex = 0;
      int startIndex = currentString.indexOf(start);
      int endIndex = currentString.indexOf(end, startIndex + start.length);

      while (startIndex > 0 && endIndex > 0 && endIndex > startIndex) {
        if (index == currentIndex) {
          lReturnValue =
              currentString.substring(startIndex + start.length, endIndex);
        }

        currentString = currentString.substring(endIndex + end.length,
            currentString.length - (endIndex + end.length));

        startIndex = currentString.indexOf('{');
        endIndex = currentString.indexOf('}', startIndex + start.length);
        currentIndex++;
      }
    }

    return lReturnValue;
  }
}
