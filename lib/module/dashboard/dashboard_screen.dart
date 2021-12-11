// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kriptografi/module/viginere_chiper/decrypt/decrypt_screen.dart';
import 'package:kriptografi/module/viginere_chiper/encrypt/encrypt_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kriptografi"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([_DashboardMenu()]))
        ],
      ),
    );
  }
}

class _DashboardMenu extends StatefulWidget {
  const _DashboardMenu({Key? key}) : super(key: key);

  @override
  __DashboardMenuState createState() => __DashboardMenuState();
}

class __DashboardMenuState extends State<_DashboardMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EncryptScreen.routename);
              },
              child: Text("Encrypt"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DecryptScreen.routename);
              },
              child: Text("Decrypt"),
            ),
          )
        ],
      ),
    );
  }
}
