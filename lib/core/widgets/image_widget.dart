import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ImagePaths { image_404, image_login, google_icon }

extension ImageExtension on ImagePaths {
  String _path() {
    switch (this) {
      case ImagePaths.image_404:
        return name;
      case ImagePaths.image_login:
        return name;
      case ImagePaths.google_icon:
        return name;
    }
  }

  String get _imagePath => 'assets/image/${_path()}.jpg';
  String get _imagePathPng => 'assets/icon/${_path()}.png';

  Widget toWidget(
      {double? width,
      double height = 150,
      BoxFit? fit,
      AlignmentGeometry? alignment}) {
    return Image.asset(
      _imagePath,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width ?? 150,
      alignment: alignment ?? Alignment.center,
    );
  }

  Widget toIcon({BoxFit? fit, AlignmentGeometry? alignment}) {
    return Image.asset(_imagePathPng);
  }
}
