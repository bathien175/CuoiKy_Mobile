// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CElevatedButton extends StatefulWidget {
  const CElevatedButton({
    required this.child,
    required this.onPressed,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.key,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final FocusNode? focusNode;
  final void Function(bool)? onFocusChange;
  final void Function(bool)? onHover;
  final void Function()? onLongPress;

  @override
  final Key? key;

  @override
  State<CElevatedButton> createState() => _CElevatedButtonState();
}

class _CElevatedButtonState extends State<CElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        
        //disabledBackgroundColor: Color(0xFF292E32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(46.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 18.h),
        backgroundColor: const Color(0xFF3D5BF6),
        textStyle: GoogleFonts.dmSans(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFFFFFFF),
        ),
      ),
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: widget.onLongPress,
      key: widget.key,
      child: widget.child,
    );
  }
}
