import 'package:flutter/material.dart';
import 'package:food_bar/screens/scan_barcode_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.fastfood),
                Text(
                  '  FOODBAR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 250,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade900,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              child: Stack(
                children: const [
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(Icons.food_bank_outlined,
                          color: Colors.white, size: 50)),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.free_breakfast_outlined,
                        color: Colors.white,
                        size: 60,
                      )),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Text(
                      "IF YOU WANT TO KNOW WHAT YOU EAT, \nYOU'RE IN THE RIGHT PLACE!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.thumb_up_off_alt_outlined,
                      color: Colors.black),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Easy To Use',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Effortless marketing\nwith our intuitive and\neasy-to-use app.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      Icon(Icons.person_add_alt_1_rounded, color: Colors.black),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'User Friendly',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Our app is designed to\nbe easily navigable for\nusers.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.verified_user_rounded, color: Colors.black),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Metinleri sola hizala
                  children: const [
                    Text(
                      'Trusted Contents',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'We use reliable data from a\nworldwide open database.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                  color: Colors.green.shade900,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.photo_camera_outlined,
                      color: Colors.white, size: 50),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScanBarcode()));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
