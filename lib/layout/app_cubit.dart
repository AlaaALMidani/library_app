import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/books_model.dart';
import 'package:library_app/models/category_model.dart';
import 'package:library_app/modules/book/book_screen.dart';
import 'package:library_app/modules/downloads/downloads_screen.dart';
import 'package:library_app/modules/favorite/favorite_screen.dart';
import 'package:library_app/modules/home/home_screen.dart';
import 'package:library_app/shared/components/components.dart';
import 'package:library_app/shared/components/constants.dart';
import 'package:library_app/shared/network/remote/dio_helper.dart';
import 'package:library_app/shared/network/remote/end_points.dart';

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
  ];
  List<BottomNavigationBarItem> bottomNavBarItemList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
  ];

  int currentScreenIndex = 0;
  changeCurrentScreenIndex(int index) {
    currentScreenIndex = index;
    body = screens[currentScreenIndex];
    if (index == 1 && favoritesCardsModel == null) {
      gitFavoritesData();
    } else if (index == 2 && boughtCardsModel == null) {
      gitBoughtBooksData();
    }
    emit(ChangeScreenIndexState());
  }

//book information
  BookInformationModel? bookInformationModel;
  gitBookInformation(id) {
    emit(GetBookInformationLoadingState());
    DioHelper.getData(
      url: '$PURCHASED$id',
      token: accessToken,
    ).then((value) {
      bookInformationModel = BookInformationModel.fromJson(value.data);
      print(value.data);
      emit(GetBookInformationSuccessState());
    }).catchError((error) {
      print(error.response);
      String massage =
          error.response!.data['message'] ?? 'Its network coniction Error';

      emit(GetBookInformationErrorState(massage));
    });
  }

// Bought books
  BooksCardsModel? boughtCardsModel;
  gitBoughtBooksData() {
    emit(GetPurchasedLoadingState());
    DioHelper.getData(
      url: PURCHASED,
      token: accessToken,
    ).then((value) {
      boughtCardsModel = BooksCardsModel.fromJson(value.data);
      print(value.data);
      emit(GetPurchasedSuccessState());
    }).catchError((error) {
      print(error.response);
      String massage =
          error.response!.data['message'] ?? 'Its network coniction Error';

      emit(GetPurchasedErrorState(massage));
    });
  }

//favorites
  BooksCardsModel? favoritesCardsModel;
  gitFavoritesData() {
    favoritesCardsModel = null;
    emit(GetFavoriteLoadingState());
    DioHelper.getData(
      url: FAVORITE,
      token: accessToken,
    ).then((value) {
      print(value.data);

      favoritesCardsModel = BooksCardsModel.fromJson(value.data);
      emit(GetFavoriteSuccessState());
    }).catchError((error) {
      print(error.toString());
      String massage = error.toString();
      if (error is DioException) {
        String massage =
            error.response!.data['message'] ?? 'Its network coniction Error';
      }
      emit(GetFavoriteErrorState(massage));
    });
  }

/* categories*/
  CategoriesModel? categoriesModel;
  gitCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      String massage = error.toString();
      if (error is DioException) {
        String massage =
            error.response!.data['message'] ?? 'Its network coniction Error';
      }
      emit(GetCategoriesErrorState(massage));
    });
  }

//books inside specific category
  BooksCardsModel? booksCardsModel;
  gitCategoryData(context, id) {
    booksCardsModel = null;
    emit(GetSpecificCategoryBooksLoadingState());
    navigateTo(context, const BookScreen());
    DioHelper.postData(
      url: CATEGORY_BOOKS,
      data: {'category_id': id},
    ).then((value) {
      booksCardsModel = BooksCardsModel.fromJson(value.data);
      print(value.data);
      emit(GetSpecificCategoryBooksSuccessState());
    }).catchError((error) {
      print(error.toString());
      String massage =
          error.response!.data['message'] ?? 'Its network coniction Error';
      emit(GetSpecificCategoryBooksErrorState(massage));
    });
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
