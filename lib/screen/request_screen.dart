import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestScreen extends StatefulWidget {
  static const routeName = '/request';
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  Future<String> httpRequest(String code) async {
    print(code);
    Map<String, String> headers = {
      "content-type": "application/json",
      'name': 'pandey',
      'token': 'dipanshu'
    };
    Map<String, dynamic> body = {
      "source_code": code,
      "language_id": 50,
      "number_of_runs": null,
      "stdin": "Judge0",
      "expected_output": null,
      "cpu_time_limit": null,
      "cpu_extra_time": null,
      "wall_time_limit": null,
      "memory_limit": null,
      "stack_limit": null,
      "max_processes_and_or_threads": null,
      "enable_per_process_and_thread_time_limit": null,
      "enable_per_process_and_thread_memory_limit": null,
      "max_file_size": null
    };

    String urL = 'http://164.92.255.194:2358/submissions/';

    var url = Uri.parse(urL);
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 201) {
      var rbody = jsonDecode(response.body) as Map<String, dynamic>;
      String? token = rbody['token'];
      print(token);
      // return token;
      String new_urL = urL +
          token! +
          '?base64_encoded=false&fields=stdout,stderr,status_id,language_id';
      var new_url = Uri.parse(new_urL);
      // while (true) {
      var getResponse = await http.get(
        new_url,
        headers: <String, String>{
          "content-type": "application/json",
        },
      );
      await Future.delayed(Duration(seconds: 5));
      var compileCode = jsonDecode(getResponse.body) as Map<String, dynamic>;
      print(compileCode);
      if (compileCode['status_id'] == 11) {
        return compileCode['stdout'];
      } else {
        return getResponse.body;
      }
      // }
    } else {
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String code = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Editor',
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Stdin'),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                print('waiting');
                return CircularProgressIndicator();

              case ConnectionState.none:
                print('none');
                return Container();

              case ConnectionState.active:
                print('active');
                return Container();
              case ConnectionState.done:
                return Text(snapshot.data as String);
            }
          },
          future: httpRequest(code),
        ),
      ),
    );
  }
}
// #include<stdio.h>
// void main(){printf("hello");}