import 'package:flutter/material.dart';

class ArzeshAfzoode extends StatelessWidget {
  const ArzeshAfzoode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("ارزش اقزوده",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
