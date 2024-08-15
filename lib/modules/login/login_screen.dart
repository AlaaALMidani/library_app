import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/modules/login/login_cubit.dart';
import 'package:library_app/modules/login/login_state.dart';
import 'package:library_app/shared/components/components.dart';
import '../../../shared/styles/styles.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) {
          var screenWidth = MediaQuery.of(context).size.width;
          var screenHeight = MediaQuery.of(context).size.height;
          const verticalPadding = 36.0;
          const horizontalPadding = 24.0;
          var loginCubit = LoginCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: loginCubit.loginFormKey,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.blue[800]!,
                      Colors.blue[600]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  )),
                  width: screenWidth,
                  height: screenHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: verticalPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LargeText(
                                text: 'LOGIN,',
                                color: white,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              SmallText(
                                text: 'Knowledge world missed you !',
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding * 2),
                            child: Column(
                              children: [
                                commonTextFormFelid(
                                  height: 70,
                                  hintText: 'example@gmail.com',
                                  textEditingController:
                                      loginCubit.usernameController,
                                  labelText: 'Email or Username',
                                  prefixIcon: const Icon(Icons.person),
                                  textInputType: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email or user name are required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 0,
                                ),
                                commonTextFormFelid(
                                  height: 70,
                                  isPassword: loginCubit.obscureText,
                                  textEditingController:
                                      loginCubit.passwordController,
                                  labelText: 'Password',
                                  prefixIcon:
                                      const Icon(Icons.lock_open_outlined),
                                  suffixIcon: !loginCubit.obscureText
                                      ? const Icon(Icons.remove_red_eye_rounded)
                                      : const Icon(
                                          Icons.visibility_off_outlined),
                                  textInputType: TextInputType.visiblePassword,
                                  onPressedSuffix: () {
                                    loginCubit.passwordVisibility();
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                state is! LoginLoadingState
                                    ? ReusableButton(
                                        onPressed: () {
                                          if (loginCubit
                                              .loginFormKey.currentState!
                                              .validate()) {
                                            print('ewfw');
                                          }
                                        },
                                        width: double.infinity,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        child: const SmallText(
                                          text: 'SIGN IN',
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator()),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    SmallText(
                                        text: 'If you are new to our family '),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          navigateTo(context, RegisterScreen());
                                          ;
                                        },
                                        child: const Text(
                                          'REGISTER',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: secondaryColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
