import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodePage2 extends StatefulWidget {
  const QRCodePage2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QRCodePage2State createState() => _QRCodePage2State();
}

class _QRCodePage2State extends State<QRCodePage2> {
  String _scanBarcode = 'Unknown';
  int imageNumber = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => (barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(
      () {
        _scanBarcode = barcodeScanRes;
        if (_scanBarcode == '7891150059856') {
          imageNumber = 2;

          //_scanBarcode = ('Rexona');
          //void chang() {
          //  switch (_scanBarcode) {
          //    case '78925472':
          //     imageNumber == 1;
          //    break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => scanQR(),
                    child: const Text('Start QR scan')),
                Text('Scan result : $_scanBarcode\n',
                    style: const TextStyle(fontSize: 20)),
                Image.asset('images/dice$imageNumber.jpg'),
              ],
            ),
          );
        },
      ),
    );
  }
}
