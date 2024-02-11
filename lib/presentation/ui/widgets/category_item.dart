import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ProductListScreen(category: 'Electronics',));
      },
      child: Column(
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
      ),
    );
  }
}
