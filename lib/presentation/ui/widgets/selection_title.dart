import 'package:flutter/material.dart';

class SelectionTitle extends StatelessWidget {
   SelectionTitle({
    super.key,
    required this.title,
    required this.onTapSeeAll
  });
  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title ,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),),
        TextButton(onPressed: onTapSeeAll, child: Text("See All"))
      ],
    );
  }
}
