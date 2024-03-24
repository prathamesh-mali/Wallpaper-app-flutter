import 'package:flutter/material.dart';
import 'package:wallpaper_app/Models/photos_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_app/Screens/full_screens.dart';

Widget wallpaper(List<PhotoModel> listphotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      mainAxisSpacing: 7.0,
      childAspectRatio: 0.6,
      crossAxisSpacing: 9.0,
      children: listphotos.map((PhotoModel photosModel) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FullScreen(
                      imgpath: photosModel.src!.portrait!,
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: photosModel.src!.portrait!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: photosModel.src!.portrait!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
