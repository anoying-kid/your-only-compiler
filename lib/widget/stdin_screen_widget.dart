import 'package:flutter/material.dart';

class StdinScreen extends StatelessWidget {
  const StdinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey))),
      ),
    );
  }
}
