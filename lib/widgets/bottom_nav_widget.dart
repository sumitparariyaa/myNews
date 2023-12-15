import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key, this.onTap, this.icon,});

  final void Function()? onTap;
  final IconData? icon;
  final double? size = 28;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Icon(icon, color: Colors.black87, size: size,),
      ),
    );
  }
}
