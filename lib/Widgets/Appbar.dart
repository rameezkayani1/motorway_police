import 'package:flutter/material.dart';

class TopAppbar extends StatefulWidget {
  const TopAppbar({super.key});

  @override
  State<TopAppbar> createState() => _TopAppbarState();
}

class _TopAppbarState extends State<TopAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset("assets/quran.png",
            fit: BoxFit.cover, height: 20.00, width: 20.00),
      ),
      title: const Text(
        "Salaah",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Get.to(SearchPage());
            },
          ),
        ),
      ],
    ));
  }
}
