// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Addproducts.dart';
import 'package:image_picker/image_picker.dart';
import '../../empresario/categorias_empresario/cerveza_nacional.dart';
import '../../empresario/categorias_empresario/energizantes.dart';
import '../../empresario/categorias_empresario/licores_importados.dart';
import '../../empresario/categorias_empresario/licores_nacionales.dart';
import '../../empresario/categorias_empresario/variados.dart';
import '../../components/Products.dart';

// ignore: camel_case_types
class cervezaimportada extends StatefulWidget {
  const cervezaimportada({super.key});

  @override
  State<cervezaimportada> createState() => cervezaimportadaState();
}

// ignore: camel_case_types
class cervezaimportadaState extends State<cervezaimportada> {
  final GlobalKey<ScaffoldState> _scaffoldkEy = GlobalKey<ScaffoldState>();
  final Products productsChild = Products(type: 2);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage("images/fondo.png")),
      ),
      child: Scaffold(
        key: _scaffoldkEy,
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
                ]
              ),
              ListView( shrinkWrap: true, children:<Widget>[
              productsChild]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: showForm,
            child: const Icon(Icons.add, color: Colors.orange)),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AddProduct(type: 2, parentFunction: productsChild.callGetCarta);
        }
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
