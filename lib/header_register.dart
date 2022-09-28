import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pag_empresario.dart';
import 'package:flutter_application_1/Login.dart';
import 'pag_usuario.dart';

// ignore: camel_case_types
class usuario extends StatefulWidget {
  final Function() onClickedSignIn;
  const usuario({Key? key, required this.onClickedSignIn}):super(key: key);

  @override
  State<usuario> createState() => _usuarioState();
}

// ignore: camel_case_types
class _usuarioState extends State<usuario> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iconregresar = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 15.0, right: 45.0),
          child: IconButton(
            onPressed: widget.onClickedSignIn,
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Colors.white,
            iconSize: 48,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text("REGISTRO",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/fondo.png")),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  iconregresar,
                  const SizedBox(height: 20),
                  Container(
                    // height: 50,
                    width: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 244, 128, 39),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: Colors.amber[900],
                            indicatorColor: Colors.white,
                            indicatorWeight: 2,
                            indicator: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30)),
                            ),
                            controller: tabController,
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              const Tab(
                                text: 'Usuario',
                              ),
                              const Tab(
                                text: 'Empresario',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const pagusuario(),
                        const empresario(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
