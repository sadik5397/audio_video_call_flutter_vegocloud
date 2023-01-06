import 'package:flutter/material.dart';

import 'call_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.red), home: Home(), debugShowCheckedModeBanner: false);
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final callIdController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 12),
            child: TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: callIdController,
                decoration: const InputDecoration(labelText: "Join a call by id", alignLabelWithHint: true, floatingLabelAlignment: FloatingLabelAlignment.center))),
        ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(callID: callIdController.text))), child: const Text('JOIN'))
      ]));
}
