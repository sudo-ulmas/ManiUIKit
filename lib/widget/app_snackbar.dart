import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mani_uikit/mani_uikit.dart';

class AppSnackbar {
  const AppSnackbar({
    required this.error,
    this.rawMessage,
  });
  final ErrorHandlerModel error;
  final String? rawMessage;

  Future<dynamic> build(BuildContext context) => Flushbar<void>(
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(8),
        margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.defaultPadding,
        ),
        messageText: Text(
          rawMessage ?? '${error.code}: ${error.message(context)}',
          style: context.theme.textTheme.buttonTextStyle,
        ),
        duration: const Duration(seconds: 3),
      ).show(context);
}

