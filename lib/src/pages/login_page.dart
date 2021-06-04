import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static final routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _backgroudHeader(context),
        _loginForm(context),
      ],
    ));
  }
}

_loginForm(_) {
  final size = MediaQuery.of(_).size;
  final loginBloc = Provider.of(_);
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
            child: Container(
          height: size.height * 0.28,
        )),
        Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 40.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
              ),
              SizedBox(
                height: 20.0,
              ),
              _emailWidget(loginBloc),
              SizedBox(
                height: 20,
              ),
              _passwordWidget(loginBloc),
              SizedBox(
                height: 50,
              ),
              _loginButton(_, loginBloc),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text("Forgot password?"),
        SizedBox(
          height: 100.0,
        )
      ],
    ),
  );
}

Widget _emailWidget(LoginBloc loginBloc) {
  return StreamBuilder(
    stream: loginBloc.emailStream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: "example@email.com",
              labelText: "Email",
              errorText: snapshot.error),
          onChanged: loginBloc.emailSink,
        ),
      );
    },
  );
}

Widget _passwordWidget(LoginBloc loginBloc) {
  return StreamBuilder(
    stream: loginBloc.passwordStream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.deepPurple,
              ),
              labelText: "Password",
              errorText: snapshot.error),
          onChanged: loginBloc.passwordSink,
        ),
      );
    },
  );
}

Widget _loginButton(_, LoginBloc loginBloc) {
  return StreamBuilder(
    stream: loginBloc.loginStream,
    builder: (context, snapshot) {
      return ElevatedButton(
        onPressed: snapshot.hasData
            ? () => Navigator.pushReplacementNamed(_, HomePage.routeName)
            : null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            "Log in",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          elevation: MaterialStateProperty.all(0.0),
        ),
      );
    },
  );
}

Widget _backgroudHeader(_) {
  final size = MediaQuery.of(_).size;

  final purpleBackgroud = Container(
    height: size.height * 0.4,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Color.fromRGBO(63, 63, 156, 1.0),
      Color.fromRGBO(90, 70, 178, 1.0)
    ])),
  );

  final circle = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.08)),
  );

  return Stack(
    children: <Widget>[
      purpleBackgroud,
      Positioned(top: 150.0, left: 30.0, child: circle),
      Positioned(top: -40.0, left: -30.0, child: circle),
      Positioned(top: 40.0, right: -80.0, child: circle),
      Positioned(top: 90, right: 100, child: circle),
      Positioned(top: 30, right: 160, child: circle),
      Positioned(top: -40, right: -20, child: circle),
      Positioned(top: 200, right: 30, child: circle),
      Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 80.0,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              "Pipelin",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      )
    ],
  );
}
