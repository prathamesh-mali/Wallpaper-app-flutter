import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Models/photos_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Widgets/search_result_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PhotoModel> photos = [];
  TextEditingController searchController = TextEditingController();
  bool search = false;

  getsearchPhoto(String searchQuery) async {
    await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$searchQuery&per_page=30'),
      headers: {
        'Authorization':
            "wcExVWl6OJNY2NLqh5SYGkQeYaX3zyvBT06olU69utmpzv2lHaQigP1F",
      },
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData['photos'].forEach((element) {
        PhotoModel photosModel = PhotoModel();
        photosModel = PhotoModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        search = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFB4B4B4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: searchController,
              onSubmitted: (String value) {
                getsearchPhoto(value);
              },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Colors.grey,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      getsearchPhoto(searchController.text);
                    },
                    child: search
                        ? GestureDetector(
                            onTap: () {
                              photos = [];
                              search = false;
                              searchController.clear();
                              setState(() {});
                            },
                            child: const Icon(Icons.close))
                        : const Icon(
                            Icons.search,
                            size: 30,
                          ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: wallpaper(photos, context),
          ),
        ],
      ),
    );
  }
}
