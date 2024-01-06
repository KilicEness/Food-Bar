import 'package:flutter/material.dart';
import './screens/main_tab/main_tab_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const FoodBar());
}

class FoodBar extends StatelessWidget {
  const FoodBar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scan Your Food',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.green,
      ),
      // A widget which will be started on application startup
      initialRoute: '/',
      routes: {
        '/': (context) => MainTabScreen(),
        '/product_detail' : (context) => ProductDetails()
      },
    );
  }
}
