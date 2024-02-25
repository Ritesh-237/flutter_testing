import 'dart:isolate';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Isolate _isolate;
  late ReceivePort _receivePort;
  late SendPort _sendPort;

  @override
  void initState() {
    super.initState();
    _initIsolate();
  }

  void _initIsolate() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(isolateEntryPoint, _receivePort.sendPort);
    _sendPort = await _receivePort.first;
  }

  void isolateFunction(SendPort sendPort) {
    // Perform computationally expensive task here
    String result = 'Result of the task';

    sendPort.send(result);
  }

  static void isolateEntryPoint(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      // Handle received message from the main isolate
      if (message is Data) {
        print(
            'Received Data object in isolate: ${message.name}, ${message.age}');
      }
    });
  }

  void sendMessageToIsolate(Data data) {
    _sendPort.send(data);
  }

  @override
  void dispose() {
    super.dispose();
    _receivePort.close();
    _isolate.kill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Data data = Data('John', 30);
            sendMessageToIsolate(data);
          },
          child: const Text('Send Object to Isolate'),
        ),
      ),
    );
  }
}

class Data {
  final String name;
  final int age;

  Data(this.name, this.age);
}
