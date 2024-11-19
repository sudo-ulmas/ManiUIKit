import 'package:flutter/material.dart';

extension StringExtension on String {
  bool validatePassportId() {
    final regExp = RegExp(r'^([A-Z]{2}\d{7}|[0-9]{14})$');
    return regExp.hasMatch(this);
  }

  TextInputType matchKeyboard() {
    if (isNotEmpty &&
        (_isDigit(codeUnitAt(0)) ||
            (length > 1 &&
                _isLetter(codeUnitAt(0)) &&
                _isLetter(codeUnitAt(1))))) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  int lengthLimit() {
    if (isNotEmpty && _isDigit(codeUnitAt(0))) {
      return 14;
    } else {
      return 9;
    }
  }

  bool _isDigit(int codeUnit) => codeUnit >= 48 && codeUnit <= 57;

  bool _isLetter(int codeUnit) =>
      (codeUnit >= 65 && codeUnit <= 90) || (codeUnit >= 97 && codeUnit <= 122);

  String get phoneMask => isEmpty
      ? ''
      : '''${substring(0, 2)} ${substring(2, 5)} ${substring(5, 7)} ${substring(7, 9)}''';

  DateTime? toDateTime() {
    if (isNotEmpty && length == 10) {
      try {
        return DateTime.parse(split('.').reversed.join());
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  String maskAccount() {
    final account = split(' ').join();
    if (account.length != 20) {
      return this;
    }
    return '''${account.substring(0, 5)} ${account.substring(5, 8)} ${account.substring(8, 9)} ${account.substring(9, 17)} ${account.substring(17)}''';
  }

  String unmaskAccount() => split(' ').join();
    
}
