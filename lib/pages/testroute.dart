import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'SecondPage.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  List<String> tickets = [];
  List<String> names = ['13103522', 'maça', 'uva'];
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
          if (!tickets.contains(code.toString()) &&
              code != '-1' &&
              code.contains(names)) {
            tickets.add(code.toString());

            print('LISTA:$tickets');
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
              'Ticket: ${(tickets)}',
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

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    for (var i = 0; i < tickets.length; i++) {
      if (tickets[i] == '13103522') tickets[i] = 'Danilo';
    }
    print('LISTAA:$tickets');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            text: tickets,
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
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(text.toString()),
            ),
          );
        },
      ),
    );
  }*/
}
