import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBadge extends StatefulWidget {
  final Widget? child;

  const ProfileBadge({Key? key, required this.child}) : super(key: key);

  @override
  State<ProfileBadge> createState() => _ProfileBadgeState();
}

class _ProfileBadgeState extends State<ProfileBadge> {
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
        toAnimate: true,
        shape: badge.BadgeShape.circle,
        badgeColor: Colors.white,
        position: badge.BadgePosition.bottomEnd(),
        padding: REdgeInsets.all(3),
        badgeContent: Container(
          padding: REdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFF3D5BF6),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/svg/camera_icon.svg'),
        ),
        child: widget.child);
  }
}
