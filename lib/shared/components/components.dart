import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_app/shared/styles/styles.dart';
import 'package:shimmer/shimmer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function function;
  final double height;
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(19),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  ReusableButton({
    super.key,
    required this.onPressed,
    required this.width,
    this.child,
    this.color = secondaryColor,
    required this.borderRadius,
  });
  final void Function()? onPressed;
  final double? width;
  final Widget? child;
  final BorderRadiusGeometry borderRadius;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        height: 50.0,
        textColor: kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        minWidth: width!,
        splashColor: kBackgroundColor,
        child: child,
      ),
    );
  }
}

class AdditionIcon extends StatelessWidget {
  const AdditionIcon(
      {super.key,
      required this.iconColor,
      required this.fillColor,
      required this.isAdd,
      required this.boarderColor});
  final Color iconColor;
  final Color fillColor;
  final Color boarderColor;
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: boarderColor,
          ),
          color: fillColor),
      child: Icon(
        isAdd ? Icons.add : Icons.remove,
        color: iconColor,
        size: 33,
      ),
    );
  }
}

Widget InputTextFormFild({
  required TextEditingController textEditingController,
  required String hintText,
  required TextInputType textInputType,
  required Function validit,
}) =>
    TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
      validator: (value) {
        return validit(value);
      },
      keyboardType: textInputType,
    );

class CustomAppBar extends StatelessWidget {
  final Function back;
  final Function info;
  final String screenName;
  final bool isDark;
  const CustomAppBar(
      {super.key,
      required this.back,
      required this.info,
      required this.screenName,
      this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 10, start: padding - 13, end: padding - 13),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                back();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          Text(
            screenName,
            style: const TextStyle(
              // color: isDark ? textAndIconDarkColor : Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                info();
              },
              icon: const Icon(
                Icons.info_outlined,
                //  color: isDark ? textAndIconDarkColor : Colors.white,
              )),
        ],
      ),
    );
  }
}

Widget commonTextFormFelid({
  required TextEditingController textEditingController,
  required String labelText,
  required Icon prefixIcon,
  required TextInputType textInputType,
  required Function validate,
  bool isClickAble = true,
  bool isPassword = false,
  String? hintText,
  var suffixIcon,
  Function? onPressedSuffix,
  Function? onFieldSubmitted,
  Function? onChanged,
  Function? onTap,
  double? height,
  int? maxLines,
}) =>
    SizedBox(
      height: height,
      child: TextFormField(
        controller: textEditingController, //3 expands: true,
        decoration: InputDecoration(
          fillColor: Colors.teal,
          focusColor: Colors.green,
          hintStyle: const TextStyle(fontSize: 12),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(top: 12),
          hintText: hintText,
          label: Text(labelText),
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  icon: suffixIcon,
                  onPressed: () {
                    onPressedSuffix!();
                  },
                ),
        ),

        obscureText: isPassword,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return validate(value);
        },
        onFieldSubmitted: ((value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted(value);
          }
        }),
        onChanged: ((value) {
          if (onChanged != null) {
            onChanged(value);
          }
        }),
        onTap: (() {
          if (onTap != null) {
            onTap();
          }
        }),
        keyboardType: textInputType,
      ),
    );

void toast({required String message, required Color color}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget emailProvider(cubit) => commonTextFormFelid(
      textEditingController: cubit.emailController,
      labelText: 'Email',
      prefixIcon: const Icon(Icons.email),
      textInputType: TextInputType.emailAddress,
      hintText: 'username@gmail.com',
      validate: (String value) {
        if (value.isEmpty) {
          return 'The email address must not be empty';
        }
        if (value.length <= 10) {
          return 'The email address is unacceptable';
        }
        if (value.substring(value.length - 10) != '@gmail.com') {
          print(value.substring(value.length - 10));
          return 'The email address is unacceptable';
        }
        return null;
      },
    );

Widget passwordProvider(cubit) => commonTextFormFelid(
      textEditingController: cubit.passwordController,
      labelText: 'Password',
      isPassword: cubit.isPassword,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon:
          Icon(cubit.isPassword ? Icons.visibility_off : Icons.visibility),
      onPressedSuffix: () {
        cubit.changeVisibility();
      },
      textInputType: TextInputType.visiblePassword,
      validate: (value) {
        if (value.isEmpty) {
          return 'The email address must not be empty';
        }
        return null;
      },
    );

navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context, widget, (route) => false);
}

void navigateTo(context, widget) => (Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    ));

Widget buildCashedImage(
  imageUrl, {
  width = double.infinity,
  height = 250.0,
  fit = false,
  borderRadius = 0.0,
  bool shadow = true,
}) =>
    CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ? BoxFit.fill : null,
            ),
            boxShadow: [
              (shadow == true)
                  ? const BoxShadow(
                      color: Color.fromARGB(129, 0, 0, 0),
                      blurRadius: 7,
                      offset: Offset(0, 8))
                  : BoxShadow(color: const Color.fromARGB(0, 255, 255, 255))
            ]),
      ),
      //  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //   child: CircularProgressIndicator(value: downloadProgress.progress),
      // ),
      placeholder: (context, url) => placeHolder(width, height),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

Widget placeHolder(width, hight) => SizedBox(
      width: width,
      height: hight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: hight,
        ),
      ),
    );

class RatingStars extends StatelessWidget {
  final int rating; // the rating value (e.g. 3, 4, 5)
  final int maxRating; // the maximum rating value (e.g. 5)
  final Color starColor; // the color of the filled stars
  final double starSize; // the size of the stars

  RatingStars({
    required this.rating,
    this.maxRating = 5,
    this.starColor = Colors.yellow,
    this.starSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= maxRating; i++)
          Icon(
            i <= rating ? Icons.star : Icons.star_border,
            color: i <= rating ? starColor : Colors.grey,
            size: starSize,
          ),
      ],
    );
  }
}

class SmallIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const SmallIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        // boxShadow: shadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: const Color.fromARGB(206, 228, 244, 251),
            size: 16,
          ),
          Text(
            ' $text  ',
            style: const TextStyle(
              color: Color.fromARGB(205, 246, 254, 255),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
