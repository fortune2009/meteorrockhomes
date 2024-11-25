import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meteorrockhome/shared/utils/colors.dart';

class FWt {
  FWt();

  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight semiBold = FontWeight.w500;
  static FontWeight mediumBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight text = FontWeight.w900;
}

class Styles {
  static Text light(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.light,
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: 'EuclidCircularA',
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.regular,
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: 'EuclidCircularA',
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static TextSpan spanRegular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
    Function()? recognizer,
  }) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = recognizer,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.regular,
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: 'EuclidCircularA',
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text medium(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? align,
    double? height,
    double? letterSpacing,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.mediumBold,
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        fontFamily: 'EuclidCircularA',
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text semiBold(
    String text, {
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    TextAlign? align,
    double? height,
    double? letterSpacing,
    bool strike = false,
    bool underline = false,
    int? lines,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: FWt.semiBold,
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
        fontFamily: 'EuclidCircularA',
      ),
    );
  }

  static TextSpan spanBold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
    Function()? recognizer,
  }) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = recognizer,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: FWt.bold,
        color: color ?? AppColors.black,
        fontFamily: 'EuclidCircularA',
        height: height,
        letterSpacing: letterSpacing,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }

  static Text bold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: FWt.bold,
        fontFamily: 'EuclidCircularA',
        color: color ?? AppColors.black,
        height: height,
        letterSpacing: letterSpacing,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }

  static Text extraBold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    int? lines,
    bool strike = false,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontFamily: 'EuclidCircularA',
        fontWeight: FWt.extraBold,
        color: color ?? AppColors.black,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}
