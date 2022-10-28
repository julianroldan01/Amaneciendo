import 'package:flutter/material.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/cerveza_importada.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/cerveza_nacional.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/energizantes.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/licores_importados.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/licores_nacionales.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/variados.dart';

// ignore: camel_case_types
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

// ignore: camel_case_types
class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            width: 100,
            height: 100,
            child: Image(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

          const Divider(height: 25.0),
          // ElevatedButton(
          //   onPressed: () {
          //     final route = MaterialPageRoute(
          //         builder: (context) => const cervezanacional());
          //     Navigator.push(context, route);
          //   },
          //   style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.transparent),
          //   child: const ListTile(
          //       title: Text('Cerveza Nacional',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontFamily: "Acme",
          //               fontSize: 25.0,
          //               fontWeight: FontWeight.w700),
          //           textAlign: TextAlign.left),
          //       trailing: Icon(Icons.arrow_forward_ios_outlined,
          //           color: Colors.white, size: 60)),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const cervezanacional());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Cerveza Nacional",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const cervezaimportada());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Cerveza Importada",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const licoresnacionales());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Licores Nacionales",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const licoresimportados());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Licores Importados",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const energizantes());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Energizantes",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (context) => const variados());
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Variados",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(padding: EdgeInsets.all(6)),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.white, size: 60)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Divider(thickness: 1.0, color: Colors.white),
          ),
        ],
      ),
    ]);
  }
}
