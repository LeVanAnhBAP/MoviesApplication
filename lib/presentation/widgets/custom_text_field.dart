import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/extensions/theme.dart';

class TextFieldInputText extends StatefulWidget {
  final Color fillColor;
  final String placeHolder;
  final String text;
  final bool isUserEdit;
  final int? lengthInputLimit;
  final bool obscureText;
  final TextAlign textAlign;
  final int? maxLength;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool onlyRead;

  const TextFieldInputText({
    super.key,
    required this.fillColor,
    required this.placeHolder,
    this.text = '',
    this.isUserEdit = true,
    this.textAlign = TextAlign.left,
    this.lengthInputLimit = 100,
    this.maxLength,
    this.textStyle,
    required this.obscureText,
    required this.onChanged,
    this.controller,
    this.onlyRead = false,
    this.hintStyle,
  });

  @override
  State<TextFieldInputText> createState() => _TextFieldInputTextState();
}

class _TextFieldInputTextState extends State<TextFieldInputText> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatters = [];
    inputFormatters = [
      LengthLimitingTextInputFormatter(widget.lengthInputLimit),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: TextFormField(
            readOnly: widget.onlyRead,
            controller: widget.controller,
            enableInteractiveSelection: true,
            inputFormatters: inputFormatters,
            initialValue: widget.controller != null ? null : widget.text,
            enabled: widget.isUserEdit,
            onChanged: widget.onChanged,
            textAlign: widget.textAlign,
            style: widget.textStyle ??
                context.typographies.body.copyWith(color: Colors.black),
            autofocus: false,
            obscureText:
                widget.obscureText ? _passwordVisible : widget.obscureText,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        !_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  style: BorderStyle.none,
                  width: 0,
                ),
              ),
              filled: true,
              hintText: context.tr(widget.placeHolder),
              hintStyle: widget.hintStyle ??
                  context.typographies.body.copyWith(color: Colors.black38),
              fillColor: widget.fillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
