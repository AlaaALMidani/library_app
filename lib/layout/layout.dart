import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/modules/home/home_screen.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 248, 252, 255),
            bottomNavigationBar: MyBottomNavBar(
              cubit: cubit,
            ),
            body: cubit.body
            );
      },
    );
  }
}
