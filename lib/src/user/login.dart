import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  final _formKey = GlobalKey<FormState>();

  bool passObscure = false;
  late IconData eye;

  @override
  void initState() {
    super.initState();
    passObscure = true;
    eye = MdiIcons.eye;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      color: Colors.white,
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Stack(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: size.height * 0.295,
                  width: size.width,
                  color: Colors.greenAccent,
                ),
              ),
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: size.height * 0.28,
                  width: size.width,
                  color: Colors.green,
                ),
              ),
              //*********Header *********/
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.85,
                    height: size.height * 0.15,
                    // color: Colors.green,
                    child: Column(
                      children: const [
                        Text(
                          'Gimnasio USM JMC',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Text(
                          'Ingreso de sesión.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.55,
          color: Colors.white,
          width: size.width,
          child: Column(children: [
            Form(
                key: _formKey,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 5),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Inicio de sesión',
                                  style: TextStyle(fontSize: 23),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Indique su email';
                          }
                          if (RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@(usm|sansano)\.cl$")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Ingrese un formato de email valido';
                          }
                        },
                        controller: emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: "E-mail",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          // focusColor: Colors.green,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Indique su Contraseña';
                          }
                          return null;
                        },
                        obscureText: passObscure,
                        controller: passwordCtrl,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passObscure = !passObscure;
                                if (passObscure) {
                                  eye = MdiIcons.eyeOff;
                                } else {
                                  eye = MdiIcons.eye;
                                }
                              });
                            },
                            icon: Icon(
                              (eye),
                              color: const Color(0xFFFFA960),
                            ),
                          ),
                          labelStyle: const TextStyle(color: Colors.green),
                          labelText: "Contraseña",
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          // height: size.height * 0.05,
                          child: Center(
                            child: Text(
                              errorText,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                          child: InkWell(
                        onTap: () {},
                        child: const Text('Olvidaste tu contraseña?',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline)),
                      ))
                    ])))
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          height: size.height * 0.1,
          width: size.width,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.green)))),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {});
              }
            },
            child: Text("Ingresar".toUpperCase(),
                style: const TextStyle(fontSize: 15)),
          ),
        )
      ]),
    );
  }
}
