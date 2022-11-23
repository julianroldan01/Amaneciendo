// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Products_cliente.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/Products.dart';

// ignore: camel_case_types
class cervezaimportada extends StatefulWidget {
  const cervezaimportada({super.key});

  @override
  State<cervezaimportada> createState() => cervezaimportadaState();
}

// ignore: camel_case_types
class cervezaimportadaState extends State<cervezaimportada> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("images/fondo.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      color: Colors.white,
                      iconSize: 48,
                    ),
                  ]),
              listCliente(type: 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
