// ignore_for_file: deprecated_member_use
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/cerveza_nacional.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/cerveza_importada.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/licores_nacionales.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/licores_importados.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/energizantes.dart';
import 'package:flutter_application_1/cliente/categorias_clientes/variados.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user.dart';

import '../Apidio.dart';
import '../models/carta.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkEy = GlobalKey<ScaffoldState>();
  // const descriptionPlace({super.key});
  String pathImage = "images/drunkemoji.png";
  String nameplace;
  int stars;
  String telefono;
  String descripcion;
  String horario;
  String hora;
  String direccion;
  String barrio;
  DescriptionPlace(this.pathImage, this.nameplace, this.stars, this.telefono,
      this.descripcion, this.hora, this.horario, this.direccion, this.barrio,
      {Key? key})
      : super(key: key);
  final Dio dio = Apidio.dioAuth();
  late Future<List<Carta>> cartita;
  @override
  Widget build(BuildContext context) {
    final starBorder =
        Row(mainAxisAlignment: MainAxisAlignment.end, children: const <Widget>[
      Icon(Icons.star_border, color: Colors.amber),
    ]);
    final star =
        Row(mainAxisAlignment: MainAxisAlignment.end, children: const <Widget>[
      Icon(Icons.star, color: Colors.amber),
    ]);
    final iconBar = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage),
            ),
          ),
        ),
      ],
    );

    final titleStars = Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // direction: Axis.horizontal,
        children: <Widget>[
          iconBar,
          Center(
            child: Text(nameplace,
                style: const TextStyle(
                    fontFamily: "Acme",
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.left),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[star, star, star, starBorder, starBorder],
          ),
        ]);
    // );
    // ignore: non_constant_identifier_names
    final lista = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(telefono,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(4)),
        Text(descripcion,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(4)),
        Text(horario,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(4)),
        Text(hora,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(4)),
        Text(direccion,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(4)),
        Text(barrio,
            style: const TextStyle(
                fontFamily: "Acme",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(158, 58, 37, 37)),
            textAlign: TextAlign.start),
        const Padding(padding: EdgeInsets.all(8)),
      ],
    );
    final buttondescription = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          color: Colors.amber[900],
          textColor: Colors.white,
          child: const Text('Como llegar'),
        ),
        FlatButton(
          onPressed: () {},
          color: Colors.amber[900],
          textColor: Colors.white,
          child: const Text('Métodos de pago'),
        ),
      ],
    );

    // ignore: non_constant_identifier_names
    final Carta = Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
          top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
      padding: const EdgeInsets.all(20),
      child: Column(children: <Widget>[titleStars, lista, buttondescription]),
    );
    return SizedBox(
      height: 750,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldkEy,
          drawer: Drawer(
            width: 420.0,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/fondo.png'), fit: BoxFit.fill),
              ),
              child: Column(
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
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      color: Colors.white,
                      iconSize: 48,
                    ),
                    Row(
                      children: <Widget>[
                        Center(
                          child: Text(nameplace,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Acme",
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(left: 75.0),
                          child: IconButton(
                            icon: const Icon(Icons.apps_rounded),
                            onPressed: () =>
                                _scaffoldkEy.currentState?.openDrawer(),
                            color: Colors.white,
                            iconSize: 60,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  items: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage("images/opium.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage("images/crobarestanco.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage("images/PABLOESTANCO.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ],
                        image: DecorationImage(
                          image: AssetImage("images/90estanco.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                      height: 190.0,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      scrollDirection: Axis.horizontal),
                ),
                Carta
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Users>> getUser(int type) async {
    final res = await dio.get("http://192.168.1.106:4000/api/registro");
    final lista = res.data;
    // List <Map<String, dynamic>> lista = List.from(jsonDecode(res.data));
    // final url = Uri.parse("http://192.168.1.103:4000/api/carta/$type");
    // final resp = await http.get(url);
    // print(resp.body);
    // final listap = List.from(jsonDecode(resp.body));

    // Function eq = const ListEquality().equals;
    // print('***');
    // print(eq(lista, listap)); // => true

    List<Users> cartita = [];
    for (var element in lista) {
      final Users user = Users.fromJson(element);
      cartita.add(user);
    }
    return cartita;
  }
}
