import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models.dart';
import '../main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 50, 77, 1),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getAux(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 20),
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              "All Projects",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Spacer(flex: 1),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 900,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 400,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                                child: Row(
                                  children: [
                                    Stack(children: [
                                      Image(image: AssetImage("images/traingle.png")),
                                      Positioned(
                                          left: 10,
                                          top: 10,
                                          child: Column(
                                            children: [
                                              Text(
                                                "6/15",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ),
                                              Text("2024",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white)),
                                            ],
                                          ))
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${snapshot.data![index].name}",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            "${snapshot.data![index].brand}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

Future<List<Aux>> getAux() async {
  Dio req = Dio();
  Response response = await req.get("https://freetestapi.com/api/v1/products");
  print(response);
  print('response000000000');
  print(response.statusCode);

  List<Aux> myAuxList = List.generate(
    response.data.length,
    (index) => Aux.fromMap(response.data[index]),
  );
  print('000000000000000000000000');
  print(myAuxList);
  print('000000000000000000000000');
  return myAuxList;
}
