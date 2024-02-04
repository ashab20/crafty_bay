import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.computer,size: 32,color: AppColors.primaryColor,),
          ),
        ),
        Text(title,style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor
        ),),
      ],
    );
  }
}
