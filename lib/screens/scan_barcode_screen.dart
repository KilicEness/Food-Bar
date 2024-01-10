import 'package:flutter/material.dart';
import 'package:food_bar/screens/main_tab/tabs/products_screen.dart';
import 'package:food_bar/widgets/input_barcode_scan.dart';

class ScanBarcode extends StatelessWidget {
  const ScanBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please enter your product barcode or scan with camera your device',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                InputBarcodeScan(
                  onSearch: (value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(barcode: value,)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
