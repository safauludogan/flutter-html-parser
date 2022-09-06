import 'package:flutter/material.dart';

enum ImagePaths { image_404 }

extension ImageExtension on ImagePaths {
  String _path() {
    switch (this) {
      case ImagePaths.image_404:
        return name;
    }
  }

  String get _imagePath => 'assets/image/${_path()}.jpg';

  Widget toWidget({double height = 150}) {
    return Image.asset(_imagePath, height: height);
  }
}
