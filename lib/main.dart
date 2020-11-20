import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesforce/bloc/auth_bloc/auth_bloc.dart';
import 'package:salesforce/bloc/contact_bloc/contact_bloc.dart';
import 'package:salesforce/pages/splash_page.dart';

void main() {
  runApp(Salesforce());
}

class Salesforce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(AuthInitialized())..add(Authenticate())),
        BlocProvider<ContactBloc>(
            create: (_) =>
                ContactBloc(ContactUninitialized())..add(LoadContacts())),
      ],
      child: MaterialApp(
        title: "Salesforce",
        home: SplashPage(),
        theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: Color(0xFF3F51B5),
          primaryColorDark: Color(0xFF303F9F),
          primaryColorLight: Color(0xFFC5CAE9),
          accentColor: Color(0xFF7C4DFF),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: TextStyle(fontSize: 16.0)),
          ),
        ),
      ),
    );
  }
}
