import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnlineBadge extends StatefulWidget {
  final Widget? child;

  const OnlineBadge({Key? key, required this.child}) : super(key: key);

  @override
  State<OnlineBadge> createState() => _OnlineBadgeState();
}

class _OnlineBadgeState extends State<OnlineBadge> {
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
        toAnimate: true,
        shape: badge.BadgeShape.circle,
        badgeColor: Colors.white,
        position: badge.BadgePosition.topEnd(),
        padding: REdgeInsets.all(4),
        badgeContent: Container(
          padding: REdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Color(0xFF13B97D),
            shape: BoxShape.circle,
          ),
        ),
        child: widget.child);
  }
}
