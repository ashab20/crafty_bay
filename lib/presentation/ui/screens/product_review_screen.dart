import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_review_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/create_review_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key,required this.productId});
  final int productId;
  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.productId);
    // Get.find<ProductReviewController>().getProductReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reviews'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<ProductReviewController>(
            builder: (ProductReviewController) {
              if (ProductReviewController.inProgress == true) {
                return const CenterCircularProgressIndicator();
              }
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                      child: Visibility(
                        visible: ProductReviewController.inProgress== false,
                        replacement: const Center(
                          child: Text('No Reviews'),
                        ),
                        child: ListView.builder(
                          itemCount:
                          ProductReviewController.productReviewModel?.reviewList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductReviewsCard(
                              reviewData:
                              ProductReviewController.productReviewModel.reviewList![index],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  totalAndCreateReviewsSection(
                      ProductReviewController.productReviewModel.reviewList?.length??0),
                ],
              );
            }
        ),
      ),
    );
  }

  Container totalAndCreateReviewsSection(int totalReviews) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews (${totalReviews.toString()})',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {
                if (Get.find<AuthController>().isTokenNotNull == false) {
                  AuthController.goToLogin();
                  return;
                }
                Get.to(() => CreateReviewScreen(
                  productId: widget.productId,
                ));
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
