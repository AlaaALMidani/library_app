import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/modules/book/book_screen.dart';
import 'package:library_app/shared/components/components.dart';
import 'package:library_app/shared/styles/styles.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.boughtCardsModel != null
              ? RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1), () {
                      cubit.getBoughtBooksData();
                    });
                  },
                  child: Books(
                    model: cubit.boughtCardsModel!,
                    withAppBar: false,
                  ))
              : state is GetPurchasedErrorState
                  ? CustomErrorWidget(
                      errorMessage: state.error,
                      function: () {
                        cubit.getBoughtBooksData();
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        );
      },
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function function;
  const CustomErrorWidget(
      {super.key, required this.errorMessage, required this.function});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Color.fromARGB(255, 54, 244, 95),
            size: 50.0,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'We are so so sorry!',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 10,
          ),
          ReusableButton(
              onPressed: () {
                function();
              },
              width: 50,
              child: Text(
                'Reload!',
                style: TextStyle(color: white),
              ),
              color: Color.fromARGB(255, 54, 244, 95),
              borderRadius: BorderRadius.circular(10))
        ],
      ),
    );
  }
}
