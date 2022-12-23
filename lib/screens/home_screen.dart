import 'package:flutter/material.dart';
import 'package:flutter_notification/screens/second_screen.dart';

import '../database/new_notification.dart';
import 'first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationsAPI.init();
    listenNotification();
  }

  listenNotification() {
    NotificationsAPI.onNotification.stream.listen((event) {
      print('Evenet ' + event!);
      if (event == 'first') {
        print('es ky andar be wara ha ');
        Navigator.push(
          context,
          // ignore: always_specify_types
          MaterialPageRoute(
            builder: (BuildContext context) => const FirstScreen(),
          ),
        );
        //Navigator.pushNamed(context, '/second');
      } else if (event == 'second') {
        Navigator.push(
          context,
          // ignore: always_specify_types
          MaterialPageRoute(
            builder: (BuildContext context) => const SecondScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                NotificationsAPI.showNotification(
                    body: 'body', id: 1, payload: 'first', title: 'title');
              },
              child: const Text('first screen')),
          ElevatedButton(
              onPressed: () {
                NotificationsAPI.showNotification(
                    body: 'body', id: 1, payload: 'second', title: 'title');
              },
              child: const Text('second screen')),
        ],
      )),
    );
  }
}
