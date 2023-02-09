import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri mail = Uri.parse('mailto:vincenzo.gandolfo7@gmail.com');
    final Uri call = Uri.parse('tel:+393471731213');
    final Uri whatsApp = Uri.parse('whatsapp://send?phone=393471731213');
    final Uri google = Uri.parse('https://google.it');
    final Uri maps = Uri.parse(
        'https://www.google.it/maps/place/Leaning+Tower+of+Pisa/@43.722952,10.3944083,17z/data=!3m1!4b1!4m5!3m4!1s0x12d591a6c44e88cd:0x32eca9b1d554fc03!8m2!3d43.722952!4d10.396597');

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Center(
          child: Text('Link'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinkModel(
              title: 'E-Mail',
              icon: Icons.mail,
              uri: mail,
            ),
            LinkModel(
              title: 'Call',
              icon: Icons.phone,
              uri: call,
            ),
            LinkModel(
              title: 'WhatsApp',
              icon: Icons.whatsapp,
              uri: whatsApp,
            ),
            LinkModel(
              title: 'Google',
              icon: Icons.web,
              uri: google,
            ),
            LinkModel(
              title: 'Maps',
              icon: Icons.location_on,
              uri: maps,
            ),
          ],
        ),
      ),
    );
  }
}

class LinkModel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Uri uri;

  const LinkModel({
    super.key,
    required this.title,
    required this.icon,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(uri);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Center(
                  child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Expanded(child: Center(child: Icon(icon))),
          ],
        ),
      ),
    );
  }
}
