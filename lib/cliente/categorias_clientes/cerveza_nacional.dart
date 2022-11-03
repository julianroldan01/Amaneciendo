// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/Products.dart';

// ignore: camel_case_types
class cervezanacional extends StatefulWidget {
  const cervezanacional({super.key});

  @override
  State<cervezanacional> createState() => _cervezanacionalState();
}

// ignore: camel_case_types
class _cervezanacionalState extends State<cervezanacional> {

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
              Products(type: 1),
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
