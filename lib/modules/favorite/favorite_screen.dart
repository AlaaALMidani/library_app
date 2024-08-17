import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/modules/book/book_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: cubit.favoritesCardsModel == null
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1), () {
                        cubit.gitFavoritesData();
                      });
                    },
                    child: Books(
                      model: cubit.favoritesCardsModel!,
                      withAppBar: false,
                    ),
                  ));
      },
    );
  }
}
