import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final BuildContext parentContext;
  final void Function(BuildContext) action;
  final String label;

  const DangerButton(
      {super.key,
      required this.action,
      required this.label,
      required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        action(parentContext);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFFF0000)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  //#FF0000
                  color: Color(0xFFFF0000),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ))),
    );
  }
}
