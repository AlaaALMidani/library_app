import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/shared/styles/styles.dart';

import '../../layout/app_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(246, 37, 158, 251),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Ready to Explore Knowledge Hub?',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: padding, bottom: padding, top: padding - 10),
                child: Text(
                  'Choose a Gateway',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(228, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding,
                    vertical: padding,
                  ),
                  child: ResponsiveGrid(
                    materialsName: materials,
                    gridItemsColor: gridItemsColor,
                    materialsImages: materialsImages,
                  ),
                ),
              )
            ]),
          ));
    });
  }
}

class MyBottomNavBar extends StatelessWidget {
  final AppCubit cubit;
  const MyBottomNavBar({
    super.key,
    required this.cubit,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 25),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedIconTheme:
            const IconThemeData(color: Colors.white60, size: 19),
        items: cubit.bottomNavBarItemList!,
        onTap: (index) => cubit.changeCurrentScreenIndex(index),
        currentIndex: cubit.currentScreenIndex,
      ),
    );
  }
}

class MaterialItem extends StatelessWidget {
  const MaterialItem({
    super.key,
    this.boxShadow,
    required this.color,
    required this.materialName,
    required this.image,
  });
  final List<BoxShadow>? boxShadow;
  final Color color;
  final String materialName;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              boxShadow: shadow,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: padding),
              child: Column(
                children: [
                  Text(
                    materialName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: image),
                ],
              ),
            )),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Color> gridItemsColor;
  final List<Image> materialsImages;
  final List<String> materialsName;
  const ResponsiveGrid(
      {super.key,
      required this.gridItemsColor,
      required this.materialsImages,
      required this.materialsName});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getColumnCount(context),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 25.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return MaterialItem(
            color: gridItemsColor[index % gridItemsColor.length], 
            image: materialsImages[index % materialsImages.length],
            materialName: materialsName[index % materials.length],
          );
        });
  }

  int _getColumnCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 600 ? 4 : 2;
  }
}

List<Color> gridItemsColor = [
  const Color(0xffFBAEAE),
  const Color(0xff71CFB9),
  const Color(0xff999FFC),
  const Color(0xffFFAA5B),
  const Color(0xffFF6474),
];

List<String> materials = [
  'Literary books',
  'Scientific books',
  'Educational books',
  'Religious books',
  'Health and Medicine',
  'Arts and Design'
];
List<Image> materialsImages = [
  Image.asset('assets/images/geo.png'),
  Image.asset('assets/images/physicsIcon.png'),
  Image.asset('assets/images/mathIcon.png'),
  Image.asset('assets/images/chemistry.png'),
];
const List<BoxShadow> gridShadow = [
  BoxShadow(
    color: Color.fromARGB(16, 0, 0, 0),
    blurRadius: 10,
    offset: Offset(0, 4),
    // changes position of shadow
  ),
];
