import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_app/input_field.dart';

const add = 'Add';
const btnTotal = 'Total';

class Button extends StatelessWidget {
  final double width, height;
  final double radius = 10;
  final String buttonText;
  final GestureTapCallback onTap;
  final FocusNode focusNode;
  const Button({
    super.key,
    required this.width,
    required this.height,
    required this.buttonText,
    required this.onTap,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
    focusNode: focusNode,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            boxShadow: const [
              BoxShadow(
                color: secondaryColor,
                offset: Offset(5, 5),
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Text(
            buttonText,
            style: MyTextStyle.formalFont(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: (width + height) / 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextStyle extends TextStyle {
  static TextStyle font({required TextStyle textStyle}) {
    return GoogleFonts.aguafinaScript(textStyle: textStyle);
  }

  static TextStyle formalFont({required TextStyle textStyle}) {
    return GoogleFonts.amiri(textStyle: textStyle);
  }
}
