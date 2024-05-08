import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:medchat/constants/apps_theme_config.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    this.hintText = '',
    this.fillColor,
    this.suffixIconName,
    this.obscureText = false,
    this.colorText = const Color(0XFF128C56),
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.label = '',
    this.hasLabel = false,
  });
  final String hintText;
  final Color? fillColor;
  final bool obscureText;
  final String? suffixIconName;
  final Color colorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final _formKey = GlobalKey<FormState>();
  final String label;
  final bool hasLabel;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        key: _formKey,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: hasLabel
              ? Text(
                  label,
                  style: TextStyle(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: appsTheme['dark']['w550']),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: appsTheme['secondary']),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: appsTheme['primary'])),
          fillColor: fillColor,
          filled: fillColor != null ? true : false,
          hintText: hintText,
          hintStyle: TextStyle(
              color: colorText, fontSize: 12.00, fontWeight: FontWeight.w700),
          suffixIcon: suffixIconName != null
              ? Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset(
                    'assets/icons/${suffixIconName!}.svg',
                  ),
                )
              : null,
        ),
        validator: validator,
      ),
    );
  }
}
