import 'package:flutter/material.dart';

//lahat ng hardcoded, dito
var profilePictureURL =
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

// Convert Figma Pixels to Flutter Pixels
double pToF(double pixel) => pixel / 1.5;

// Yung whitespace sa gilid ba...
double horizontalPaddingPagesDesktop = 200;

//Main Colors
Color kPrimaryGreen = const Color(0xff26C4A4);
Color kPrimaryPink = const Color(0xffF95C78);
Color kDark = const Color(0xff393D3F);
Color kWhite = const Color(0xffF4F4FF);

Color kIconColor1 = const Color(0xff8E7B7B);
Color kFontColorBlack = const Color(0xff544B4B);
Color kFontColorWhite = Colors.white;
Color kFontColorRed = const Color(0xffC41E3A);
Color kFontColorRedWarning = const Color(0xffE70E0E);
Color kGray = const Color(0xffDEDEE1);

// Banner Colors
Color kBanner1 = Color.fromARGB(255, 58, 6, 202);
Color kBanner2 = Color.fromARGB(255, 231, 119, 14);
Color kBanner3 = Color.fromARGB(255, 230, 64, 23);
Color kBanner4 = Color.fromARGB(255, 47, 231, 14);

// Font Size
double kFontSizeHeader = pToF(48);
double kFontSizeSubtitle = pToF(18);
double kFontSizeSubtitleSmall = pToF(14);

// Font Weight
FontWeight bold = FontWeight.bold;
FontWeight normal = FontWeight.normal;
FontWeight medium = FontWeight.w600;
