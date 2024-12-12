import 'package:flutter/material.dart';
import 'package:word_events/screens/add_screen/add_widgets.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return addUI(context);
  }
}
