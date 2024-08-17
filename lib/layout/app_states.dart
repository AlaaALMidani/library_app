abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeScreenIndexState extends AppStates {}

//
//
//
//
//
class GetSpecificCategoryBooksSuccessState extends AppStates {}

class GetSpecificCategoryBooksLoadingState extends AppStates {}

class GetSpecificCategoryBooksErrorState extends AppStates {
  final String error;
  GetSpecificCategoryBooksErrorState(this.error);
}

//
//
//
//
//
class GetCategoriesErrorState extends AppStates {
  final String error;
  GetCategoriesErrorState(this.error);
}

class GetCategoriesLoadingState extends AppStates {}

class GetCategoriesSuccessState extends AppStates {}

//
//
//
//
//

class GetFavoriteErrorState extends AppStates {
  final String error;
  GetFavoriteErrorState(this.error);
}

class GetFavoriteLoadingState extends AppStates {}

class GetFavoriteSuccessState extends AppStates {}

//
//
//
//
//
//
class GetPurchasedErrorState extends AppStates {
  final String error;
  GetPurchasedErrorState(this.error);
}

class GetPurchasedLoadingState extends AppStates {}

class GetPurchasedSuccessState extends AppStates {}
//
//
//
//

class GetBookInformationLoadingState extends AppStates {}

class GetBookInformationSuccessState extends AppStates {}

class GetBookInformationErrorState extends AppStates {
  final String error;
  GetBookInformationErrorState(this.error);
}

//
//
//
class AddToFavoriteLoadingState extends AppStates {}

class AddToFavoriteSuccessState extends AppStates {}

class AddToFavoriteErrorState extends AppStates {
  final String error;

  AddToFavoriteErrorState(this.error);
}

//
//
//
class CheckBoxState extends AppStates {}

class ShowBottomSheetState extends AppStates {}

class AccessState extends AppStates {}

class GetScheduleLoadingState extends AppStates {}

class GetScheduleSuccessState extends AppStates {}

class GetScheduleErrorState extends AppStates {}
