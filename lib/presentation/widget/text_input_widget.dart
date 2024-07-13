
import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';

class AppInputTextField extends StatefulWidget {
  // final Color textColor;
  final String hint;
  final String? labelText;
  final TextStyle? labelStyle;
  final double labelPadding;

  final int maxLine;
  final int? maxLength;
  final bool isObscure;
  final bool isFilled;
  final Color? textFieldColor, hintFieldColor;
  final TextInputType? keyboardType;

  final double marginTop, marginBottom, marginLeft, marginRight;
  final TextEditingController? controller;
  final bool isReadOnly;
  final bool isEnabled;
  final double? fontSize;
  final double? height;
  final String? Function(String? val)? validator;

  final IconData? prefixIcon;
  final Color? prefixIconColor;

  final Widget? suffixIcon;
  final Color? suffixIconColor;

  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? borderColor;
  final Color? fillColor;

  final Color? textColor;
  final Color? cursorColor;

  final Color? hintTextColor;

  final String? initialVal;



  AppInputTextField({
    required this.hint,
    this.labelText,
    this.labelStyle = const TextStyle(
        fontSize: smallFontSize, color: white, fontFamily: "Poppins"),
    this.labelPadding = 0.0,
    this.maxLine = 1,
    this.maxLength,
    this.fontSize,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.isObscure = false,
    this.isFilled = true,
    this.keyboardType,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.height,
    this.marginLeft = 0.0,
    this.textFieldColor,
    this.hintFieldColor,
    this.validator,
    this.marginRight = 0.0,
    this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.hintTextColor = white,
    this.fillColor = darkBlack,
    this.textColor = white,
    this.cursorColor = white,
    this.initialVal = null,


  });

  @override
  State<AppInputTextField> createState() => _AppInputTextFieldState();
}

class _AppInputTextFieldState extends State<AppInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: TextFormField(
      
        enabled: widget.isEnabled,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize ?? smallFontSize,
          height: widget.height,
        ),
        controller: widget.controller,
        maxLines: widget.maxLine,
        readOnly: widget.isReadOnly,
        maxLength: widget.maxLength,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscure,
        cursorColor: widget.cursorColor,
      
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.isFilled,
          focusColor: widget.fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
         
          focusedBorder:  OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(buttonRadius)),
            borderSide:
            BorderSide(color: Colors.purple ?? buttonLightPurple),
          ),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(buttonRadius)),
            borderSide:
            BorderSide(color: Colors.purple  ?? buttonLightPurple),
          ),
          // errorStyle: TextStyle(backgroundColor: whiteColor),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: widget.prefixIconColor)
              : null,
          suffixIcon: widget.suffixIcon != null ? widget.suffixIcon : null,
          hintText: widget.hint,
          counterText: '',
          hintStyle: TextStyle(color: widget.hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
