import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:localpetdes/pesqpet.dart';
import 'package:localpetdes/verdenun.dart';
import 'cadaspet.dart';
import 'denuncia.dart';
import 'doar.dart';
import 'main.dart';




class HomePage extends StatelessWidget {
  final List<String> _options = [
    'Opção 1',
    'Opção 2',
    'Opção 3',
    'Opção 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEFEAEA), Colors.blue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  duration: Duration(milliseconds: 500),
                  child: FadeInAnimation(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        icon: Row(
                          children: [
                            Image.asset(
                              'assets/foto2.png',
                              width: 65,
                              height: 65,
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.add, color: Colors.black),
                          ],
                        ),
                        label: Text(
                          "FAZER UMA DOAÇÃO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => doar(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ////////////////////////parte 1

              SizedBox(height: 24),

              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: Row(
                        children: [
                          Image.asset(
                            'assets/foto1.png',
                            width: 65,
                            height: 65,
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.add, color: Colors.black),
                        ],
                      ),
                      label: Text(
                        "CADASTRAR PET",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => cadaspet(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            SizedBox(height: 24),

            AnimationConfiguration.synchronized(
              child: SlideAnimation(
                verticalOffset: 50.0,
                duration: Duration(milliseconds: 700),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          'assets/foto1.png',
                          width: 65,
                          height: 65,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add, color: Colors.black),
                      ],
                     ),
                    label: Text(
                      "PESQUISAR PET",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pesqpet(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            //////////////foto 3

            SizedBox(height: 24),

            AnimationConfiguration.synchronized(
              child: SlideAnimation(
                verticalOffset: 50.0,
                duration: Duration(milliseconds: 800),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          'assets/foto3.png',
                          width: 65,
                          height: 65,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add, color: Colors.black),
                      ],
                    ),
                    label: Text(
                      "Ver Denúncia",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => verdenun(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            ///foto3

            SizedBox(height: 24),

            AnimationConfiguration.synchronized(
              child: SlideAnimation(
                verticalOffset: 50.0,
                duration: Duration(milliseconds: 800),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          'assets/foto3.png',
                          width: 65,
                          height: 65,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add, color: Colors.black),
                      ],
                    ),
                    label: Text(
                      "FAZER UMA DENUNCIA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => denuncia(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),

            AnimationConfiguration.synchronized(
              child: SlideAnimation(
                verticalOffset: 50.0,
                duration: Duration(milliseconds: 1000),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Main(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                    size: 30,
                  ),
                  label: Text(
                    "SAIR",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),

      ),
    ),
    );
  }
}