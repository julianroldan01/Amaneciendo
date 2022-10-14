import 'package:flutter_application_1/Utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/Auth/auth_bloc.dart';
import 'package:flutter_application_1/empresario/home.dart';
import 'package:flutter_application_1/header_register.dart';
import 'package:flutter_application_1/cliente/nose.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  // FirebaseAuth auth = FirebaseAuth.instance;
  String pathImage = "images/google.png";

  void _authenticateWithEmailAndPassword(context) {
    if (formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailcontroller.text, _passwordcontroller.text),
      );
    }
  }
//
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconBar = Container(
      height: 35.0,
      width: 35.0,
      margin: const EdgeInsets.only(top: 2.0, left: 10.0, right: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(pathImage),
        ),
      ),
    );

    final margin = Container(
      margin: const EdgeInsets.only(top: 300.0),
    );
    final columna = Column(mainAxisAlignment: MainAxisAlignment.center);
    return Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.png'), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  // Navigating to the dashboard screen if the user is authenticated
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                }
                if (state is AuthError) {
                  // Showing the error message if the user has entered invalid credentials
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is Loading) {
                    // Showing the loading indicator while the user is signing in
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UnAuthenticated) {
                    return ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 60.0),
                      children: <Widget>[
                        columna,
                        margin,
                        const SizedBox(
                          width: 360.0,
                          height: 15.0,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            enableInteractiveSelection: true,
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                              hintText: 'Correo',
                              hintStyle: const TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                              suffixIcon: const Icon(
                                Icons.alternate_email,
                                color: (Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'ingrese un email valido'
                                    : null),
                        const Divider(
                          height: 18.0,
                        ),
                        TextFormField(
                          enableInteractiveSelection: false,
                          obscureText: true,
                          controller: _passwordcontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Ingrese minimo 6 caracteres'
                                  : null,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: const TextStyle(
                                fontSize: 20.0, color: Colors.white),
                            suffixIcon: const Icon(
                              Icons.lock_outline,
                              color: (Colors.white),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const Divider(height: 15.0),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: FlatButton(
                            hoverColor: Colors.amber[900],
                            color: Colors.amber[900],
                            onPressed: () {
                              _authenticateWithEmailAndPassword(context);
                            },
                            // signIn,
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 30.0,
                                  fontFamily: 'NerkoOne'),
                            ),
                          ),
                        ),
                        const Divider(height: 18.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            iconBar,
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(right: 40.0),
                                  child: FlatButton(
                                    onPressed: () {
                                      _authenticateWithGoogle(context);
                                    },
                                    color:
                                        const Color.fromARGB(102, 43, 42, 42),
                                    textColor: Colors.white,
                                    child: const Text('Acceder'),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const usuario()),
                                        );
                                      },
                                      color: Colors.amber[900],
                                      textColor: Colors.white,
                                      child: const Text('Registrar'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            child: FlatButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                onPressed: () => {},
                                color: Colors.transparent,
                                textColor: Colors.white,
                                child: const Text('Olvide mi contraseña'))),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ));
  }
}
