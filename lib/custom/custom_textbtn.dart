import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String lable;
  final double? width;
  final double? height;
  final int? maxLines;
  const MyTextButton({
    super.key,
    required this.lable,
    required this.onPressed,
    this.width,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(Colors.deepPurple[100]!),
        minimumSize:
            WidgetStateProperty.all<Size>(Size(width ?? 200, height ?? 50)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width ?? 180,
        child: Center(
          child: Text(lable,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
