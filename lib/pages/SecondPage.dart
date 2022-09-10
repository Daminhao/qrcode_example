import 'package:flutter/material.dart';
import 'qrcode_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    List<String> tickets = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: ListView(children: [
        Text('Entry ${entries[0]}'),
        Text('Entry ${entries[1]}'),
        Text('Entry ${entries[2]}'),
        Text('Ticket: ${(tickets[0])}', style: const TextStyle(fontSize: 20)),
        Text('Ticket: ${(tickets[1])}', style: const TextStyle(fontSize: 20)),
        Text('Ticket: ${(tickets[2])}', style: const TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ]),
    );
  }
}
