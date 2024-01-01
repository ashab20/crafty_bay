import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key,this.width,this.height});

  final double? width,height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logo, width: width ?? 120,height: height ?? 100);
  }
}
