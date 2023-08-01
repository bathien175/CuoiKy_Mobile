// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CRadioListTile extends StatefulWidget {
  dynamic value;
  dynamic groupValue;
  final Widget? title;
  final Widget? subtitle;
  final Widget? secondary;
  Function(dynamic)? onChanged;
  ListTileControlAffinity controlAffinity;
  CRadioListTile(
      {Key? key,
      this.title,
      this.controlAffinity = ListTileControlAffinity.trailing,
      this.secondary,
      this.subtitle,
      this.value,
      this.onChanged,
      this.groupValue})
      : super(key: key);

  @override
  State<CRadioListTile> createState() => _CRadioListTileState();
}

class _CRadioListTileState extends State<CRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: const Color(0xFF3D5BF6),
      ),
      child: RadioListTile<dynamic>(
        secondary: widget.secondary,
        subtitle: widget.subtitle,
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
        contentPadding: REdgeInsets.all(0),
        selected: true,
        activeColor: const Color(0xFF3D5BF6),
        title: widget.title,
        toggleable: true,
        controlAffinity: widget.controlAffinity,
      ),
    );
  }
}
