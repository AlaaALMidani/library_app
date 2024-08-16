import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_app/shared/components/components.dart';

import '../../shared/styles/styles.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding - 10),
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
                    'Books',
                    style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: BooksGrid()),
          ],
        ));
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
        itemCount: 9,
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
            'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/363200963/original/4fcc05d81373e38ab5e13087700cef26433f4621/design-kindle-and-e-book-covers.jpg',
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
