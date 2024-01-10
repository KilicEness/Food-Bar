import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:food_bar/helpers/screen_size.dart';

import 'card_container.dart';

// ignore: must_be_immutable
class InputBarcodeScan extends StatefulWidget {
  String? initialValue;
  bool? enabled;
  Function onSearch;
  bool? onSumbitClear;
  bool? readedShow;
  bool autoFocus;
  String? placeHolder;
  bool isTransferSearch;
  InputBarcodeScan(
      {Key? key,
      required this.onSearch,
      this.initialValue,
      this.enabled,
      this.onSumbitClear = true,
      this.readedShow = true,
      this.autoFocus = false,
      this.isTransferSearch = false,
      this.placeHolder = "Enter product barcode"})
      : super(key: key);

  @override
  State<InputBarcodeScan> createState() => _InputBarcodeScanState();
}

class _InputBarcodeScanState extends State<InputBarcodeScan> {
  final _barcodeFocus = FocusNode();
  final _inputController = TextEditingController();
  String readedBarcode = "";

  @override
  void initState() {
    super.initState();
    RawKeyboard.instance.addListener(_handleKeyDown);
  }

  void _handleKeyDown(RawKeyEvent value) {
    final k = value.logicalKey;
    if (k == LogicalKeyboardKey.f7 || k == LogicalKeyboardKey.equal) {
      //F7 barcode focus add
      FocusScope.of(context).requestFocus(_barcodeFocus);
    }
  }

  void _onSearch(String value) {
    if (value != "") {
      setState(() {
        readedBarcode = value;
      });

      widget.onSearch(value);

      if (widget.onSumbitClear == true) {
        setState(() {
          _inputController.text = "";
        });
      }

      _barcodeFocus.unfocus();
    }
  }

  Future<void> _onScanWebCam() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'KAPAT', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      readedBarcode = barcodeScanRes;
    });
    _onSearch(barcodeScanRes);
  }

  @override
  void dispose() {
    _inputController.dispose();
    _barcodeFocus.dispose();
    RawKeyboard.instance.removeListener(_handleKeyDown);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize _screenSize = ScreenSize(context);
    return CardContainer(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 7,
                  child: SizedBox(
                    //height: 45,
                    child: TextFormField(
                      onChanged: (String v) {
                        setState(() {
                          final cursorPosition = _inputController.selection;
                          _inputController.text = v;
                          _inputController.selection = cursorPosition;
                        });

                        if (v.length == 13 && !widget.isTransferSearch) {
                          _onSearch(v);
                        }
                      },
                      inputFormatters: <TextInputFormatter>[
                        // FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                        FilteringTextInputFormatter.deny("=")
                      ],
                      //readOnly: true,
                      showCursor: true,
                      // keyboardType: TextInputType.number,
                      focusNode: _barcodeFocus,
                      controller: _inputController,
                      onFieldSubmitted: _onSearch,
                      enabled: widget.enabled,
                      initialValue: widget.initialValue,
                      cursorColor: Colors.black,
                      cursorHeight: 18,
                      style: const TextStyle(fontSize: 15),
                      autofocus: widget.autoFocus,
                      decoration: InputDecoration(
                        hintText: (widget.readedShow! && readedBarcode != "")
                            ? readedBarcode
                            : widget.placeHolder,
                        //fillColor: const Color.fromRGBO(231, 54, 115, 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  )),
              if (_screenSize.isDesktop)
                ((Expanded(
                    flex: _screenSize.isDesktop ? 1 : 2,
                    child: CardContainer(
                        borderRadius: 4,
                        margin: const EdgeInsets.only(left: 10),
                        height: 50,
                        color: Colors.red,
                        child: TextButton.icon(
                            label: const Text(
                              'Bul',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _onSearch(_inputController.text);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )))))),
              if (!_screenSize.isDesktop)
                ((Expanded(
                    flex: _screenSize.isDesktop ? 1 : 2,
                    child: CardContainer(
                        borderRadius: 4,
                        margin: const EdgeInsets.only(left: 10),
                        height: 50,
                        color: Colors.yellow.shade700,
                        child: IconButton(
                            onPressed: () {
                              _onSearch(_inputController.text);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )))))),
              if (!kIsWeb)
                ((Expanded(
                    flex: _screenSize.isDesktop ? 1 : 2,
                    child: CardContainer(
                        borderRadius: 4,
                        margin: const EdgeInsets.only(left: 10),
                        height: 50,
                        color: Colors.green.shade900,
                        child: IconButton(
                            onPressed: () => _onScanWebCam(),
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ))))))
            ],
          ),
        ],
      ),
    );
  }
}
