import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/service/database.dart';

class AllWallpapers extends StatefulWidget {
  String category;
  AllWallpapers({required this.category});

  @override
  State<AllWallpapers> createState() => _AllWallpapersState();
}

class _AllWallpapersState extends State<AllWallpapers> {
  Stream? categoryStream;
  Widget allWallpapers() {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 7.0,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 9.0,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(ds["Image"]),
                      ),
                    );
                  },
                )
              : Container();
        });
  }

  getWallpaperonload() async {
    categoryStream = await DatabaseMethods().getCategory(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getWallpaperonload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          allWallpapers(),
        ],
      ),
    );
  }
}
