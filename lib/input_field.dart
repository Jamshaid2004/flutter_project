import 'package:flutter/material.dart';
import 'package:pos_app/button.dart';

typedef Validation = String? Function(String? value);

const Color primaryColor = Colors.brown;
const Color secondaryColor = Colors.grey;
const Color textColor = Colors.black;

const kItemName = 'Item Name';
const kQuantity = 'Quantity';
const kPrice = 'Price';
const qty = 'Qty';
const kTotal = 'Total';
const discount = 'Discount';
const tax = 'Tax';
const netAmount = 'Net Amount';
const customerPhoneNo = 'Phone No.';
const itemId = 'Item Id';

class ItemInputField extends StatelessWidget {
  final double width, height;
  final String titleText;
  final TextEditingController controller;
  final double radius = 10;
  final TextInputType keyboardType;
  final Validation validator;
  final FocusNode focusNode;
  final bool autoFocus;

  const ItemInputField({
    super.key,
    required this.width,
    required this.height,
    required this.titleText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.focusNode,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titleText,
              style: MyTextStyle.formalFont(
                textStyle: TextStyle(
                  color: textColor,
                  fontSize: (width + height) / 17,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.7,
            child: TextFormField(
              autofocus: autoFocus,
              focusNode: focusNode,
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              textAlign: TextAlign.justify,
              style: MyTextStyle.formalFont(
                textStyle: TextStyle(
                  color: textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: (width + height) / 20,
                ),
              ),
              decoration: InputDecoration(
                prefixIconColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.focused)) {
                    return Colors.black;
                  } else {
                    return Colors.blue;
                  }
                }),
                helperText: '',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(
                    color: secondaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(
                    color: primaryColor,
                    width: 3,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    radius,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(
                    color: primaryColor,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
