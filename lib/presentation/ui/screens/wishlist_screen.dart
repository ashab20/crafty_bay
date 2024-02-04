import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaishListScreen extends StatefulWidget {
  const WaishListScreen({super.key});

  @override
  State<WaishListScreen> createState() => _WaishListScreenState();
}

class _WaishListScreenState extends State<WaishListScreen> {
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
            icon:Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Wishlist",style: TextStyle(
              fontSize: 18
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.90,
                  mainAxisSpacing:8,
                  crossAxisSpacing: 4
              ),
              itemBuilder: (context,index){
                return FittedBox(child:ProductCardItem());
              }),
        ),
      ),
    );
  }
}
