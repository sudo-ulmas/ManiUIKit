import 'package:flutter/widgets.dart';

abstract class ErrorHandlerModel {
  ErrorHandlerModel(this.code);

  final int code;

  String message(BuildContext context);
}
