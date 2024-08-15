import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/layout.dart';
import 'package:library_app/modules/book/book_screen.dart';
import 'package:library_app/modules/book_information/book_infomation.dart';
import 'package:library_app/modules/home/home_screen.dart';
import 'package:library_app/modules/library/resources_screen.dart';
import 'package:library_app/modules/login/login_screen.dart';
import 'package:library_app/modules/register/register_screen.dart';
import 'package:library_app/shared/block_observer.dart';
import 'package:library_app/shared/network/locale/cash_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BookInformationScreen(),
      ),
    );
  }
}
