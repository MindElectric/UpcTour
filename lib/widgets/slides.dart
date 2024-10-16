import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Slides extends StatelessWidget {
  const Slides({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const ImageSlideshow(
            isLoop: true,
            autoPlayInterval: 5000,
            height: 300,
            children: [
              Image(
                image: AssetImage("assets/upc1.jpg"),
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage("assets/upc2.jpg"),
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage("assets/upc3.jpg"),
                fit: BoxFit.cover,
              ),
            ]),
      ),
    );
  }
}
