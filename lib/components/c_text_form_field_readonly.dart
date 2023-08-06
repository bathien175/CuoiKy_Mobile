// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextFormFieldReadOnly extends StatelessWidget {
  final TextEditingController? textControllor;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? showCursor;
  void Function()? onTap;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  // ignore: deprecated_member_use
  final ToolbarOptions? toolbarOptions;

  CTextFormFieldReadOnly(
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
        this.onChanged,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.toolbarOptions});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textControllor,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
          child: prefixIcon,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      style: Theme.of(context).textTheme.titleMedium,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: true, // Đặt readOnly thành true để không cho phép chỉnh sửa
      showCursor: showCursor,
      onTap: onTap,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      // ignore: deprecated_member_use
      toolbarOptions: toolbarOptions,
    );
  }
}
