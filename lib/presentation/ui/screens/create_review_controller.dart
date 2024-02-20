import 'package:crafty_bay/presentation/state_holders/add_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_review_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _productIdTEController = TextEditingController();
  final TextEditingController _ratingTEController = TextEditingController();
  final TextEditingController _writeReviewTEController =
  TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _productIdTEController.text = widget.productId.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36, top: 60),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productIdTEController,
                  readOnly: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: "product I'D"),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter product id';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ratingTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      labelText: 'Rating', hintText: ' 8/10'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter valid rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _writeReviewTEController,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Write Review',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Shipping Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<AddReviewController>(builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final response = await controller.addReview(
                              widget.productId,
                              int.parse(_ratingTEController.text.trim()),
                              _writeReviewTEController.text.trim(),
                            );
                            if (response) {
                              Navigator.pop(context);
                              Get.find<ProductReviewController>()
                                  .getProductReview(widget.productId);
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Create review failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productIdTEController.clear();
    _ratingTEController.clear();
    _writeReviewTEController.clear();
    super.dispose();
  }
}