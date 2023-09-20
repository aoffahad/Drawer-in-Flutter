import 'package:flutter/material.dart';

class Contactspage extends StatefulWidget {
  const Contactspage({super.key});

  @override
  State<Contactspage> createState() => _ContactspageState();
}

class _ContactspageState extends State<Contactspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan, 
      child: Center(
        child: Text("Contacts Page"),
      ),
    );
  }
}