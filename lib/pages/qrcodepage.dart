import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  List<String> barNumbers = [''];
  List<String> names = ['13103522', '7894488000101'];

  readQRCode() async {
    Stream<dynamic>? reader = FlutterBarcodeScanner.getBarcodeStreamReceiver(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    if (reader != null) {
      reader.listen((code) {
        setState(() {
          if (!barNumbers.contains(code.toString()) &&
              code != '-1' &&
              names.toList().contains(code)) {
            barNumbers.add(code.toString());
            print('LIST:$barNumbers');
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //if (ticket != '')
            Text(
              'Ticket: ${(barNumbers)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 90),
            ElevatedButton.icon(
              onPressed: readQRCode,
              icon: const Icon(Icons.qr_code),
              label: const Text('Scanear C.E'),
            ),
            const SizedBox(height: 90),
            ElevatedButton(
              child: const Text(
                'Lista de chamadas',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _sendDataToSecondScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    List<String> listNames = barNumbers.map((element) => element).toList();
    for (var i = 0; i < listNames.length; i++) {
      if (listNames[i] == '13103522') listNames[i] = 'Danilo';
      if (listNames[i] == '45323480') listNames[i] = 'Elizabethy';
      if (listNames[i] == '89876880') listNames[i] = 'Nelton';
      if (listNames[i] == '21765780') listNames[i] = 'Geison';
      if (listNames[i] == '34534750') listNames[i] = 'Rayla';
    }
    print('LIST:$listNames');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            text: listNames,
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final List<String> text;

  // receive data from the FirstScreen as a parameter
  const SecondScreen({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(90),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 30,
            child: Center(child: Text('Nome: ${text[index]}')),
          );
        },
        itemCount: text.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
