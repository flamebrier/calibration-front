import 'package:flutter/material.dart';
import '../styles.dart';

class CircleIconButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color highlightColor;
  final Color hoverColor;
  final Color splashColor;
  final GestureTapCallback onTap;
  final Widget icon;
  final EdgeInsets padding;

  CircleIconButton(
      {this.color,
      this.highlightColor,
      this.hoverColor,
      this.splashColor,
      this.onTap,
      @required this.icon,
      this.padding, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Styles.backgroundColor,
      shape: CircleBorder(
        side: BorderSide(color: borderColor ?? Styles.backgroundColor)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        onTap: onTap,
        child: Container(
          padding: padding ?? EdgeInsets.all(8),
          child: icon,
        ),
      ),
    );
  }
}
