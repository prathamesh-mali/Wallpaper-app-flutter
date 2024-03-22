import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/admin/add_wallpaper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededed),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 45,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 25, 53, 51), Colors.black87],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 110),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const Text(
                          "Let's start with\nAdmin",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 65,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 5, top: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 147),
                                    ),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: userNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Username';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade400)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 5, top: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 160, 160, 147),
                                    ),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: userpasswordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Password';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade400)),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    loginAdmin();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 60,
                                        right: 60),
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then(
      (snapshot) {
        snapshot.docs.forEach(
          (result) {
            if (result.data()['id'] != userNameController.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your id is not Correct! "),
                ),
              );
            }
            if (result.data()['password'] !=
                userpasswordController.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your password is not Correct! "),
                ),
              );
            } else {
              Route route =
                  MaterialPageRoute(builder: (context) => const AddWallpaper());
              Navigator.push(context, route);
            }
          },
        );
      },
    );
  }
}
