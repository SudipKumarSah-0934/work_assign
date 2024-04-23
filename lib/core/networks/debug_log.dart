import 'dart:developer';

import 'package:flutter/foundation.dart';

debugLog(String text) {
  if (kDebugMode) {
    log(text);
  }
}
