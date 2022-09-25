//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pets/controller/authFacebook.dart';
import 'package:pets/controller/authGoogle.dart';

import '../controller/authGoogle.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late String name;
  late String email;
  late String img;

  late Animation<double> movex;
  late Animation<double> movey;
  late Animation<double> opacity;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [logo(size), signIn(size, context), signUp(size)],
        ),
      ),
    );
  }

  Widget logo(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Hero(
            tag: "logo",
            child: Image(
                height: size.height * 0.3,
                image: const AssetImage("assets/B5.png")),
          ),
        ],
      ),
    );
  }

  Widget signIn(Size size, BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    await AuthGoogle().login();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.2, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff3069F5))),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.g_mobiledata_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Continuar con google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextButton(
                  onPressed: () async {
                    await AuthFacebook().login();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.height * 0.08, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff314FA4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continuar con Facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, 'signup');
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         child: signup(),
                    //         type: PageTransitionType.bottomToTop));
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.height * 0.085, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20)))),
                  child: Row(
                    children: const [
                      Icon(Icons.mail, color: Color(0xff65676F)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Registrarse con e-mail",
                        style: TextStyle(color: Color(0xff65676F)),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget signUp(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Text(
            "Entrar como invitado",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          const Text(
            "Entrar como vendedor",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Ya tienes una cuenta?"),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Text(
                  "Iniciar sesion",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Navigator.push(context,);
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
