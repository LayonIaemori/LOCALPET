import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';

import 'dados.dart';

class doar extends StatelessWidget {
  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      print('Não pode executar o link $url');
    }
  }

  Future<void> _launchTelegram(String username) async {
    final telegramUrl = 'https://t.me/$username';

    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: telegramUrl,
        package: 'org.telegram.messenger');

    try {
      await intent.launch();
    } catch (e) {
      print('Não pode abrir o Telegram: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Row(
          children: [
            Icon(Icons.pets, size: 30, color: Colors.black),
            SizedBox(width: 10),
            Text('LocalPet', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.phone, color: Colors.white),
              label: Text('Telefone'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () => _launchLink('tel:15996987385'),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.whatshot, color: Colors.white),
              label: Text('Mandar Mensagem via Telegram'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () => _launchTelegram('iaemor1'),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.search, color: Colors.white),
              label: Text('Dados para PIX ou TED'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dados()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
