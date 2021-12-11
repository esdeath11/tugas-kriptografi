// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kriptografi/data/argument/encrypt_and_decrypt_argument.dart';
import 'package:kriptografi/data/chiper/viginere_chiper.dart';
import 'package:kriptografi/module/viginere_chiper/result_viginere.dart';

class DecryptScreen extends StatelessWidget {
  static const routename = "/viginere-chiper/decrypt";
  const DecryptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decrypt"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([_DecryptForm()]))
        ],
      ),
    );
  }
}

class _DecryptForm extends StatefulWidget {
  const _DecryptForm({Key? key}) : super(key: key);

  @override
  _DecryptFormState createState() => _DecryptFormState();
}

class _DecryptFormState extends State<_DecryptForm> {
  TextEditingController chiperText = TextEditingController();
  TextEditingController keyChiper = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? errorText;

  void onPressed() {
    String result;
    String text = chiperText.value.text;
    String key = keyChiper.value.text;
    setState(() {
      errorText = "";
    });
    if (text == "" && key == "") {
      setState(() {
        errorText = "PlainText or KeyChiper is null";
      });
    } else {
      errorText = null;
      VigenereChiper enc = VigenereChiper(key: key);
      result = enc.decrypt(text);
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
                label: Text("ChiperText"),
              ),
              controller: chiperText,
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
          ElevatedButton(onPressed: onPressed, child: Text("Decrypt Text"))
        ],
      ),
    );
  }
}
