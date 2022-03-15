import 'package:flutter/cupertino.dart';



/*
class GroupDocumentSearchField {
  GroupDocumentSearchField(this.searchFieldList, {this.phraseConnector: 'AND'});

  static final String phraseConnector_and = 'AND';
  static final String phraseConnector_or = 'OR';

  String phraseConnector;
  List<DocumentSearchField> searchFieldList;

  WhereQuerySetParam getWhereQuerySetParam() {
    return DocumentSearchField.getQuerySetParamFromDocumentSearchField(
        this.searchFieldList,
        phraseConnector: this.phraseConnector);
  }
}*/

class DocumentSearchParamByFields {
  DocumentSearchParamByFields(
      {required this.title,
        this.searchGeneralKeyword,
        this.requiredSearchFieldList,
        this.optionalSearchFieldList,
        this.documentOrderFieldList}) {
    if (this.requiredSearchFieldList == null) {
      this.requiredSearchFieldList = <DocumentSearchField>[];
    }

    if (this.optionalSearchFieldList == null) {
      this.optionalSearchFieldList = <DocumentSearchField>[];
    }

    if (this.documentOrderFieldList == null) {
      this.documentOrderFieldList = <DocumentOrderField>[];
    }
  }

  String? title;
  String? searchGeneralKeyword;
  List<DocumentSearchField>? requiredSearchFieldList;
  List<DocumentOrderField>? documentOrderFieldList;
  List<DocumentSearchField>? optionalSearchFieldList;

  static final String title_CCFN='title';
  static final String searchGeneralKeyword_CCFN='searchGeneralKeyword';
  static final String requiredSearchFieldList_CCFN='requiredSearchFieldList';
  static final String documentOrderFieldList_CCFN='documentOrderFieldList';
  static final String optionalSearchFieldList_CCFN='optionalSearchFieldList';


  Map<String, dynamic> toJson() => {
    DocumentSearchParamByFields.title_CCFN: this.title,
    DocumentSearchParamByFields.searchGeneralKeyword_CCFN: this.searchGeneralKeyword,
    DocumentSearchParamByFields.requiredSearchFieldList_CCFN: this.requiredSearchFieldList != null
        ? this.requiredSearchFieldList!.map((item) => item.toJson()).toList()
        : [],
    DocumentSearchParamByFields.documentOrderFieldList_CCFN: this.documentOrderFieldList != null
        ? this.documentOrderFieldList!.map((item) => item.toJson()).toList()
        : [],
    DocumentSearchParamByFields.optionalSearchFieldList_CCFN : this.optionalSearchFieldList != null
        ? this.optionalSearchFieldList!.map((item) => item.toJson()).toList()
        : [],

  };

  factory DocumentSearchParamByFields.fromJson(Map<String, dynamic> data) =>DocumentSearchParamByFields(
    title: data[DocumentSearchParamByFields.title_CCFN],
    searchGeneralKeyword: data[DocumentSearchParamByFields.searchGeneralKeyword_CCFN],
    requiredSearchFieldList: data[DocumentSearchParamByFields.requiredSearchFieldList_CCFN] == null
        ? <DocumentSearchField>[]
        : data[DocumentSearchParamByFields.requiredSearchFieldList_CCFN]
        .map<DocumentSearchParamByFields>((item) => DocumentSearchField.fromJson(item))
        .toList(),
    documentOrderFieldList: data[DocumentSearchParamByFields.documentOrderFieldList_CCFN] == null
        ? <DocumentOrderField>[]
        : data[DocumentSearchParamByFields.documentOrderFieldList_CCFN]
        .map<DocumentSearchParamByFields>((item) => DocumentOrderField.fromJson(item))
        .toList(),
    optionalSearchFieldList: data[DocumentSearchParamByFields.optionalSearchFieldList_CCFN] == null
        ? <DocumentSearchField>[]
        : data[DocumentSearchParamByFields.optionalSearchFieldList_CCFN]
        .map<DocumentSearchParamByFields>((item) => DocumentSearchField.fromJson(item))
        .toList(),

  );

  static DocumentSearchField? getDocumentSearchFieldByFieldName(
      String fieldName, List<DocumentSearchField> list) {
    DocumentSearchField? returnValue;

    for (int la = 0; la < list.length; la++) {
      DocumentSearchField currentElement = list.elementAt(la);

      if (currentElement.fieldName == fieldName) {
        returnValue = currentElement;
        break;
      }
    }

    return returnValue;
  }

  static bool isAnyActiveOnDocumentSearchField(
      List<DocumentSearchField> documentSearchFieldList) {
    bool returnValue = false;

    for (int la = 0; la < documentSearchFieldList.length; la++) {
      DocumentSearchField currentElement =
      documentSearchFieldList.elementAt(la);
      if (currentElement.isActive == true) {
        returnValue = true;
        break;
      }
    }

    return returnValue;
  }

  String? getOrderParam() {
    String? returnValue;

    for (int la = 0; la < this.documentOrderFieldList!.length; la++) {
      DocumentOrderField documentOrderField =
      this.documentOrderFieldList!.elementAt(la);

      if (documentOrderField.isActive == true) {
        if (returnValue == null) {
          returnValue = documentOrderField.fieldName;
        } else {
          returnValue = "${returnValue},${documentOrderField.fieldName}";
        }
      }
    }

    return returnValue;
  }

  WhereQuerySetParam? getQuerySetParam() {
    List<DocumentSearchField> unionDocumentSearchFieldList =
    <DocumentSearchField>[];

    unionDocumentSearchFieldList.addAll(this.requiredSearchFieldList!);

    unionDocumentSearchFieldList.addAll(this.optionalSearchFieldList!);

    return DocumentSearchField.getQuerySetParamFromDocumentSearchField(
        unionDocumentSearchFieldList);
  }
}

/*
class QueryDocumentParam {
  QueryDocumentParam(
      {@required this.tableName,
      @required this.offset,
      @required this.limit,
      @required this.whereQuerySetParam,
      @required this.orderBy});
  final String tableName;
  final int offset;
  final int limit;
  final WhereQuerySetParam whereQuerySetParam;
  final String orderBy;
}
*/
class WhereQuerySetParam {
  WhereQuerySetParam({required this.query, required this.valueList});
  String query;
  List<dynamic> valueList;

  static String toolsGetSqlWhereQuery(String query, List<dynamic> valueList) {
    String inputQuery = query;
    int testPos = inputQuery.indexOf('?');
    int counter = 0;

    String regexSearchString = RegExp.escape('?');
    while (inputQuery.indexOf('?') >= 0) {
      dynamic currentElement = valueList.elementAt(counter);
      String currentElementInString = "${currentElement.toString()}";

      if (currentElement is String) {
        //add quote
        currentElementInString = "'${currentElementInString}'";
      }

      inputQuery = inputQuery.replaceFirst(
          RegExp(regexSearchString), currentElementInString);

      counter++;
    }

    return inputQuery;
  }
}

class DocumentOrderField {
  DocumentOrderField(
      {required this.isActive,
        required this.displayCaption,
        required this.fieldName});

  bool? isActive;
  String? displayCaption;
  String? fieldName;

  static final String isActive_CCFN='isActive';
  static final String displayCaption_CCFN='displayCaption';
  static final String fieldName_CCFN='fieldName';

  Map<String, dynamic> toJson() => {
    DocumentOrderField.isActive_CCFN: this.isActive,
    DocumentOrderField.displayCaption_CCFN: this.displayCaption,
    DocumentOrderField.fieldName_CCFN: this.fieldName
  };

  factory DocumentOrderField .fromJson(Map<String, dynamic> data) =>DocumentOrderField(
      isActive: data[DocumentOrderField.isActive_CCFN],
      displayCaption: data[DocumentOrderField.displayCaption_CCFN],
      fieldName: data[DocumentOrderField.fieldName_CCFN]
  );

  static String? getOrderParam(List<DocumentOrderField> list) {
    String? returnValue;

    for (int la = 0; la < list.length; la++) {
      DocumentOrderField documentOrderField = list.elementAt(la);

      if (documentOrderField.isActive == true) {
        if (returnValue == null) {
          returnValue = documentOrderField.fieldName;
        } else {
          returnValue = "${returnValue},${documentOrderField.fieldName}";
        }
      }
    }

    return returnValue;
  }
}

class DocumentSearchField {
  DocumentSearchField({
    @required this.isActive: false,
    @required this.isHidden: false,
    required this.displayCaption,
    required this.fieldName,
    required this.queryValue,
    required this.equalityOperator,
  });

  bool? isActive;
  bool? isHidden;
  String? displayCaption;
  String? fieldName;
  var queryValue;
  String? equalityOperator;

  static final String isActive_CCFN = 'isActive';
  static final String isHidden_CCFN = 'isHidden';
  static final String displayCaption_CCFN = 'displayCaption';
  static final String fieldName_CCFN = 'fieldName';
  static final String queryValue_CCFN = 'queryValue';
  static final String equalityOperator_CCFN = 'equalityOperator';

  Map<String, dynamic> toJson() => {
    DocumentSearchField.isActive_CCFN: this.isActive,
    DocumentSearchField.isHidden_CCFN: this.isHidden,
    DocumentSearchField.displayCaption_CCFN: this.displayCaption,
    DocumentSearchField.fieldName_CCFN: this.fieldName,
    DocumentSearchField.queryValue_CCFN: this.queryValue,
    DocumentSearchField.equalityOperator_CCFN: this.equalityOperator
  };

  factory DocumentSearchField.fromJson(Map<String, dynamic> data) =>DocumentSearchField(
      isActive: data[DocumentSearchField.isActive_CCFN],
      isHidden: data[DocumentSearchField.isHidden_CCFN],
      displayCaption: data[DocumentSearchField.displayCaption_CCFN],
      fieldName: data[DocumentSearchField.fieldName_CCFN],
      queryValue: data[DocumentSearchField.queryValue_CCFN],
      equalityOperator: data[DocumentSearchField.equalityOperator_CCFN]
  );

  String getQuery() {
    String returnValue = "${fieldName} ${equalityOperator} ?";

    if (equalityOperator == 'IN' || equalityOperator == 'NOT IN') {
      returnValue = "${fieldName} ${equalityOperator} ${queryValue}";
    }

    return returnValue;
  }

  static WhereQuerySetParam? getQuerySetParamFromDocumentSearchField(
      List<DocumentSearchField> documentSearchFieldList,
      {String phraseConnector: 'AND'}) {
    //final String queryConnector = "AND";

    String? query;
    List<dynamic> valueList = <dynamic>[];

    for (int la = 0; la < documentSearchFieldList.length; la++) {
      DocumentSearchField currentElement =
      documentSearchFieldList.elementAt(la);

      if (currentElement.isActive! &&
          currentElement.fieldName != null &&
          currentElement.fieldName!.length > 0) {
        final String currentQuery = currentElement.getQuery();

        if (query == null) {
          query = currentQuery;
        } else {
          query = "${query} ${phraseConnector} ${currentQuery}";
        }

        if (currentQuery.indexOf('?') >= 0) {
          valueList.add(currentElement.queryValue);
        }
      }
    }

    WhereQuerySetParam? returnValue = null;

    if (query != null) {
      returnValue = WhereQuerySetParam(query: query, valueList: valueList);
    }

    return returnValue;
  }
}
