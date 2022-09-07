import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class SizeConfig{
    
  double heightSize(BuildContext context, double value){
    value /= 100;
    return MediaQuery.of(context).size.height * value;
  }

  double widthSize(BuildContext context,double value ){
    value /=100;
    return MediaQuery.of(context).size.width * value;
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Image.asset('assets/images/logo.jpg',
            height: 200,
            scale: 2.5,  
          ),
          TextFormField( 
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 20 ),
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.black)
              )
          ),
          TextFormField( 
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 20 ),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.black)
              )
          ),
          Divider(),
          ButtonTheme(
            height: 60.0,
            child: ElevatedButton(
              onPressed: () => {},
              child: const Text(
                "Entrar",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
          ],
        )
      ),
      )
    );
  }
}