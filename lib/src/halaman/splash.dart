import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/';
  final userCont = TextEditingController();
  final passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.network('https://app.ibnux.com/gambar/logoitts.jpg',
                height: 80, width: 80, fit: BoxFit.contain),
          ),
          Center(
            child: Text(
              "SIAKAD ITTS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff009c9d),
              ),
            ),
          ),
          Center(
            child: Text("Sistem Informasi Akademik",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff009c9d),
              ),),
          ),
          Center(
            child: Text("Institut Teknologi Tangerang Selatan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff009c9d),
              ),),
          ),
        ],
      ),
    );
  }
}
