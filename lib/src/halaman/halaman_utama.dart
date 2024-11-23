import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:siakad_itts/src/settings/settings_view.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

import 'menu/item_menu.dart';

class HalamanUtama extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<StatefulWidget> createState() {
    return HalamanUtamaState();
  }
}

/// Displays a list of SampleItems.
class HalamanUtamaState extends State<HalamanUtama> {
  ListView listSlide = ListView();
  bool isLoading = true;
  final List<ItemMenu> items = [
    ItemMenu("Biodata", 'assets/images/user.png', "/biodata"),
    ItemMenu("Rencana Studi", 'assets/images/krs.png', "/krs"),
    ItemMenu("Hasil Studi", 'assets/images/khs.png', "/khs"),
    ItemMenu("Jadwal Kuliah", 'assets/images/calendar.png', "/jadwal"),
    ItemMenu("Biaya Kuliah", 'assets/images/uang.png', "/biaya"),
    ItemMenu("Berita Kampus", 'assets/images/news.png', "/berita")
  ];

  HalamanUtamaState() {
    getSlide().then((value) => setState(() {
          listSlide = value;
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network('https://app.ibnux.com/gambar/logoitts.jpg',
                  height: 45, width: 45, fit: BoxFit.contain),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SIAKAD ITTS',
                    style: TextStyle(
                      color: Color(0xff009c9d),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Text(
                      'Sistem Informasi Akademik',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff009c9d),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Text(
                      'Institut Teknologi Tangerang Selatan',
                      style: TextStyle(
                        color: Color(0xff009c9d),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
        body:
        Column(
          children: <Widget>[
            Divider(
              height: 10,
            ),
            SizedBox(
              height: 220,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : listSlide,
            ),
            Divider(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              restorationId: 'menuUtama',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ListTile(
                    title: Text(item.name),
                    leading: CircleAvatar(
                      foregroundImage: AssetImage(item.icon),
                    ),
                    onTap: () {
                      Navigator.restorablePushNamed(
                        context,
                        item.route,
                      );
                    });
              },
            ))
          ],
        ));
  }

  Future<ListView> getSlide() async {
    List<dynamic> datas = await fetchAlbum();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) => Card(
        child: InkWell(
          onTap: () async {
            final Uri url = Uri.parse(datas[index]);
            await launchUrl(url);
          },
          child: Image.network(datas[index], height: 200)
          ),
      ),
    );
  }

  Future<List<dynamic>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/ibnux/itts-uts-siakad/refs/heads/main/data/slide_utama.json'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw jsonDecode('[]');
    }
  }
}
