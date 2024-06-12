import 'package:exame/classes/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/get_it_config.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 50, 77, 1),
      appBar: AppBar(
        title: Text(core.get<SharedPreferences>().getString('name') ?? ''),
      ),
      body: Center(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 450,
                height: 400,
                decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                              hintText: "Example@gmail.com",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      value: status,
                      onChanged: (val) {},
                      title: Text(
                        "Remember me",
                        style:
                            TextStyle(color: Color(0xff0A324D), fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 90,
              right: 150,
              child: Image.asset(
                "images/traingle.png",
              ))
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100.0, bottom: 50),
        child: Container(
          width: 283,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFFEACD)),
          child: InkWell(
              onTap: () {
                core.get<SharedPreferences>().setString('name', name.text);

                core.get<SharedPreferences>().setString('pass', password.text);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelloPage(),
                    ));
              },
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(fontSize: 50, color: Color(0xff0A324D)),
              ))),
        ),
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Hello Mr.${core.get<SharedPreferences>().getString('name')}"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Center(child: Text("HELLO SHAERD"))),
      ),
    );
  }
}
