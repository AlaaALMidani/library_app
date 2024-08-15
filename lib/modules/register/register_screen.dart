import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/modules/login/login_screen.dart';
import 'package:library_app/modules/login/login_state.dart';
import 'package:library_app/modules/register/register_cubit.dart';
import 'package:library_app/modules/register/register_state.dart';
import 'package:library_app/shared/components/components.dart';
import 'package:library_app/shared/styles/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context, state) {
          var screenWidth = MediaQuery.of(context).size.width;
          var screenHeight = MediaQuery.of(context).size.height;
          const verticalPadding = 36.0;
          const horizontalPadding = 24.0;
          var registerCubit = RegisterCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: registerCubit.registerFormKey,
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LargeText(
                                text: 'Sing Up,',
                                color: white,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              SmallText(
                                text:
                                    'We\'re happy to seeing you enter knowledge world!',
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  commonTextFormFelid(
                                    height: 70,
                                    hintText: 'Alex_Bono',
                                    textEditingController:
                                        registerCubit.usernameController,
                                    labelText: 'name',
                                    prefixIcon: const Icon(Icons.person),
                                    textInputType: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'username are required';
                                      }
                                      return null;
                                    },
                                  ),
                                  commonTextFormFelid(
                                    height: 70,
                                    hintText: 'example@gmail.com',
                                    textEditingController:
                                        registerCubit.emailController,
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.person),
                                    textInputType: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  commonTextFormFelid(
                                    height: 70,
                                    hintText:
                                        'Make it strong like : 3scz32x30jaz',
                                    isPassword: registerCubit.obscureText,
                                    textEditingController:
                                        registerCubit.passwordController,
                                    labelText: 'Password',
                                    prefixIcon:
                                        const Icon(Icons.lock_open_outlined),
                                    suffixIcon: !registerCubit.obscureText
                                        ? const Icon(
                                            Icons.remove_red_eye_rounded)
                                        : const Icon(
                                            Icons.visibility_off_outlined),
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    onPressedSuffix: () {
                                      registerCubit.passwordVisibility();
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
                                            if (registerCubit
                                                .registerFormKey.currentState!
                                                .validate()) {}
                                          },
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: const SmallText(
                                            text: 'SIGN UP',
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: [
                                      const SmallText(
                                          text: 'If you have an account '),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            navigateTo(
                                                context, const LoginScreen());
                                            ;
                                          },
                                          child: const Text(
                                            'LOGIN',
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
