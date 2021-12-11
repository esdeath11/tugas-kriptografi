// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:kriptografi/data/argument/encrypt_and_decrypt_argument.dart';
import 'package:kriptografi/data/chiper/viginere_chiper.dart';
import 'package:kriptografi/module/viginere_chiper/result_viginere.dart';

class EncryptScreen extends StatelessWidget {
  static const routename = "/encrypt";
  const EncryptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encrypt"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([_EncryptForm()]))
        ],
      ),
    );
  }
}

class _EncryptForm extends StatefulWidget {
  _EncryptForm({Key? key}) : super(key: key);

  @override
  __EncryptFormState createState() => __EncryptFormState();
}

class __EncryptFormState extends State<_EncryptForm> {
  TextEditingController plainText = TextEditingController();
  TextEditingController keyChiper = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? errorText;

  void onPressed() {
    String result;
    String text = plainText.value.text;
    String key = keyChiper.value.text;
    setState(() {
      errorText = "";
    });
    if (text == "" && key == "") {
      setState(() {
        errorText = "PlainText or KeyChiper is null";
      });
    } else {
      VigenereChiper enc = VigenereChiper(key: key);
      result = enc.encrypt(text);
      Navigator.pushNamed(context, ResultViginereChipper.routename,
          arguments: EncryptAndDecryptArgument(result: result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                errorText: errorText,
                label: Text("PlainText"),
              ),
              controller: plainText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                errorText: errorText,
                label: Text("Key"),
              ),
              controller: keyChiper,
            ),
          ),
          ElevatedButton(onPressed: onPressed, child: Text("Encrypt Text"))
        ],
      ),
    );
  }
}
