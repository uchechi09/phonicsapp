import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

class FormationPage extends StatefulWidget {
  const FormationPage({super.key, required this.color});
  final Color color;

  @override
  State<FormationPage> createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage> {
  late ScribbleNotifier scribbleNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scribbleNotifier = ScribbleNotifier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
       iconTheme: IconThemeData(size: 40),
      ),
      backgroundColor: widget.color,
      body: Scribble(notifier: scribbleNotifier),
    );
  }
}
