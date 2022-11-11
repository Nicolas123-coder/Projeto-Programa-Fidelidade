import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'teste.dart';

class CadastroBeneficioPage extends StatefulWidget {
  @override
  _CadastroBeneficioPageState createState() =>
      new _CadastroBeneficioPageState();
}

class _CadastroBeneficioPageState extends State<CadastroBeneficioPage> {
  String? identifier;
  bool isEmpresa = false;
  bool isUsuario = false;

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
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: 'Nome Benefício',
                        labelStyle: TextStyle(color: Colors.black),
                      )),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Descrição Benefício',
                          labelStyle: TextStyle(color: Colors.black))),
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
                      inputFormatters: [birthdateFormatter]),
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
                      inputFormatters: [birthdateFormatter]),
                  TextFormField(
                      autofocus: true,
                      obscureText: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: const InputDecoration(
                          labelText: 'Pontos necessários',
                          labelStyle: TextStyle(color: Colors.black))),
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
                              borderRadius: BorderRadius.circular(8))),
                      child: Text('Cadastrar'),
                    ),
                  )
                ],
              ))),
    );
  }
}
