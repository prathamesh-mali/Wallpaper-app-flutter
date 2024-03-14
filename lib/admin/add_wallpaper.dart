import 'package:flutter/material.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: const Text(
              "Add Wallpapers",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
