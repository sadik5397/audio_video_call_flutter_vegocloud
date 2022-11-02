import 'package:flutter/material.dart';

import 'call_page.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final callIdController = TextEditingController(text: "call_id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIdController,
                  decoration: const InputDecoration(
                    labelText: "join a call by id",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIdController.text);
                    }),
                  );
                },
                child: const Text('join'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
