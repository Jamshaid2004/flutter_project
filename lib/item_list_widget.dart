import 'package:flutter/material.dart';
import 'package:pos_app/button.dart';
import 'package:pos_app/input_field.dart';
import 'package:pos_app/item.dart';

class ItemListWidget extends StatelessWidget {
  final double width, height;
  final int serialNo;
  final Item item;
  final int shadowType;
  final bool isHeader;
  final Color textColor, backgroundColor;
  static const int shadowUpside = 0;
  static const int shadowDownside = 1;
  const ItemListWidget({
    super.key,
    required this.width,
    required this.height,
    this.serialNo = 0,
    this.item = const Item(itemName: '', quantity: 0, price: 0.0),
    this.isHeader = false,
    this.shadowType = shadowDownside,
    this.textColor = Colors.white,
    this.backgroundColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 10.0;
    var Item(:itemName, :quantity, :price) = item;
    var fontSize = (width + height) / 30;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(radius),
            ),
            boxShadow: [
              if (shadowType == shadowDownside)
                const BoxShadow(
                  color: secondaryColor,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                  spreadRadius: 5,
                )
              else
                const BoxShadow(
                    color: secondaryColor,
                    blurRadius: 5,
                    offset: Offset(-5, -5),
                    spreadRadius: 5),
            ],
          ),
          child: Builder(
            builder: (context) {
              if (isHeader) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Text(
                          'Sr.',
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Center(
                        child: Text(
                          kItemName,
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Center(
                        child: Text(
                          kQuantity,
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 24,
                      child: Center(
                        child: Text(
                          kPrice,
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 24,
                      child: Center(
                        child: Text(
                          kTotal,
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Text(
                          serialNo.toString(),
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Center(
                        child: Text(
                          itemName,
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 24,
                      child: Center(
                        child: Text(
                          price.toString(),
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 24,
                      child: Center(
                        child: Text(
                          '${item.totalPrice().toString()}/-',
                          style: MyTextStyle.formalFont(
                            textStyle: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
