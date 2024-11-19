import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppColorScheme extends Equatable {
  const AppColorScheme({
    required this.primaryTextColor,
    required this.primaryVariantTextColor,
    required this.secondaryTextColor,
    required this.inputHintTextColor,
    required this.inputTextColor,
    required this.cardColor,
    required this.disabledButtonColor,
    required this.onPrimaryTextColor,
    required this.primaryColor,
    required this.primaryVariantColor,
    required this.primaryAccentColor,
    required this.borderColor,
    required this.titleTextColor,
    required this.valueTextColor,
    required this.inputFieldColor,
    this.errorColor = Colors.red,
    this.successColor = Colors.green,
    this.warningColor = const Color(0xffffcc00),
  });

  factory AppColorScheme.light() => const AppColorScheme(
        primaryTextColor: Colors.black,
        primaryVariantTextColor: Color(0xff26334D),
        secondaryTextColor: Color(0xff6B7A99),
        inputHintTextColor: Color(0xff7D8FB3),
        inputTextColor: Color(0xff1A2233),
        cardColor: Colors.white,
        disabledButtonColor: Color(0xffE4E7F0),
        onPrimaryTextColor: Colors.white,
        // primaryColor: Color(0xff9747FF),
        // primaryVariantColor: Color(0xff8833FF),
        // primaryAccentColor: Color(0xff662AB2),
        primaryColor: Color(0xff566df6), //Color(0xff9747FF),
        primaryVariantColor: Color(0xff566df6), //Color(0xff8833FF),
        primaryAccentColor: Color(0xff566df6), //Color(0xff662AB2),
        borderColor: Color(0xffDADEE6),
        titleTextColor: Color(0xff80858E),
        valueTextColor: Color(0xff1A1736),
        inputFieldColor: Color(0xfff7f8fa),
      );

  /// We don't need dark theme for now
  factory AppColorScheme.dark() => AppColorScheme.light();

  final Color primaryTextColor;
  final Color primaryVariantTextColor;
  final Color secondaryTextColor;
  final Color inputHintTextColor;
  final Color inputTextColor;
  final Color cardColor;
  final Color disabledButtonColor;
  final Color onPrimaryTextColor;
  final Color primaryColor;
  final Color primaryVariantColor;
  final Color primaryAccentColor;
  final Color borderColor;
  final Color titleTextColor;
  final Color valueTextColor;
  final Color inputFieldColor;

  final Color errorColor;
  final Color warningColor;
  final Color successColor;

  @override
  List<Object?> get props => [
        primaryTextColor,
        secondaryTextColor,
        inputHintTextColor,
        inputTextColor,
        cardColor,
        disabledButtonColor,
        onPrimaryTextColor,
        primaryColor,
        primaryVariantColor,
        primaryVariantTextColor,
        primaryAccentColor,
        borderColor,
        titleTextColor,
        valueTextColor,
        inputFieldColor,
      ];
}
