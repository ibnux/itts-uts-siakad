import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class Biodata extends StatelessWidget {
  const Biodata({super.key});

  static const routeName = '/biodata';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "1002230031",
              keyboardType: TextInputType.phone,
              decoration:
                  InputDecoration( labelText: 'NIM'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "Ibnu Maksum",
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration( labelText: 'Nama Lengkap'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "Cipocok Jaya Kota Serang",
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration( labelText: 'Alamat'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "Teknik Informasi",
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration( labelText: 'Jurusan'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "2023",
              keyboardType: TextInputType.phone,
              decoration:
                  InputDecoration( labelText: 'Tahun Masuk / Angkatan'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              initialValue: "EKSEKUTIF",
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration( labelText: 'Kelas'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
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
                  Navigator.pop(context);
                },
                child: Text('SIMPAN'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
