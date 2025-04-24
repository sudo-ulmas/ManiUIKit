import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mani_uikit/theme/app_color_scheme.dart';
import 'package:mani_uikit/util/util.dart';

class AppTextTheme extends Equatable {
  const AppTextTheme({
    required this.colorScheme,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.hintTextStyle,
    required this.inputTitleTextStyle,
    required this.inputTextStyle,
    required this.buttonTextStyle,
    required this.highlightedTextStyle,
    required this.headingTextStyle,
    required this.digitButtonTextStyle,
    required this.accountTextStyle,
    required this.accountTypeTextStyle,
    required this.usernameTextStyle,
  });

  factory AppTextTheme.fromColorScheme(AppColorScheme colorScheme) => AppTextTheme(
        colorScheme: colorScheme,
        titleTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        subtitleTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.secondaryTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.inputHintTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        inputTitleTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.secondaryTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        inputTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.inputTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        buttonTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.onPrimaryTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        highlightedTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        headingTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        digitButtonTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryVariantTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        accountTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.inputTextColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        accountTypeTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryAccentColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        usernameTextStyle: TextStyle(
          package: packageName,
          color: colorScheme.primaryVariantColor,
          fontFamily: FontFamily.gilroy,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      );

  static const packageName = 'mani_uikit';

  final AppColorScheme colorScheme;

  final TextStyle titleTextStyle;
  final TextStyle headingTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle hintTextStyle;
  final TextStyle inputTitleTextStyle;
  final TextStyle inputTextStyle;
  final TextStyle buttonTextStyle;
  final TextStyle highlightedTextStyle;
  final TextStyle digitButtonTextStyle;
  final TextStyle accountTextStyle;
  final TextStyle accountTypeTextStyle;
  final TextStyle usernameTextStyle;

  @override
  List<Object?> get props => [
        colorScheme,
        titleTextStyle,
        subtitleTextStyle,
        hintTextStyle,
        inputTextStyle,
        inputTitleTextStyle,
        buttonTextStyle,
        highlightedTextStyle,
        headingTextStyle,
        digitButtonTextStyle,
        accountTextStyle,
        accountTypeTextStyle,
        usernameTextStyle,
      ];
}
