// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/pages/cadastro.dart';
import 'about.dart';

// class Login {
//   final String email;
//   final String senha;
//   final String tipoUsuario;

//   Login (
//     this.email,
//     this.senha,
//     this.tipoUsuario
//   );
// }
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

String email = "";

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 239, 241),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 175,
              width: 350,
              child:Image.asset('assets/images/logo.jpg')
              ),
          Padding(
          padding: EdgeInsets.all(17),
          child: Center(
            // Image.asset('assets/images/logo.jpg'),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200,
                minHeight: 200,
                maxWidth: 500,
                maxHeight: 420
              ),
              child: Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 144, 146, 144).withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Wrap(
                  runSpacing: 20,

                  children: <Widget> [
                    SizedBox(height: 20),

                    Title(color: Color.fromARGB(255, 144, 146, 144), child: Text('Login')),
                    
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.black, 
                        fontSize: 20 ),
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.black)
                      ),
                      //ADICIONAR O ON CHANGE !! e colocar no email q ta no state
                      onChanged: (value) {
                        email = value;
                      },
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
                        labelStyle: TextStyle(color: Colors.black))
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 20
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16
                          ),
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ), 
                        child: Text('Entrar'),

                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não tem uma conta ?'),
                        SizedBox(width: 6),
                        GestureDetector(
                          child: Text(
                            'Criar Conta',
                            style: TextStyle (
                            color: Colors.blue
                            ) 
                          ),
                          onTap: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => CadastroPage())
                            );
                          },
                        ),
                      ],
                      )
                  ],
                )
              ),
              ),
          ) 
        )
          ],
        )
        
        
    ));
  }
}