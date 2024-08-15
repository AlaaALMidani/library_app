import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(246, 37, 158, 251);
const Color secondaryColor = Color.fromRGBO(21, 101, 192, 1);
const Color secondaryShadow = Color.fromRGBO(21, 101, 192, 0.403);
const Color white = Colors.white;
const List<BoxShadow> shadow = [
  BoxShadow(
    color: Color.fromARGB(16, 0, 0, 0),
    blurRadius: 10,
    offset: Offset(0, 8),
    // changes position of shadow
  ),
];
const List<BoxShadow> shadow2 = [
  BoxShadow(
    color: Color.fromARGB(9, 0, 0, 0),
    blurRadius: 5,
    offset: Offset(-5, 8),
    // changes position of shadow
  ),
];
const double padding = 22;
ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(color: Colors.black),
    selectedLabelStyle: TextStyle(color: Colors.black),
    showSelectedLabels: true,
    selectedItemColor: primaryColor,
    elevation: 0,
  ),
);
var gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 12, 36, 109),
      Color(0xFF00CCFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.0, 1.0],
    tileMode: TileMode.clamp);

Color kBackgroundColor = const Color(0xB4CFEAFF);
Color kHeadingColor = const Color(0xFF110C66);
Color kTextColor = const Color(0xFFA0AFC5);
Color kFocusedBorderColor = const Color(0xFF1916A5);
const Color textAndIconDarkColor = Color(0xff1A1834);

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text, this.color = Colors.grey});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Poppins',
          color: color,
          height: 1.5,
          fontSize: 16,
          fontWeight: FontWeight.w400),
    );
  }
}

class LargeText extends StatelessWidget {
  final String text;
  final Color color;
  const LargeText(
      {super.key, required this.text, this.color = textAndIconDarkColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
