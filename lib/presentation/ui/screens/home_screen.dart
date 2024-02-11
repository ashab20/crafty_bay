import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/selection_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(width: 8,),
              searchTextFormField,
              const SizedBox(width: 16,height: 16,),
              const BannerCarousel(),
              const SizedBox(height: 8,),
              SelectionTitle(title:"All Categories",onTapSeeAll: (){}),
              categoryList,
              const SizedBox(height: 8,),
              SelectionTitle(title:"Populra",onTapSeeAll: (){
                Get.to(() => const ProductListScreen());
              }),
              popularProductList,
              const SizedBox(height: 8,),
              SelectionTitle(title:"Special",onTapSeeAll: (){}),
              popularProductList,
              const SizedBox(height: 8,),
              SelectionTitle(title:"New",onTapSeeAll: (){}),
              popularProductList,
            ],
          ),
        ),
      ),
    );
  }

  TextFormField get searchTextFormField {
    return TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon:const  Icon(Icons.search, color: Colors.grey,),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            );
  }
}

SizedBox get categoryList {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 10,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return CategoryItem(title: "Electronics");
      },separatorBuilder: (_,__){
          return const SizedBox(width: 8);
      },
      ),
    );
}

SizedBox get  popularProductList {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return const ProductCardItem();
        },separatorBuilder: (_,__){
        return const SizedBox(width: 8);
      },
      ),
    );
  }



AppBar get appBar {
  return AppBar(
    title: Image.asset(AssetsPath.logoNav),
    actions: [
      CircleIconButton(
        onTap: (){},
        iconData: Icons.person,
      ),
      const SizedBox(width: 8,),
      CircleIconButton(
        onTap: (){},
        iconData: Icons.call,
      ),
      const SizedBox(width: 8,),
      CircleIconButton(
        onTap: (){},
        iconData: Icons.notifications_active_outlined,
      ),
    ],
  );
}


