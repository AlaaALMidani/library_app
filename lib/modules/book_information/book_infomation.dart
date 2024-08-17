import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/shared/components/components.dart';
import 'package:library_app/shared/styles/styles.dart';

class BookInformationScreen extends StatelessWidget {
  const BookInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var model = AppCubit.get(context).bookInformationModel;
        return Scaffold(
            backgroundColor: white,
            bottomNavigationBar: model == null
                ? const SizedBox()
                : Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0,
                              -3), // adjust the offset to change the direction of the shadow
                        ),
                      ],
                    ),
                    child: BottomAppBar(
                      height: 55,
                      color: white,
                      child: Row(
                        children: [
                           Text(
                            '${model.price}\$',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ReusableButton(
                            borderRadius: BorderRadius.circular(8),
                            width: 150,
                            onPressed: () {},
                            color: Colors.blue,
                            child: const SmallText(
                              text: 'Buy Now!',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            body: model == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: padding - 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                            const Text(
                              'Book',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 18, 18, 18),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: buildCashedImage(
                                    model.coverImage,
                                    borderRadius: 7.0,
                                    height: 230.0,
                                    width: 140.0,
                                    fit: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    model.bookTitle,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    model.authorName,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    RatingStars(
                                      rating: model.averageRating,
                                      maxRating: 5,
                                      starColor: const Color.fromARGB(
                                          255, 255, 179, 0),
                                      starSize: 15,
                                    ),
                                    const Spacer(),
                                    const Text(
                                      '192 pages',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey),
                                    )
                                  ],
                                ),
                                Text(
                                  '${model.totalRatings} reviews',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(127, 96, 125, 139)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SmallIcon(
                                      text: model.categoryName,
                                      icon: Icons.type_specimen,
                                      color: const Color.fromARGB(210, 234, 94, 94),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SmallIcon(
                                      text: model.pdfSize,
                                      icon: Icons.type_specimen,
                                      color: const Color.fromARGB(211, 94, 234, 99),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'About',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  model.description,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 96, 125, 139)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
      },
    );
  }
}
