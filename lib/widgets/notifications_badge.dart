import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

class NotificationsBadge extends StatefulWidget {
  final Widget child;

  const NotificationsBadge({Key? key, required this.child}) : super(key: key);

  @override
  State<NotificationsBadge> createState() => _NotificationsBadgeState();
}

class _NotificationsBadgeState extends State<NotificationsBadge> {
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      toAnimate: true,
      shape: badge.BadgeShape.circle,
      badgeColor: const Color(0xFFFF4747),
      position: badge.BadgePosition.topEnd(),
      child: widget.child,
    );
  }
}
