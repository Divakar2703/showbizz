import 'package:flutter/material.dart';
// Radius of card
const double card_radius = 20;


// padding constant
// const double screenSidePadding = 20;
const double buttonRadius = 15;

const double screenPadding = 25;



// font sizes
const double smallestFontSize = 12;
const double smallerFontSize = 14;
const double smallFontSize = 16;
const double mediumFontSize = 18;
const double largeFontSize = 20;
const double largerFontSize = 24;
// const double largestFontSize = 40;

// const double heading1 = 36;

getDeviceHeight(context){
  return MediaQuery.of(context).size.height;
}
getDeviceWidth(context){
  return MediaQuery.of(context).size.width;
}