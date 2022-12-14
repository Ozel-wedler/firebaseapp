import 'package:flutter/material.dart';

class LoginEmail extends StatefulWidget {
  LoginEmail({Key? key}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var height, width, size;
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  bool validEmail = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: titulo(), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(child: formulario()),
    );
  }

  Widget titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const Text('Iniciar sesión'), logo()],
    );
  }

  Widget logo() {
    return Hero(
      tag: "logo",
      child: Image.asset(
        'assets/B5.png',
        fit: BoxFit.contain,
        height: height / 15,
      ),
    );
  }

  Widget formulario() {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.07,
          top: height * 0.04,
          right: width * 0.07,
          bottom: height * 0.01),
      child: form(),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          etiquetaTexto("Inicia esión con tu cuenta para continuar", 17.0,
              FontWeight.bold, Colors.black54, 1),
          SizedBox(
            height: height * 0.058,
          ),
          etiquetInput("Correo electrónico"),
          campoInput('Email Adresss', 2),
          SizedBox(
            height: height * 0.03,
          ),
          etiquetInput("Contraseña"),
          campoInput2('Password', 1),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
              child: etiquetaTexto("¿Has olvidado tu contraseña?", 17.0,
                  FontWeight.bold, Colors.red, 2),
              onTap: () {}),
          SizedBox(height: height * 0.34),
          btnIngresar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              etiquetaTexto("¿Todavía no tienes una cuenta?", 15.0,
                  FontWeight.normal, Colors.black, 1),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: etiquetaTexto(
                      "Regístrate", 15.0, FontWeight.bold, Colors.red, 1)),
            ],
          )
        ],
      ),
    );
  }

  Widget etiquetaTexto(texto, fontSize, fontWeight, colors, posicion) {
    return Row(
      mainAxisAlignment:
          posicion == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: colors),
        )
      ],
    );
  }

  Widget etiquetInput(texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }

  Widget campoInput(texto, bandera) {
    return TextFormField(
      controller: _controller1,
      onChanged: (v) {
        validarEmail(v);
      },
      decoration: InputDecoration(
          suffixIcon: bandera == 1 ? Icon(Icons.remove_red_eye) : SizedBox(),
          hintText: texto,
          counterText: !validEmail ? "" : "Correo Invalido",
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget campoInput2(texto, bandera) {
    return TextFormField(
      controller: _controller2,
      decoration: InputDecoration(
          suffixIcon: bandera == 1 ? Icon(Icons.remove_red_eye) : SizedBox(),
          hintText: texto,
          counterText:
              "8 caracteres, con una mayúscula, numero y un carácter especial",
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  validarEmail(v) {
    print("entro");
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v)) {
      validEmail = false;
      setState(() {});
      print("entro en true");
    } else {
      print("entro aqui");
      validEmail = true;
      setState(() {});
    }
  }

  Widget btnIngresar() {
    return ElevatedButton(
        onPressed: () async {},
        style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.32, vertical: 15),
          primary: Colors.white,
          backgroundColor: Colors.green,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Ingresar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ));
  }
}
