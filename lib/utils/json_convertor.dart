import 'dart:convert';
import 'dart:html' as webFile;

import 'package:flutter/foundation.dart';

void writeFile(Map<String, dynamic> data) {
  if (kIsWeb) {
    var blob = webFile.Blob([jsonEncode(data)], 'text/plain', 'native');

    var anchorElement = webFile.AnchorElement(
      href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
    )
      ..setAttribute("download", "data.json")
      ..click();
  }
}
