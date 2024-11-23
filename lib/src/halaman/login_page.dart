import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:siakad_itts/src/halaman/halaman_utama.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "1002230031",
              keyboardType: TextInputType.phone,
              decoration:
                  InputDecoration(icon: Icon(Icons.person), labelText: 'NIM'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "1002230031",
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: 'Password'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HalamanUtama.routeName,
                  );
                },
                child: Text('MASUK'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
