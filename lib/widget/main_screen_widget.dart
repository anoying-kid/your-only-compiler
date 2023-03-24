import 'package:flutter/material.dart';
import '../screen/request_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';
  MainScreen({super.key});

  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: SizedBox(
          child: Stack(children: [
            SingleChildScrollView(
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.blue)),
                    hintText: 'Enter your code here',
                    hintStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(fontSize: 20, color: Colors.white),
                maxLines: 100,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                decoration: const BoxDecoration(color: Colors.pink),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RequestScreen.routeName,
                        arguments: codeController.text);
                  },
                  child: const Text('Post'),
                ),
              ),
            ),
          ]),
        ),
    );
  }
}
