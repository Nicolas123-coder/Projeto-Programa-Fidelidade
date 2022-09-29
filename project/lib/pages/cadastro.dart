import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => new _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cadastro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Wrap (
            runSpacing: 40,

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
                        labelStyle: TextStyle(
                          color: Colors.black
                        ),
                      )
              ),
              
              TextFormField(
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.black, 
                        fontSize: 20 ),
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.black)
                      )
              ),

              TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.black, 
                        fontSize: 20 ),
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.black)
                      )
              ),

      //         ListTile(
      //   title: Text(
      //     'Radio $i',
      //     style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
      //   ),
      //   leading: Radio(
      //     value: 'dwedw',
      //     groupValue: _value,
      //     activeColor: Color(0xFF6200EE), 
      //     onChanged: (value) {  },
      //   ),
      // ),

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
            ],
          )
        )
      ),
    );
  }
}