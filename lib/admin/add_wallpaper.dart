import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:wallpaper_app/service/database.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  List<String> categoriesitems = [
    'Nature',
    'Cars',
    'Wildlife',
    'Patterns',
    'Foods',
  ];

  String? value;

  final ImagePicker _picker = ImagePicker();
  File? selectedFile;

  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedFile = File(image.path);
      setState(() {});
    } else {
      const SnackBar(
        content: Text("No Image selected"),
      );
    }
  }

  uploadImage() async {
    if (selectedFile != null) {
      String addId = randomAlphaNumeric(10);
      Reference FirebaseStorageRef =
          FirebaseStorage.instance.ref().child("Images").child(addId);
      final UploadTask task = FirebaseStorageRef.putFile(selectedFile!);

      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addItem = {"Image": downloadUrl, "Id": addId};
      await DatabaseMethods().addWallaper(addItem, addId, value!).then(
            (value) => Fluttertoast.showToast(
                msg: "Wallpaper is uploaded Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Platform.isAndroid
            ? const Icon(Icons.arrow_back_outlined)
            : const Icon(Icons.arrow_back_ios_new),
        title: const Text("Add Wallpapers"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          selectedFile == null
              ? GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Center(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 300,
                        height: 350,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: selectedFile != null
                      ? Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 300,
                            height: 350,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                selectedFile!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : const SnackBar(
                          content: Text("No Image Selected "),
                        ),
                ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: DropdownButton<String>(
                  items: categoriesitems
                      .map(
                        (items) => DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                  value: value,
                  hint: const Text("Select category"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 60, right: 60),
              margin: const EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
