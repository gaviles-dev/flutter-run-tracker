
import 'package:flutter/material.dart';

class ScreenBottomNav extends StatelessWidget {
  const ScreenBottomNav({
    Key key,
    @required this.child,
    @required this.color
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
         borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        )
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
