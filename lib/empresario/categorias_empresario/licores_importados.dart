// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Addproducts.dart';
import 'package:image_picker/image_picker.dart';
import '../../empresario/categorias_empresario/cerveza_nacional.dart';
import '../../empresario/categorias_empresario/energizantes.dart';
import '../../empresario/categorias_empresario/licores_nacionales.dart';
import '../../empresario/categorias_empresario/cerveza_importada.dart';
import '../../empresario/categorias_empresario/variados.dart';
import '../../components/Products.dart';

// ignore: camel_case_types
class licoresimportados extends StatefulWidget {
  const licoresimportados({super.key});

  @override
  State<licoresimportados> createState() => licoresimportadosState();
}

// ignore: camel_case_types
class licoresimportadosState extends State<licoresimportados> {
  final GlobalKey<ScaffoldState> _scaffoldkEy = GlobalKey<ScaffoldState>();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage("images/fondo.png")),
      ),
      child: Scaffold(
        key: _scaffoldkEy,
        drawer: Drawer(
          width: 420.0,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/fondo.png'), fit: BoxFit.fill),
            ),
            child: ListView(
             shrinkWrap: true,
            children:<Widget>[Column(
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
                Title(
                    color: Colors.white,
                    child: const Text(
                      'CATEGORIAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Acme",
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800),
                    )),
                const Divider(height: 25.0),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const cervezanacional());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Cerveza Nacional',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const cervezaimportada());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Cerveza Importada',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const licoresnacionales());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Licores Nacionales',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const licoresimportados());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Licores Importados',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const energizantes());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Energizantes',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                        builder: (context) => const variados());
                    Navigator.push(context, route);
                  },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: const ListTile(
                      title: Text('Variados',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white, size: 60)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: const Divider(thickness: 1.0, color: Colors.white),
                ),
              ],
            ),
          ]),
        ),),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      color: Colors.white,
                      iconSize: 48,
                    ),
                  ),
                  Container(
                    child: const Text(
                      "Licores Importados",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Acme",
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: const Icon(Icons.apps_rounded),
                      onPressed: () => _scaffoldkEy.currentState?.openDrawer(),
                      color: Colors.white,
                      iconSize: 60,
                    ),
                  ),
                ]
              ),
              const Products(type: 4),
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
          return AddProduct(type: 4);
        }
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
