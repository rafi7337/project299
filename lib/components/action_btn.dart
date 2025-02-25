import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionBtn extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color? fontColor;
  final VoidCallback onClick;
  final int? flexValue;
  const ActionBtn({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.onClick,
    this.flexValue,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue??1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(.25),
          ),
          onPressed: onClick,
          child: Text(
            btnText.toUpperCase(),
            style: TextStyle(
              color: fontColor ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
