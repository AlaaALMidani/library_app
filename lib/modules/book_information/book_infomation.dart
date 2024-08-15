import 'package:flutter/material.dart';
import 'package:library_app/shared/components/components.dart';
import 'package:library_app/shared/styles/styles.dart';

class BookInformationScreen extends StatelessWidget {
  const BookInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(padding - 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  const Text(
                    'Books',
                    style: TextStyle(
                        color: Color.fromARGB(255, 53, 52, 52), fontSize: 11),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 18,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  buildCashedImage(
                    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/363200963/original/4fcc05d81373e38ab5e13087700cef26433f4621/design-kindle-and-e-book-covers.jpg',
                    borderRadius: 7.0,
                    height: 230.0,
                    width: 140.0,
                    fit: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Book Of tjefwiefjwofj  ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'auther name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  RatingStars(
                    rating: 3,
                    maxRating: 5,
                    starColor: const Color.fromARGB(255, 255, 234, 0),
                    starSize: 10,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}



//  ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: CachedNetworkImage(
//           imageUrl: imageUrl,
//           width: width,
//           height: height,
//           imageBuilder: (context, imageProvider) => Image(
//             image: imageProvider,
//             fit: BoxFit.fill,
//           ),
//           //  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
//           //   child: CircularProgressIndicator(value: downloadProgress.progress),
//           // ),
//           placeholder: (context, url) => placeHolder(width, height),
//           errorWidget: (context, url, error) => const Icon(Icons.error),
//         ));
