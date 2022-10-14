import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils.dart';
import 'package:flutter_application_1/bloc/Auth/auth_bloc.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/cliente/nose.dart';
import 'package:flutter_application_1/pag_usuario.dart';
import 'package:flutter_application_1/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Login.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return RepositoryProvider(create: (context) => AuthRepository(),
    child: BlocProvider(create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context),),
    child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey, 
        title: 'AMANECIENDO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: 'Login',
        home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                if (snapshot.hasData) {
                  return const Login();
                }
         return const Login();
  }),
      ),
    ));  
  }
}
