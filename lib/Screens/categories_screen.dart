import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/wildlife.jpg'),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 225,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Wildlife",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/car.jpg'),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 244,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Cars",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/nature.jpg'),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 216,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Nature",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/pattern.jpg'),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 212,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Patterns",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
