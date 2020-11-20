import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:salesforce/bloc/auth_bloc/auth_bloc.dart';
import 'package:salesforce/pages/intro_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => IntroPage()), (route) => false);
        }
      },
      child: Material(
        color: Color.fromRGBO(247, 247, 247, 1.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/salesforce.png'),
              ),
              GFLoader(
                type: GFLoaderType.circle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
