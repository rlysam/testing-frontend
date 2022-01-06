// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/widgets/constants.dart';

class CommonStyleText {
  static TextStyle txtStyle({
    double? size = 14,
    FontWeight? weigth = FontWeight.normal,
    Color? color = const Color(0xff544B4B),
    bool isUnderlined = false,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weigth,
        decoration:
            isUnderlined ? TextDecoration.underline : TextDecoration.none);
  }
}

class CommonStyleInput {
  static InputDecoration textFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
    bool isCorrect = true,
    bool hasIcon = false,
    IconData myIcon = Icons.visibility_outlined,
  }) {
    OutlineInputBorder outlineRed() {
      return OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kFontColorRedWarning),
          borderRadius: BorderRadius.circular(10));
    }

    OutlineInputBorder outline() {
      return OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10));
    }

    return InputDecoration(
        //! size ng textbox? HEIGHT
        suffixIcon: hasIcon
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(child: Icon(myIcon, color: kIconColor1)),
              )
            : const SizedBox(),
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 11, 5),
        labelText: labelTextStr,
        hintText: hintTextStr,
        filled: true,
        fillColor: kWhite,
        enabledBorder: (isCorrect ? outline() : outlineRed()),
        focusedBorder: (isCorrect ? outline() : outlineRed()),
        disabledBorder: (isCorrect ? outline() : outlineRed()),
        border: (isCorrect ? outline() : outlineRed()));
  }
}

BoxDecoration divDecoration() {
  return BoxDecoration(
      border: Border.all(color: Colors.grey, width: 0.4),
      borderRadius: const BorderRadius.all(Radius.circular(10)));
}

class CommonStyleCategoryBorder {
  static BoxDecoration boxDecoration({
    Color categoryColor = Colors.grey,
    // bool isHighlighted = false,
  }) {
    return BoxDecoration(
      border: Border.all(
        color: categoryColor,
        width: (categoryColor!=Colors.grey ? 3 : 2),
      ),
      color: (categoryColor!=Colors.grey ? categoryColor.withOpacity(.3) : Colors.transparent),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}

class CommonStyleButton {
  static ButtonStyle btnStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return ButtonStyle(
        elevation: MaterialStateProperty.all(6),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(color: kPrimaryGreen),
        )),
        backgroundColor: MaterialStateProperty.all(kPrimaryGreen));
  }
}
