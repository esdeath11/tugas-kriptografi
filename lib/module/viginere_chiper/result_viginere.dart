import 'package:flutter/material.dart';
import 'package:kriptografi/data/argument/encrypt_and_decrypt_argument.dart';

class ResultViginereChipper extends StatelessWidget {
  static const routename = "/viginere-chiper/result";
  final EncryptAndDecryptArgument argument;
  const ResultViginereChipper({Key? key, required this.argument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        // ignore: prefer_const_constructors
        child: Text(
          argument.result,
          style: const TextStyle(fontSize: 19),
        ),
      ),
    );
  }
}
