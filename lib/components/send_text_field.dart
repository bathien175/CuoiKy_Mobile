// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendTextFormField extends StatefulWidget {
  final TextEditingController? textControllor;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool? showCursor;
  void Function()? onTap;
  final String? Function(String?)? validator;
  void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  // ignore: deprecated_member_use
  final ToolbarOptions? toolbarOptions;

  SendTextFormField(
      {super.key,
      this.textControllor,
      this.hintText,
      this.initialValue,
      this.keyboardType,
      this.textInputAction,
      this.showCursor,
      this.onTap,
      this.validator,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.toolbarOptions});

  @override
  State<SendTextFormField> createState() => _SendTextFormFieldState();
}

class _SendTextFormFieldState extends State<SendTextFormField> {
  @override
  Widget build(BuildContext context) {
    final inputFocusBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xFF3D5BF6)
                : const Color(0xFF292E32),
            width: 1));

    final inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.transparent, width: 1));
    return TextFormField(
      controller: widget.textControllor,
      decoration: InputDecoration(
          fillColor: Theme.of(context).brightness == Brightness.light
              ? const Color(0xFFF9F9F9)
              : const Color(0xFF292E32),
          prefixIcon: Padding(
            padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
            child: widget.prefixIcon,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          enabledBorder: inputBorder,
          border: inputBorder,
          focusedBorder: inputFocusBorder),
      style: Theme.of(context).textTheme.titleMedium,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      onTap: widget.onTap,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      // ignore: deprecated_member_use
      toolbarOptions: widget.toolbarOptions,
      minLines: 1,
      maxLines: 4,
    );
  }
}
