// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: camel_case_types
class empresario extends StatefulWidget {
  const empresario({super.key});

  @override
  State<empresario> createState() => _empresarioState();
}

// ignore: camel_case_types
class _empresarioState extends State<empresario> {
  final url = Uri.parse("http://192.168.1.108:4000/api/registro");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  final TextEditingController nombre = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController nitempresa = TextEditingController();
  final TextEditingController nombreestanco = TextEditingController();
  final TextEditingController tipodocumento = TextEditingController(text: "cc");
  final TextEditingController documento = TextEditingController();
  final TextEditingController horainicio = TextEditingController();
  final TextEditingController horafin = TextEditingController();
  final TextEditingController contrasena = TextEditingController();
  final TextEditingController diaatencion = TextEditingController();
  final TextEditingController numerodocumentocomprador =
      TextEditingController();
  final TextEditingController idrol = TextEditingController(text: "1");
  String? _selectedTimeI;
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
    if (result != null) {
      setState(() {
        _selectedTimeI = result.format(context);
      });
    }
  }

  String? _selectedTimeF;
  Future<void> _show2() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
    if (result != null) {
      setState(() {
        _selectedTimeF = result.format(context);
      });
    }
  }

  // TimeOfDay? time = TimeOfDay.now();
  // TimeOfDay? time2 = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_circle_left_outlined),
                color: Colors.white,
                iconSize: 48,
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                children: const <Widget>[
                  Center(
                    child: Text('INFORMACIÓN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Acme",
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ]),
            TextField(
              controller: nitempresa,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                hintText: 'NIT',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: nombreestanco,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Razon socal / nombre',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: direccion,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Dirección del local',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: nombre,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Representante legal',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: documento,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Cédula representante',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: telefono,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Telefono',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: correo,
              keyboardType: TextInputType.emailAddress,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Correo',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: contrasena,
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(158, 255, 255, 255)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Seleccione las horas de atención de su local: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'De',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: _show,
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                  child: Text(
                    _selectedTimeI != null ? _selectedTimeI! : '00:00 PM',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  'A',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: _show2,
                  // async {
                  //   TimeOfDay? newTime = await showTimePicker(
                  //       context: context, initialTime: time2!);
                  //   if (newTime != null) {
                  //     setState(() {
                  //       time2 = newTime;
                  //     });
                  //   }
                  // },
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                  child: Text(
                    _selectedTimeF != null ? _selectedTimeF! : '00:00 AM',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  // '${time2!.hour.toString()}: ${time2!.minute.toString()}'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "* Cargue los documentos en PDF. El archivo debe pesar máximo 3MB.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Acme",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded,color: Colors.white),
                      Text(
                        'RUT*',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded, color: Colors.white),
                      Text(
                        'Cámara y comercio*',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.download_rounded, color: Colors.white),
                      Text('Cédula de ciudadanía*',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Text(
              "Ubica del estanco en el mapa y selecciona la zona a la que pertecene.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Acme",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}
