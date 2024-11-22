import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'menu/item_menu.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({
    super.key,
    this.items = const [
      ItemMenu("Biodata", 'assets/images/user.png'),
      ItemMenu("Rencana Studi", 'assets/images/krs.png'),
      ItemMenu("Hasil Studi", 'assets/images/khs.png'),
      ItemMenu("Jadwal Kuliah", 'assets/images/calendar.png'),
      ItemMenu("Biaya Kuliah", 'assets/images/uang.png'),
      ItemMenu("Berita Kampus", 'assets/images/news.png')
    ],
  });

  static const routeName = '/';

  final List<ItemMenu> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https://app.ibnux.com/gambar/logoitts.jpg',
                  height: 45, width: 45, fit: BoxFit.contain),
              Column(
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
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(child: Text('Dummy Card Text')),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
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
                        SampleItemDetailsView.routeName,
                      );
                    });
              },
            ))
          ],
        ));
  }
}
