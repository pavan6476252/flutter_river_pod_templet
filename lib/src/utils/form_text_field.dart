import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';

class FormTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool enableObsecure;
  final Widget? child;
  final Color? backgroundColor;
  final Color? hintTextColors;
  final Color? textColor;
  final Widget? prefixWidget;
  final Function(String val)? onChanged;
  final TextEditingController? controller;
  const FormTextField({
    Key? key,
    this.labelText,
    this.child,
    this.hintText,
    this.textColor,
    this.hintTextColors,
    this.backgroundColor,
    this.prefixWidget,
    this.onChanged,
    this.controller,
    this.enableObsecure = false,
  }) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool obscured = false;
  @override
  void initState() {
    super.initState();
    obscured = widget.enableObsecure == true ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(
                widget.labelText!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: widget.textColor),
              )
            : SizedBox.shrink(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? ColorAssets.lightBlueGray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: widget.child ??
              TextFormField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                obscureText: obscured,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: widget.textColor),
                decoration: InputDecoration(
                  prefixIcon: widget.prefixWidget,
                  prefixIconColor: widget.textColor,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.hintTextColors),
                  suffixIcon: widget.enableObsecure
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                obscured
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              )))
                      : null,
                ),
              ),
        ),
      ],
    );
  }

  void _toggleObscured() {
    obscured = !obscured;
    setState(() {});
  }
}
