import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pos_app/bill.dart';
import 'package:pos_app/button.dart';
import 'package:pos_app/input_field.dart';
import 'package:pos_app/item.dart';
import 'package:pos_app/item_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _itemNameController;
  late TextEditingController _quantityController;
  late TextEditingController _priceController;
  late TextEditingController _customerPhoneNoController;
  late TextEditingController _itemIdController;
  final FocusNode _itemNameNode = FocusNode();
  final FocusNode _quantityNode = FocusNode();
  final FocusNode _priceNode = FocusNode();
  final FocusNode _phoneNoNode = FocusNode();
  final FocusNode _itemIdNode = FocusNode();
  final FocusNode _btnAddNode = FocusNode();
  final FocusNode _btnTotalNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final List<Item> itemList = [];

  @override
  void initState() {
    super.initState();
    _itemNameController = TextEditingController();
    _quantityController = TextEditingController();
    _priceController = TextEditingController();
    _customerPhoneNoController = TextEditingController();
    _itemIdController = TextEditingController();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _customerPhoneNoController.dispose();
    _itemIdController.dispose();
    super.dispose();
  }

  void _onAddClick() {
    _validateTextFields()
        ? setState(() {
            _addItemIntoList(
              Item(
                itemName: _itemNameController.text,
                quantity: int.parse(_quantityController.text),
                price: double.parse(_priceController.text),
              ),
            );
            // _itemIdController.clear();
            // _priceController.clear();
            // _itemNameController.clear();
            // _quantityController.clear();
            // _customerPhoneNoController.clear();
            _formKey.currentState!.reset();
            _formKey.currentState!.save();
            _itemIdNode.requestFocus();
          })
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Invalid Data',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: secondaryColor,
            ),
          );
  }

  void _onTotalClick() {}

  bool _validateTextFields() {
    return _formKey.currentState?.validate() ?? false;
  }

  String? _itemIdValidator(String? value) {
    bool isValid = value?.isDigitString() ?? false;
    return isValid ? null : 'Invalid Item Id';
  }

  String? _itemNameValidator(String? value) {
    bool isValid = value?.isAlphabetic() ?? false;
    return isValid ? null : 'Invalid Item Name';
  }

  String? _quantityValidator(String? value) {
    bool isValid = value?.isDigitString() ?? false;
    return isValid ? null : 'Invalid Quantity';
  }

  String? _priceValidator(String? value) {
    bool isValid = value?.isDouble() ?? false;
    return isValid ? null : 'Invalid Price';
  }

  String? _customerPhoneNoValidator(String? value) {
    bool isValid = (value?.isDigitString() ?? false) && (value!.length == 11);
    return isValid ? null : 'Invalid Number';
  }

  void _addItemIntoList(Item item) {
    itemList.add(item);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var width = size.width;
    var height = size.height;
    var inputFieldWidth = width * 0.12;
    var inputFieldHeight = height * 0.12;
    var buttonWidth = width * 0.1, buttonHeight = height * 0.06;
    var listWidgetWidth = width * 0.4;
    var listWidgetHeight = height * 0.06;
    return SafeArea(
      child: Scaffold(
        body: ColoredBox(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: (pi / 180) * 270,
                child: Text(
                  'Point Of Sale',
                  style: MyTextStyle.font(
                    textStyle: TextStyle(
                      color: primaryColor,
                      fontSize: (width + height) / 40,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 30,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ItemInputField(
                            width: inputFieldWidth,
                            height: inputFieldHeight,
                            titleText: itemId,
                            focusNode: _itemIdNode,
                            autoFocus: true,
                            controller: _itemIdController,
                            validator: _itemIdValidator,
                          ),
                          ItemInputField(
                            width: inputFieldWidth,
                            height: inputFieldHeight,
                            titleText: kItemName,
                            focusNode: _itemNameNode,
                            controller: _itemNameController,
                            validator: _itemNameValidator,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ItemInputField(
                            width: inputFieldWidth,
                            height: inputFieldHeight,
                            titleText: kQuantity,
                            focusNode: _quantityNode,
                            controller: _quantityController,
                            validator: _quantityValidator,
                          ),
                          ItemInputField(
                            width: inputFieldWidth,
                            height: inputFieldHeight,
                            titleText: kPrice,
                            focusNode: _priceNode,
                            controller: _priceController,
                            validator: _priceValidator,
                          ),
                        ],
                      ),
                      ItemInputField(
                        width: inputFieldWidth,
                        height: inputFieldHeight,
                        titleText: customerPhoneNo,
                        focusNode: _phoneNoNode,
                        controller: _customerPhoneNoController,
                        validator: _customerPhoneNoValidator,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button(
                            width: buttonWidth,
                            height: buttonHeight,
                            buttonText: add,
                            focusNode: _btnAddNode,
                            onTap: _onAddClick,
                          ),
                          Button(
                            width: buttonWidth,
                            height: buttonHeight,
                            buttonText: btnTotal,
                            focusNode: _btnTotalNode,
                            onTap: _onTotalClick,
                          ),
                        ],
                      ),
                      BillWidget(
                        width: width * 0.27,
                        height: height * 0.4,
                        itemList: itemList,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 55,
                child: SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ItemListWidget(
                        width: listWidgetWidth,
                        height: listWidgetHeight,
                        shadowType: ItemListWidget.shadowUpside,
                        backgroundColor: Colors.white,
                        isHeader: true,
                        textColor: primaryColor,
                      ),
                      for (var i = 0; i < itemList.length; i++)
                        ItemListWidget(
                          width: listWidgetWidth,
                          height: listWidgetHeight,
                          serialNo: i + 1,
                          item: itemList[i],
                          shadowType: ItemListWidget.shadowUpside,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension Modification on String? {
  bool isAlphabetic() {
    if (this!.isEmpty) {
      return false;
    }
    return this?.codeUnits.every((element) =>
            (element >= 65 && element <= 90) ||
            (element >= 97 && element <= 122)) ??
        false;
  }

  bool isDigitString() {
    if (this!.isEmpty) {
      return false;
    }
    return this!.codeUnits.every((element) => element >= 48 && element <= 57);
  }

  bool isDouble() {
    if (this != null) {
      double? value = double.tryParse(this!);
      return value == null ? false : true;
    }
    return false;
  }
}
