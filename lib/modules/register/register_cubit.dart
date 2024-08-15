import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/modules/register/register_state.dart';
import 'package:library_app/shared/network/remote/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  String? genderSelectedItem;
  bool male = true;
  bool obscureText = true;
  bool reObscureText = true;
  bool passwordColor = false;
  bool rePasswordColor = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<TextEditingController> textEditingControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = [
    'name',
    'User name',
    'Email',
    'Phone number',
    'Address',
    'Study Year'
  ];
  List<String> hintTexts = [
    'Fullname',
    'Username',
    'Email',
    'Phone number',
    'Location',
    'Study year'
  ];
  List<IconData> icons = [
    Icons.accessibility,
    Icons.person,
    Icons.email_outlined,
    Icons.call,
    Icons.house_rounded,
    Icons.menu_book, //study
  ];
  List<String> jsonLabels = [
    'fullname',
    'username',
    'email',
    'phone_number',
    'address',
    'study_year',
  ];
  List<TextInputType> textInputTypes = [
    TextInputType.name,
    TextInputType.name,
    TextInputType.emailAddress,
    TextInputType.number,
    TextInputType.text,
    TextInputType.number,
  ];
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Map<String, String>? registerData;
  List<String> gender = [
    'Male',
    'Female',
  ];

  void passwordVisibility() {
    obscureText = !obscureText;
    emit(PasswordVisibilityState());
  }

  void changePasswordIcon() {
    passwordColor = !passwordColor;
    emit(PasswordVisibilityState());
  }

  void rePasswordVisibility() {
    reObscureText = !reObscureText;
    emit(RePasswordVisibilityState());
  }

  void changeRePasswordIcon() {
    rePasswordColor = !rePasswordColor;
    emit(RePasswordVisibilityState());
  }

  void genderDropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      genderSelectedItem = selectedValue;
      emit(GenderDropDownCallBackState());
    }
  }

  void onMalePressed() {
    male = true;
    emit(RegisterChangeGenderState());
  }

  void onFemalePressed() {
    male = false;
    emit(RegisterChangeGenderState());
  }

  // OnlineStudentModel? model;
  Map<String, dynamic>? errorData;

  String? validate(
    String label,
  ) {
    if (errorData != null) {
      if (errorData!['errors'][label] != null) {
        return errorData!['errors'][label][0];
      }
    }
    return null;
  }

  postRegisterData(context) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': textEditingControllers[1].text,
        'email': textEditingControllers[2].text,
        'password': passwordController.text,
      },
    ).then((value) {
      // model = OnlineStudentModel.fromJSON(value.data);
      // //
      // accessToken = model!.access_token;
      // CashHelper.saveData(key: 'accessToken', data: accessToken);
      // CashHelper.saveData(key: 'onBoarding', data: true);

      // user = UserType.onlineStudent;
      // userData = model!.userData!;
      // //
      // print(value.data);

      // emit(RegisterSuccessState());
      // AppCubit.get(context).chooseUserType(user);
      // navigateTo(context, const Layout());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response);
        if (error.response!.data['message'] != 'Unauthenticated.') {
          errorData = error.response!.data;
          registerFormKey.currentState!.validate();
        }
        emit(RegisterValidationState(error.response!.data));
      } else {
        print(error.toString());
        emit(RegisterErrorState());
      }
    });
  }
}
