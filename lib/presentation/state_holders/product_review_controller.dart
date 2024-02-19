import 'package:crafty_bay/data/models/cart_item.dart';
import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  late ProductReviewModel _productReviewModel;

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  ProductReviewModel get productReviewModel => _productReviewModel;

  final RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;

  Future<bool> getProductReview(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
      Urls.listReviewByProduct(productId),
    );
    if (response.isSuccess) {
      _productReviewModel = ProductReviewModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }


}
