import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addWallaper(
      Map<String, dynamic> wallpaperInfoMap, String id, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set(wallpaperInfoMap);
  }

  Future<Stream<QuerySnapshot>> getCategory(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
