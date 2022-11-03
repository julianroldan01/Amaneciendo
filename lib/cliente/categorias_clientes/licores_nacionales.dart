// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../cliente/categorias_clientes/cerveza_importada.dart';
import '../../cliente/categorias_clientes/energizantes.dart';
import '../../cliente/categorias_clientes/licores_importados.dart';
import '../../cliente/categorias_clientes/cerveza_nacional.dart';
import '../../cliente/categorias_clientes/variados.dart';
import '../../components/Products.dart';

// ignore: camel_case_types
class licoresnacionales extends StatefulWidget {
  const licoresnacionales({super.key});

  @override
  State<licoresnacionales> createState() => licoresnacionalesState();
}

// ignore: camel_case_types
class licoresnacionalesState extends State<licoresnacionales> {
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
              Products(type: 3),
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
