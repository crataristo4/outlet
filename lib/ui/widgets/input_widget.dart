import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';
import '../../utils/enums.dart';
import '../../utils/functions.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint, helperText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final Widget prefix;
  final String? Function(String?) onChange;
  final String? Function(String?) onValidate;
  final String? Function(String?) onFieldSubmitted;
  final AppTextFieldType textFieldType;
  final Function()? onPrefixIconTapped;
  final Function()? onSuffixIconTapped;
  final Widget suffixIcon;
  final bool autoFocus;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatter;
  final bool readOnly, isDropDown;
  final Color focusAndEnableColor, filledColor;
  final int maxLines;
  final int maxLength;
  final double width;
  final TextAlign textAlign;
  final Function()? onTap;
  final double borderRadius;

  InputWidget({
    Key? key,
    this.onTap,
    required this.controller,
    required this.hint,
    this.helperText = '',
    required this.edgeInsetsGeometry,
    required this.onValidate,
    this.autoFocus = false,
    required this.prefix,
    this.readOnly = false,
    this.isDropDown = false,
    this.maxLines = 1,
    this.maxLength = 6,
    this.borderRadius = sixDp,
    this.focusAndEnableColor = Colors.transparent,
    this.filledColor = ThemeColor.kAppGrayLight,
    this.inputType = TextInputType.text,
    this.inputFormatter = const [],
    this.textFieldType = AppTextFieldType.regular,
    this.textAlign = TextAlign.start,
    this.width = double.infinity,
    this.suffixIcon = const SizedBox(),
    this.onPrefixIconTapped,
    this.onSuffixIconTapped,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    required this.onChange,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        switch (widget.textFieldType) {
          case AppTextFieldType.regular:
            return _regularTextField();

          case AppTextFieldType.phone:
            return _phoneTextField();

          default:
            return _regularTextField();
        }
      },
    );
  }

  Widget _phoneTextField() {
    return Container(
        width: widget.width,
        margin: widget.edgeInsetsGeometry,
        child: TextFormField(
          autofocus: widget.autoFocus,
          cursorColor: Colors.black,
          keyboardType: TextInputType.phone,
          readOnly: widget.readOnly,
          // maxLength: widget.maxLength,
          inputFormatters: [numberFiltering()],
          style: const TextStyle(color: Colors.black, fontFamily: 'regular'),
          controller: widget.controller,
          validator: widget.onValidate,
          onChanged: widget.onChange,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            prefixIcon: widget.prefix,
            contentPadding: const EdgeInsets.symmetric(horizontal: twelveDp, vertical: eightDp),
            /*    label: Text(widget.hint,
                style: const TextStyle(
                  color: Colors.black45,
                )),*/
            labelStyle: const TextStyle(color: ThemeColor.kAppBgColor, fontFamily: 'regular'),
            filled: true,
            hintText: widget.hint,
            fillColor: ThemeColor.kAppBgColor,
            helperStyle: const TextStyle(fontSize: tenDp),
            //hintStyle: const TextStyle(inherit: true, color:  Colors.black45),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeColor.kSecondary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeColor.kSecondary,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: ThemeColor.accent,
            )),
            // disabledBorder: InputBorder.none,
          ),
        ));
  }

  Widget _regularTextField() {
    return Container(
        width: widget.width,
        margin: widget.edgeInsetsGeometry,
        child: TextFormField(
          autofocus: widget.autoFocus,
          cursorColor: Colors.black,
          maxLines: widget.maxLines,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputFormatter,
          textAlign: widget.textAlign,
          readOnly: widget.readOnly,
          style: const TextStyle(color: Colors.black45, fontFamily: 'regular'),
          controller: widget.controller,
          validator: widget.onValidate,
          onChanged: widget.onChange,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
          onTap: widget.onTap,
          textCapitalization: widget.textCapitalization,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))),
              contentPadding: const EdgeInsets.symmetric(horizontal: twelveDp, vertical: eightDp),
              filled: true,
              fillColor: widget.filledColor,
              helperText: widget.helperText,
              prefixIcon: widget.prefix,
              suffixIcon:
                  widget.isDropDown ? const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black) : widget.suffixIcon,
              hintText: widget.hint,
              helperStyle: const TextStyle(fontSize: tenDp),
              hintStyle: const TextStyle(color: ThemeColor.kAppGrayDeep, fontFamily: 'regular'),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.focusAndEnableColor),
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                  borderSide: BorderSide(color: widget.focusAndEnableColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                  borderSide: BorderSide(color: ThemeColor.accent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                  borderSide: BorderSide(color: ThemeColor.accent))
              // disabledBorder: InputBorder.none,
              ),
        ));
  }
}
