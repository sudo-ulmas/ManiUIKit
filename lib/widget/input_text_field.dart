import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mani_uikit/theme/theme.dart';
import 'package:mani_uikit/util/util.dart';
import 'package:mani_uikit/widget/svg_icon.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    super.key,
    this.keyboardType,
    this.textCapitalization,
    this.lengthLimit,
    this.value,
    this.inputFormatters = const [],
    this.prefixIcon,
    this.isPassword = false,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.enabled = true,
    this.color,
    this.textStyle,
    this.hintStyle,
    this.suffixColor,
  });

  final String? hintText;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int? lengthLimit;
  final String? value;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefixIcon;
  final bool isPassword;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final Color? color;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final ColorFilter? suffixColor;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool passwordHidden = true;
  @override
  void didUpdateWidget(covariant InputTextField oldWidget) {
    if (oldWidget.value != widget.value && widget.lengthLimit == widget.value?.length) {
      FocusScope.of(context).unfocus();
    }
    if (oldWidget.keyboardType != widget.keyboardType) {
      FocusScope.of(context).unfocus();
      Future<void>.delayed(Durations.short1).then((value) => FocusScope.of(context).requestFocus());
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => TextField(
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        enableSuggestions: false,
        scrollPadding: const EdgeInsets.only(bottom: 500),
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        style: context.textTheme.inputTextStyle,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.lengthLimit),
          ...widget.inputFormatters,
        ],
        obscureText: widget.isPassword && passwordHidden,
        textInputAction: widget.textInputAction,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: AppDimensions.defaultPadding,
          ),
          hintText: widget.hintText,
          hintStyle: context.textTheme.hintTextStyle,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:  BorderRadius.all(
              Radius.circular(15)
            ),
          ),
          fillColor: widget.color ?? context.colorScheme.inputFieldColor,
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() {
                        passwordHidden = !passwordHidden;
                      }),
                      child: passwordHidden
                          ? SvgIcon(
                              icon: Assets.icons.eyeVisible,
                              width: 24,
                              height: 24,
                              fit: BoxFit.none,
                              colorFilter: widget.suffixColor,
                            )
                          : SvgIcon(
                              icon: Assets.icons.eyeHidden,
                              width: 24,
                              height: 24,
                              fit: BoxFit.none,
                              colorFilter: widget.suffixColor,
                            ),
                    )
                  : null),
          filled: true,
        ),
      );
}
