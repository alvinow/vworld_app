class StringopMap {

  static List<String> getStringFieldList(List<dynamic> fieldList){
    List<String> returnValue=<String>[];

    for (int fieldCounter = 0;
    fieldCounter < fieldList.length;
    fieldCounter++) {
      if (fieldList[fieldCounter] != null) {
        final String currentRow =
        fieldList[fieldCounter].toString();
        //Widget currentWidget = Text(currentRow);
        //fieldList.add(currentWidget);
        returnValue.add(currentRow);
      }
    }


    return returnValue;
  }

}