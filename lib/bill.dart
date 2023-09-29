import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pos_app/button.dart';
import 'package:pos_app/input_field.dart';
import 'package:pos_app/item.dart';

class BillWidget extends StatelessWidget {
  final double width, height;
  final List<Item> itemList;
  const BillWidget({
    super.key,
    required this.width,
    required this.height,
    required this.itemList,
  });

  int _totalItemsQuantity() {
    return itemList.fold(
        0, (previousValue, element) => previousValue + element.quantity);
  }

  double _totalAmount() {
    return itemList.fold(
        0, (previousValue, element) => previousValue + element.totalPrice());
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = _totalAmount();
    double fontSize = (width + height) / 30;

    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
            tileMode: TileMode.clamp,
          ),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                    color: secondaryColor,
                    blurRadius: 5,
                    offset: Offset(-5, -5),
                    spreadRadius: 5),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total Items : ${_totalItemsQuantity()}',
                textAlign: TextAlign.start,
                style: MyTextStyle.formalFont(
                  textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total Amount : $totalAmount',
                style: MyTextStyle.formalFont(
                  textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Taxes : 10%',
                style: MyTextStyle.formalFont(
                  textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Net Amount : ${totalAmount - (totalAmount * 0.1)}/-',
                style: MyTextStyle.formalFont(
                  textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
