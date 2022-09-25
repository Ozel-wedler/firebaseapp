import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int count2 = 0;

  List<String> itemsProducts = ["Alimento", "Accesorios", "Recompemsas", ""];
  List<String> itemsServicios = [
    "Paseadores",
    "Restaurantes",
    "Foto estudio",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Shop"),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shop)),
              Positioned(
                top: size.height * 0.03,
                left: size.width * 0.07,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("0")),
                ),
              )
            ],
          ),
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
              Positioned(
                top: size.height * 0.03,
                left: size.width * 0.07,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("1")),
                ),
              )
            ],
          ),
          Stack(
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            presentacion(size),
            Divider(),
            story(size),
            card(size),
            buscador(size),
            products(size, itemsProducts),
            services(size, itemsServicios)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule), label: "calendario"),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "map")
      ]),
    );
  }

  services(Size size, lista) {
    return Container(
      width: size.width,
      height: size.height * 0.47,
      child: Column(
        children: [
          taps2(size, lista),
          SizedBox(
            height: 15,
          ),
          productsList(size),
          Divider()
        ],
      ),
    );
  }

  Container products(Size size, lista) {
    return Container(
      width: size.width,
      height: size.height * 0.47,
      child: Column(
        children: [
          taps(size, lista),
          SizedBox(
            height: 15,
          ),
          productsList(size),
          Divider()
        ],
      ),
    );
  }

  Container productsList(Size size) {
    return Container(
        width: size.width,
        height: size.height * 0.35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3.0,
                          spreadRadius: 1,
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(0, 0))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlutterLogo(
                      size: 80,
                    ),
                    Text(
                      "Products",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Row taps2(Size size, lista) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17),
          child: Text(
            "Services near",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: size.width * 0.59,
          height: 60,
          child: Padding(
              padding: const EdgeInsets.only(top: 22, left: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    lista.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              count2 = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: index == count2
                                      ? Colors.purple
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  lista[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: index == count2
                                          ? Colors.white
                                          : Colors.purple),
                                ),
                              )),
                            ),
                          ),
                        )),
              )),
        )
      ],
    );
  }

  Row taps(Size size, lista) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17),
          child: Text(
            "Products near",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: size.width * 0.59,
          height: 60,
          child: Padding(
              padding: const EdgeInsets.only(top: 22, left: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    lista.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              count = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: index == count
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  lista[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: index == count
                                          ? Colors.white
                                          : Colors.green),
                                ),
                              )),
                            ),
                          ),
                        )),
              )),
        )
      ],
    );
  }

  Container card(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      color: Color(0xffF5F5F5),
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            spreadRadius: 1,
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlutterLogo(
                        size: 80,
                      ),
                      Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            spreadRadius: 1,
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlutterLogo(
                        size: 80,
                      ),
                      Text(
                        "Services",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buscador(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.26,
      color: Color(0xffF5F5F5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search Products or services",
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              Icon(Icons.settings)
            ],
          ),
          FlutterLogo(
            size: 90,
          ),
          Divider()
        ],
      ),
    );
  }

  Container story(Size size) => Container(
        width: size.width,
        height: size.height * 0.2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Me Pets",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 220, 223),
                        border: Border.all(color: Colors.purple, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Add pets",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );

  Container presentacion(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.13,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ozel",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pets,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery now",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "Calle revolucion",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
