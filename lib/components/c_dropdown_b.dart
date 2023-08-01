import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CDropdownButtonFormField extends StatelessWidget {
  final bool isExpanded;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final void Function(dynamic)? onSaved;
  final void Function(dynamic)? onChanged;

  CDropdownButtonFormField(
      {Key? key,
      this.isExpanded = false,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      required this.items,
      this.onSaved,
      required this.onChanged})
      : super(key: key);

  final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.transparent, width: 0));

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      isExpanded: true,
      onChanged: (value) {
        // ignore: avoid_print
        print(value);
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items,
      onSaved: onSaved,
    );
  }
}
