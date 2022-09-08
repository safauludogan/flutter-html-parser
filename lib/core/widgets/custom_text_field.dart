import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/border_radius.dart';
import 'package:flutter_html_parser/core/constants/padding_items.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.autoFocus = false,
      this.textStyle,
      this.hintStyle,
      this.borderRadius});
  final hintText;
  final autoFocus;
  final textStyle;
  final hintStyle;
  final borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      style: textStyle ??
          context.textTheme.subtitle1!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: hintStyle ??
            context.textTheme.subtitle1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        filled: true,
        contentPadding: PaddingItems.paddingAllMedium,
        fillColor: Colors.white.withOpacity(0.09),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: borderRadius ?? BorderRadiusItem.lowCircular(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: borderRadius ?? BorderRadiusItem.lowCircular(),
        ),
      ),
    );
  }
}
