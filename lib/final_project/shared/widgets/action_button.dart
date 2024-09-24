import 'package:flutter/material.dart';

import '../themes/colors.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    super.key,
    required this.title,
    required this.action,
    this.buttonColor,
    this.buttonWidth,
    this.buttonheight,
    this.titleStyle,
  });
  String title;
  Color? buttonColor;
  double? buttonWidth;
  double? buttonheight;
  TextStyle? titleStyle;
  Function() action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonheight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(title,style: titleStyle,),
      ),
    );
  }
}

class ActionButtonWithIcon extends StatelessWidget {
  ActionButtonWithIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.action,
      this.buttonColor});
  String title;
  IconData icon;
  Color? buttonColor;
  VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(title),
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
