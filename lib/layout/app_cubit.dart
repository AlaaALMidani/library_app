import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/modules/downloads/downloads_screen.dart';
import 'package:library_app/modules/favorite/favorite_screen.dart';
import 'package:library_app/modules/home/home_screen.dart';
import 'package:library_app/modules/profile/profile_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget body = HomeScreen();

  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const DownloadScreen(),
    const ProfileScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavBarItemList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile')
  ];

  int currentScreenIndex = 0;
  changeCurrentScreenIndex(int index) {
    currentScreenIndex = index;
    body = screens[currentScreenIndex];
    emit(ChangeScreenIndexState());
  }

  //search settings
  ScrollController? scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  getSearchData() {
    // getELearningData(
    //   query: {'q': searchController.text, 'sort_by': 'title:asc'},
    // );
  }

  void onTap() async {
    await scrollController!.animateTo(350.0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    emit(AppInitialState());
  }
}
