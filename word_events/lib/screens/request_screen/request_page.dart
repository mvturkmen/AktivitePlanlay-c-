import 'package:flutter/material.dart';
import 'package:word_events/screens/request_screen/request_widgets.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRequest(context),
      body: bodyRequest(),
    );
  }
}
