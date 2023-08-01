import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CCupertinoSwitch extends StatelessWidget {
  final bool valueBool;
  final Function(bool)? onChanged;
   const CCupertinoSwitch({super.key,
     required this.valueBool,
     required this.onChanged
   });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
                              value: valueBool,
                              onChanged: onChanged,
                              trackColor: Theme.of(context).brightness == Brightness.light? const Color(0xFFE7E7E7) :const Color(0xFF202427),
                              activeColor: const Color(0xFF3D5BF6),
                              thumbColor: valueBool ? Colors.white : Colors.white,
                            );
  }
}