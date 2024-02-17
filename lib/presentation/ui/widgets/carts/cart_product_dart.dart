
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({super.key});

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.network(
            'https://s0.as-img.com/r/pic/1371017/1500/1500/side.jpg?bg=f5f5f5&u=1600819928https://s0.as-img.com/r/pic/1371017/1500/1500/side.jpg?bg=f5f5f5&u=1600819928',
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nice Shoes 12ksm 2021 Edition',
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text('Color: Red'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Size: Xl'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$100",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                    ValueListenableBuilder(
                        valueListenable: noOfItems,
                        builder: (context, value, _) {
                          return ItemCount(
                            initialValue: value,
                            minValue: 0,
                            maxValue: 20,
                            step: 1,
                            decimalPlaces: 0,
                            color: AppColors.primaryColor,
                            onChanged: (v) {
                              noOfItems.value = v.toInt();
                            },
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
