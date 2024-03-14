import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    super.key,
    required this.urlImage,
    required this.index,
  });

  final String urlImage;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
