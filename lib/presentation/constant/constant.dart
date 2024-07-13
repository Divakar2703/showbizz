import 'package:flutter/material.dart';

/// colors
const Color darkBlack = Color(0xFF111111); // background black
const Color white = Color(0xFFFFFFFF); // text white
const Color lightWhiteTextColor = Color(0xFFD4E1F5); // text white
const Color bottomSheetBlackBackground = Color(0xFF1A1A1A); // text white
const Color sliderGreen = Color(0xFF00B288); // text white

Color buttonGreen = const Color(0xFF3CC9D7).withOpacity(0.3); // Green button
Color buttonLightBlack = const Color(0xFF373737).withOpacity(0.5); // btn black
Color containerBrown = const Color(0xFFFFD29D).withOpacity(0.8); // Green button
Color containerBrownDark = const Color(0xFFFF9E2D).withOpacity(0.8); // Green button
Color purpleColor = const Color(0xFF7625CF); // dark Purple  button
Color buttonDarkPurple =
    const Color(0xFF7625CF).withOpacity(0.9); // dark Purple  button
Color buttonLightPurple =
    const Color(0xFF9245E8).withOpacity(0.9);

Color greyButton =
    const Color(0xFF919191).withOpacity(0.3);



Color gradientTextPurple1 =
    const Color(0xFF8B78FF).withOpacity(0.3); // gradient Purple x text
Color gradientTextPurple2 =
    const Color(0xFF5451D6).withOpacity(0.3); // gradient Purple x text


Color gradientTextRed1 =
    const Color(0xFFFFA0BC).withOpacity(0.5); // gradient Purple x text
Color gradientTextRed2 =
    const Color(0xFFFF1B5E).withOpacity(0.5); // gradient Purple x text



Color gradientTextBlue1 =
    const Color(0xFFB1EEFF).withOpacity(0.3); // gradient Purple x text
Color gradientTextBlue2 =
    const Color(0xFF29BAE2).withOpacity(0.3); // gradient Purple x text



Color gradientTextGreen1 =
    const Color(0xFFA9FFEA); // gradient Purple x text
Color gradientTextGreen2 =
    const Color(0xFF00B288); // gradient Purple x text



/// GRADIENT WIDGET
final LinearGradient linearGradientPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
        gradientTextPurple1,
        gradientTextPurple2,
    ]);


final LinearGradient linearGradientRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
        gradientTextRed1,
        gradientTextRed2,
    ]);


final LinearGradient linearGradientBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
        gradientTextBlue1,
        gradientTextBlue2,
    ]);

final LinearGradient linearGradientBrown = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
        containerBrown,
        containerBrownDark,
    ]);


/// hero stag strings
const String logoHeroString = "logo_widget";


getDeviceSize(context){
  return MediaQuery.of(context).size;
}
getBaseUrl() {
  return 'https://sns.alliedtechnologies.co/app_api/';
}
