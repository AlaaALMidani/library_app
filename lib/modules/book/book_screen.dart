import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: BooksGrid());
  }
}

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
    return Container(
      height: 700,
      width: 130,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 25,
            child: Container(
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
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(136, 0, 0, 0),
                    offset: Offset(0, 6),
                    blurRadius: 5),
              ],
              border: Border.all(
                width: 1, // border width
                color: const Color.fromARGB(166, 31, 111, 231), // border color
              ),
            ),
            height: 115,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // add border radius
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BooksGrid extends StatelessWidget {
  const BooksGrid({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getColumnCount(context),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.8),
        itemCount: 10,
        itemBuilder: (context, index) {
          return BookItem(
            author: 'ahmad',
            img: 'assets/images/book_cover.png',
            rate: 2.3,
            title: 'how to be good',
            color: gridItemsColor[index % gridItemsColor.length],
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
