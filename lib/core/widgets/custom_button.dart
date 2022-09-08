import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/border_radius.dart';
import 'package:flutter_html_parser/core/constants/colors.dart';
import 'package:flutter_html_parser/core/constants/height_weight.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.callback,
      required this.text,
      this.color,
      this.imageAsset,
      this.textColor = Colors.white});
  final VoidCallback callback;
  final String text;
  final Color? color;
  final Color? textColor;
  final Widget? imageAsset;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadiusItem.lowCircular())),
            backgroundColor: MaterialStateProperty.all<Color>(
                color ?? ColorConstants.blueColor)),
        onPressed: callback,
        child: SizedBox(
            height: dynamicHeight(value: 0.075, context: context),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageAsset != null
                    ? _buttonIcon(context)
                    : const SizedBox.shrink(),
                _buttonText(context),
              ],
            ))));
  }

  SizedBox _buttonIcon(BuildContext context) {
    return SizedBox(
                      height: dynamicHeight(value: 0.075, context: context),
                      child: imageAsset);
  }

  Text _buttonText(BuildContext context) {
    return Text(
                text,
                style: context.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.w700),
              );
  }
}
