import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'teste.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors, unnecessary_new
class CadastroBeneficioPage extends StatefulWidget {
  @override
  _CadastroBeneficioPageState createState() =>
      new _CadastroBeneficioPageState();
}

class _CadastroBeneficioPageState extends State<CadastroBeneficioPage> {
  cadastroPrograma() async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost:3000/estabelecimento/createProgramaFidelidade'),
        body: jsonEncode({
          "programaFidelidade": {
            "idEstabelecimento": idEstabelecimento,
            "nome": nome,
            "descricao": descricao,
            "dataInicio": dataInicio,
            "dataTermino": dataTermino,
            "pontosNecessarios": pontosNecessarios,
            // "premio" = premio
	        }
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });

      print(response.statusCode); 
    } catch (error) {
      print(error);
    }  
  }
  
  String? identifier;
  bool isEmpresa = false;
  bool isUsuario = false;

  String idEstabelecimento = '';
  String nome = '';
  String descricao = '';
  String dataInicio = '';
  String dataTermino = '';
  int pontosNecessarios = 0;
  String premio = '';

  final phoneFormatter = MaskTextInputFormatter(mask: '+## (##) #####-####');
  final cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##');
  final cnpjFormatter = MaskTextInputFormatter(mask: '##.###.###/####-##');
  final birthdateFormatter = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 40,
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      new HotelPage())));
                        },
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.search,
                      //     color: Colors.black,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                  Text('Cadastro Benefício', style: TextStyle(fontSize: 20)),
                  
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: 'ID Estabelecimento',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => {
                        setState(() => {
                          idEstabelecimento = value.toString()
                        })
                      }),
                      
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: 'Nome Benefício',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => {
                        setState(() => {
                          nome = value.toString()
                        })
                      }),
                      
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Descrição Benefício',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) => {
                        setState(() => {
                          descricao = value.toString()
                        })
                      }),
                  TextFormField(
                      autofocus: true,
                      obscureText: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Data de Início do Benefício',
                          labelStyle: TextStyle(color: Colors.black)),
                      inputFormatters: [birthdateFormatter],
                      onChanged: (value) => {
                        setState(() => {
                          dataInicio = value.toString()
                        })
                      },),
                  TextFormField(
                      autofocus: true,
                      obscureText: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Data de Término do Benefício',
                          labelStyle: TextStyle(color: Colors.black)),
                      inputFormatters: [birthdateFormatter],
                      onChanged: (value) => {
                        setState(() => {
                          dataTermino = value.toString()
                        })
                      },
                      ),
                  TextFormField(
                      autofocus: true,
                      obscureText: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Pontos necessários',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) => {
                        setState(() => {
                          pontosNecessarios = int.parse(value)
                        }) 
                      },
                      ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        cadastroPrograma();

                        // Navigator.of(context).pop();
                        //         Navigator.push(
                        //           context,
                        //           new MaterialPageRoute(
                        //             builder: ((BuildContext context) => new LoginPage())
                        //           )
                        // );
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
                  )
                ],
              ))),
    );
  }
}
