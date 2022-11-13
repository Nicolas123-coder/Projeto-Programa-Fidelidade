// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:project/pages/login.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => new _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  cadastroApi() async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost:3000/usuario/create'),
        body: jsonEncode({
          "usuario": {
            "email": email,
            "nome": nome,
            "senha": senha,
            "telefone": telefone
          }
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });

      print(response); 
    } catch (error) {
      print(error);
    }  
  }

  String? identifier;
  bool isEmpresa = false;
  bool isUsuario = false;

  final phoneFormatter = MaskTextInputFormatter(mask: '+## (##) #####-####');
  final cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##');
  final cnpjFormatter = MaskTextInputFormatter(mask: '##.###.###/####-##');
  final birthdateFormatter = MaskTextInputFormatter(mask: '##/##/####');

  String email = '';
  String senha = '';
  String nome = '';
  String telefone = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Cadastro'),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 40,
                children: <Widget>[
                  SizedBox(height: 20),
                  Title(
                      color: Color.fromARGB(255, 144, 146, 144),
                      child: Text('Login')),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => {
                        setState(() => {
                          email = value.toString()
                        })
                      }
                      ),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Nome Completo',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) => {
                        setState(() => {
                          nome = value.toString()
                        })
                      },    
                      ),
                  TextFormField(
                      autofocus: true,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) => {
                        setState(() => {
                          senha = value.toString()
                        })
                      },       
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          title: Text("Empresa"),
                          value: "empresa",
                          visualDensity: null,
                          groupValue: identifier,
                          onChanged: (value) {
                            setState(() {
                              identifier = value.toString();
                              isEmpresa = true;
                              isUsuario = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          title: Text("Usuário"),
                          value: "usuario",
                          visualDensity: null,
                          groupValue: identifier,
                          onChanged: (value) {
                            setState(() {
                              identifier = value.toString();
                              isEmpresa = false;
                              isUsuario = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                      visible: isEmpresa,
                      child: Wrap(
                        runSpacing: 40,
                        children: <Widget>[
                          SizedBox(height: 20),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                              labelText: 'CNPJ',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            inputFormatters: [cnpjFormatter],
                          ),
                          TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              decoration: const InputDecoration(
                                labelText: 'Nome do Estabelecimento',
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                              labelText: 'Telefone de Contato do proprietário',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            inputFormatters: [phoneFormatter],
                          ),
                          TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              decoration: const InputDecoration(
                                labelText: 'Tipo de Comercio',
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              decoration: const InputDecoration(
                                labelText: 'Endereco Restaurante',
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    primary: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36, vertical: 20),
                                    textStyle: const TextStyle(fontSize: 16),
                                    backgroundColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Text('Cadastrar'),
                              )),
                        ],
                      )),
                  Visibility(
                      visible: isUsuario,
                      child: Wrap(
                        runSpacing: 40,
                        children: <Widget>[
                          SizedBox(height: 20),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                              labelText: 'CPF',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            inputFormatters: [cpfFormatter],
                          ),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                              labelText: 'Telefone',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            inputFormatters: [phoneFormatter],
                            onChanged: (value) {
                              setState(() => {
                                telefone = value.toString()
                              });
                            },
                          ),
                          TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.datetime,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                              labelText: 'Data de Aniversário',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            inputFormatters: [birthdateFormatter],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                cadastroApi();

                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: ((BuildContext context) => new LoginPage())));
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 36, vertical: 20),
                                  textStyle: const TextStyle(fontSize: 16),
                                  backgroundColor: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text('Cadastrar'),
                            ),
                          ),
                        ],
                      )),
                ],
              ))),
    );
  }
}
