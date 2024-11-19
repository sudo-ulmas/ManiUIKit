extension IntExtension on int {
  String get maskBalance {
    var text = toString();
    final length = text.length;
    var pointer = length - 3;
    for (var i = 0;
        i < (length % 3 == 0 ? length ~/ 3 - 1 : length ~/ 3);
        i += 1) {
      text = '${text.substring(0, pointer)} ${text.substring(pointer)}';
      pointer = pointer - 3;
    }
    return text;
  }

  // String get maskMainBalance {
  //   var text = toString();
  //   final length = text.length;
  //   var pointer = length - 3;
  //   for (var i = 0;
  //       i < (length % 3 == 0 ? length ~/ 3 - 1 : length ~/ 3);
  //       i += 1) {
  //     text = '${text.substring(0, pointer)}.${text.substring(pointer)}';
  //     pointer = pointer - 3;
  //   }
  //   return text;
  // }
}
