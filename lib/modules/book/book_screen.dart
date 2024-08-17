import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/layout/app_cubit.dart';
import 'package:library_app/layout/app_states.dart';
import 'package:library_app/models/books_model.dart';
import 'package:library_app/modules/book_information/book_infomation.dart';
import 'package:library_app/shared/components/components.dart';
import '../../shared/styles/styles.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.booksCardsModel == null
              ? const Center(child: CircularProgressIndicator())
              : Books(
                  model: cubit.booksCardsModel!,
                  withAppBar: true,
                ),
        );
      },
    );
  }
}

class Books extends StatelessWidget {
  final BooksCardsModel model;
  final bool withAppBar;
  const Books({super.key, required this.model, required this.withAppBar});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        !withAppBar
            ? const SizedBox()
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: padding - 10),
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
                        Text(
                          model.category!.categoryName!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 18, 18, 18),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 20,
        ),
        Expanded(child: BooksGrid(model: model)),
      ],
    );
  }
}

class BooksGrid extends StatelessWidget {
  final BooksCardsModel model;
  const BooksGrid({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getColumnCount(context),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.8),
        itemCount: model.books!.length,
        itemBuilder: (context, index) {
          final itemData = model.books![index];
          return GestureDetector(
            onTap: () {
              navigateTo(context, const BookInformationScreen());
              AppCubit.get(context).getBookInformation(itemData.id);
            },
            child: BookItem(
              author: itemData.author!,
              img: itemData.coverImage!,
              rate: 4.9,
              title: itemData.bookTitle!,
              color: gridItemsColor[index % gridItemsColor.length],
            ),
          );
        });
  }

  int _getColumnCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 400 && screenWidth < 600) return 3;
    return screenWidth >= 600 ? 4 : 2;
  }
}

const alpha = 130;
List<Color> gridItemsColor = [
  const Color.fromARGB(alpha, 251, 174, 174),
  const Color.fromARGB(alpha, 113, 207, 185),
  const Color.fromARGB(alpha, 153, 160, 252),
  const Color.fromARGB(alpha, 255, 170, 91),
  const Color.fromARGB(alpha, 255, 100, 115),
];

class BookItem extends StatelessWidget {
  const BookItem(
      {super.key,
      required this.img,
      required this.title,
      required this.author,
      required this.rate,
      required this.color});
  final String img;
  final String title;
  final String author;
  final double rate;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 130,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 25,
            child: SizedBox(
              height: 200,
              width: 130,
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: color,
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      author,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rate.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          buildCashedImage(
            img,
            borderRadius: 7.0,
            height: 115.0,
            width: 80.0,
            fit: true,
          )
        ],
      ),
    );
  }
}




//  Center(
//                         child: ReusableButton(
//                         onPressed: () {
//                           cubit.gitCategoryData(context);
//                         },
//                         borderRadius: BorderRadius.circular(20),
//                         width: 70,
//                         color: Colors.blue,
//                         child: Text('try again'),
//                       ))