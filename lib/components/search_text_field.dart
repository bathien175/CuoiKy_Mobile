// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_search/textfield_search.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textControllor;
  final String? hintText;
  final Function? future;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  SearchTextField({
    super.key,
    required this.textControllor,
    this.hintText,
    this.future,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
  });

  final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: const BorderSide(color: Colors.transparent, width: 1));

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      textStyle: Theme.of(context).textTheme.titleMedium,
      label: label,
      controller: textControllor,
      future: future,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
            child: prefixIcon,
          ),
          hintText: hintText,
          suffixIcon: Padding(
            padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
            child: suffixIcon,
          ),
          border: outlineInputBorder,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? const Color(0xFFE2E4EA)
                      : const Color(0xFF111315),
                  width: 1)),
          enabledBorder: outlineInputBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.light
              ? const Color(0xFFF9F9F9)
              : const Color(0xFF292E32),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle),
    );
  }
}
