import 'package:flutter/material.dart';

enum ActionButtonStyle {
  common, accented
}

extension ActionButtonStyleExtension on ActionButtonStyle {
  Color get backgroundColor {
    switch (this) {
      case ActionButtonStyle.common:
        return Colors.transparent;
      case ActionButtonStyle.accented:
        return Colors.orange;
    }
  }

  Color get foregroundColor {
    switch (this) {
      case ActionButtonStyle.common:
        return const Color(0xFF162136);
      case ActionButtonStyle.accented:
        return Colors.white;
    }
  }

  Color get borderColor {
    switch (this) {
      case ActionButtonStyle.common:
        return const Color(0xFFD6D9E0);
      case ActionButtonStyle.accented:
        return Colors.transparent;
    }
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.style,
  });

  final Function() onPressed;
  final String text;
  final ActionButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(style.backgroundColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: style.borderColor)),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: style.foregroundColor,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ));
  }
}
