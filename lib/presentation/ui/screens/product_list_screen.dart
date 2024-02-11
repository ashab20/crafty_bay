import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key,this.category});
final String? category;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (value){
      Get.find<MainBottomNavController>().backToHome();
    },
    child: Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          },
          icon:const Icon(Icons.arrow_back_ios),
        ),
        title:  Text( widget.category ?? "Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.90,
                mainAxisSpacing:8,
                crossAxisSpacing: 4
            ),
            itemBuilder: (context,index){
              return const FittedBox(child:ProductCardItem());
            }),
      ),
    ),);
  }
}
