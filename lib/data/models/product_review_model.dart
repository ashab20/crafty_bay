
import 'package:crafty_bay/data/models/product_review_data.dart';

class ProductReviewModel {
  String? msg;
  List<ProductReviewData>? reviewList;

  ProductReviewModel({this.msg, this.reviewList});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewList = <ProductReviewData>[];
      json['data'].forEach((v) {
        reviewList!.add(ProductReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviewList != null) {
      data['data'] = reviewList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}