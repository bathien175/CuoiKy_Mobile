// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CCheckBoxListTile extends StatefulWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  final Widget? title;
  final Widget? secondary;
  ListTileControlAffinity controlAffinity;

  CCheckBoxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.secondary,
    this.controlAffinity = ListTileControlAffinity.trailing,
  }) : super(key: key);

  @override
  State<CCheckBoxListTile> createState() => _CCheckBoxListTileState();
}

class _CCheckBoxListTileState extends State<CCheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFE2E4EA)
            : const Color(0xFF808080),
      ),
      child: CheckboxListTile(
        value: widget.value,
        onChanged: widget.onChanged,
        title: widget.title,
        tileColor: const Color(0xFF3D5BF6),
        activeColor: const Color(0xFF3D5BF6),
        selected: true,
        controlAffinity: widget.controlAffinity,
        secondary: widget.secondary,
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
        contentPadding: REdgeInsets.all(0),
      ),
    );
  }
}
