import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/modules/login/login_state.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  bool passwordColor = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void passwordVisibility() {
    obscureText = !obscureText;
    emit(PasswordVisibilityState());
  }

  var model;
  postLoginData(context) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': usernameController.text,
        'password': passwordController.text,
      },
    ).then((value) {
   //   model = OnlineStudentModel.fromJSON(value.data);

      emit(LoginSuccessState());
    // navigateTo(context, const Layout());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response);
        emit(LoginErrorState(error.toString()));
      } else {
        print(error.toString());
        emit(LoginErrorState(error.toString()));
      }
    });
  }

  
}
