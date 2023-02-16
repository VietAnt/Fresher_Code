//Todo: Log
import 'dart:convert';

import 'package:flutter/material.dart';

class Log {
  //Todo: printJson
  void printJson({@required Map? json}) {
    JsonEncoder encoder = new JsonEncoder.withIndent(' ');
    String prettyprint = encoder.convert(json);
    print("LOGGING:  " + prettyprint);
  }

  //Todo: printLog
  void printLog(String str) {
    print("LOGGING: " + str);
  }
}
