import 'package:flutter/material.dart';
import 'package:flutter_application_1/Secure_Storage.dart';
import 'package:flutter_application_1/bloc/Auth/auth_bloc.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/categorias.dart';
import 'package:flutter_application_1/empresario/categorias_empresario/cerveza_nacional.dart';
import 'package:flutter_application_1/galeria.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/empresario/pag_empresario_edit.dart';
import 'package:flutter_application_1/Login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contenedor = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/fondo.png'), fit: BoxFit.fill),
      ),
      child: const Scaffold(backgroundColor: Colors.transparent),
    );
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          // Navigate to the sign in screen when the user Signs Out
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Login()),
            (route) => false,
          );
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.png'), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 85.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child: Text('Empresario',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Acme",
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 75.0),
                        child: IconButton(
                          icon: const Icon(Icons.exit_to_app_rounded),
                          onPressed: () {
                            // Signing out the user
                            context.read<AuthBloc>().add(SignOutRequested());
                          },
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                        builder: (context) => Stack(
                                              children: <Widget>[
                                                contenedor,
                                                Stack(children: const <Widget>[
                                                  empresario()
                                                ]),
                                              ],
                                            ));
                                    Navigator.push(context, route);
                                  },
                                  child: Column(children: <Widget>[
                                    Column(children: const <Widget>[
                                      Padding(padding: EdgeInsets.all(10)),
                                      Icon(
                                        Icons.co_present_rounded,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                      Text(
                                        'Información',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        'del negocio',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Padding(padding: EdgeInsets.all(10)),
                                    ]),
                                  ]),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(15)),
                              Container(
                                width: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                        builder: (context) => Stack(
                                              children: <Widget>[
                                                contenedor,
                                                Stack(children: const <Widget>[
                                                  galery()
                                                ]),
                                              ],
                                            ));
                                    Navigator.push(context, route);
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Column(children: const <Widget>[
                                        Padding(padding: EdgeInsets.all(10)),
                                        Icon(
                                          Icons.image_rounded,
                                          color: Colors.white,
                                          size: 100,
                                        ),
                                        Text(
                                          'Galeria',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Padding(padding: EdgeInsets.all(20)),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        const Padding(
                          padding: EdgeInsets.all(15),
                        ),
                        Container(
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              final route = MaterialPageRoute(
                                  builder: (context) => Stack(
                                        children: <Widget>[
                                          contenedor,
                                          Stack(children: const <Widget>[
                                            category()
                                          ]),
                                        ],
                                      ));
                              Navigator.push(context, route);
                            },
                            child: Column(
                              children: <Widget>[
                                Column(children: const <Widget>[
                                  Padding(padding: EdgeInsets.all(10)),
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                  Text(
                                    'Productos',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Padding(padding: EdgeInsets.all(20)),
                                ]),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
