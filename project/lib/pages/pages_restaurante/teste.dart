import 'package:flutter/material.dart';
import 'package:project/pages/login.dart';
import 'package:project/main.dart';
import 'package:project/pages/pages_restaurante/cadastro_beneficio.dart';

import 'Style.dart';

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "mont"),
      home: hotelPage(),
    );
  }
}

class hotelPage extends StatefulWidget {
  @override
  _hotelPageState createState() => _hotelPageState();
}

class _hotelPageState extends State<hotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage("assets/images/SantaGula.png"),
                            fit: BoxFit.fitWidth),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
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
                                            new MyApp())));
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Nome Restaurante",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "Reviews",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              // height: 40,
                              // width: 40,
                              // decoration: BoxDecoration(
                              //     shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(Icons.add_circle,
                                      color: Colors.black, size: 50),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: ((BuildContext context) =>
                                                new CadastroBeneficioPage())));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Descrição Restaurante",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Benefícios Ativos",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        placesWidget("Beneficio 1", "Beneficio Ativo 1"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Benefícios Expirados",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              dishWidget(
                                  "Beneficio 1", "Beneficio 1", "Beneficio 1"),
                              dishWidget(
                                  "Beneficio 1", "Beneficio 2", "Beneficio 2"),
                              dishWidget(
                                  "Beneficio 1", "Beneficio 3", "Beneficio 3"),
                              dishWidget(
                                  "Beneficio 1", "Beneficio 4", "Beneficio 4"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container dishWidget(String img, String name, String description) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/$img.png'))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$description",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: black)),
                child: Text("Editar"),
              )
            ],
          )
        ],
      ),
    );
  }

  Row placesWidget(String img, String name) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Beneficio Ativo 1",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
