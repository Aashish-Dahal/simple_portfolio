import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:protflio_app/widgets/contactButton.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPortfolioPage extends StatelessWidget {
  final String title;
  MyPortfolioPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              foregroundImage: NetworkImage(
                  "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          ContactButton(
            padding: 8.0,
            icon: Icons.send_sharp,
            title: 'Contact me',
            onPressed: () {
              launchMailto();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Body(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    color: Color(0xFFFBEFD9),
                    child: Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              launchURL("https://www.facebook.com/");
                            },
                            icon: Image.asset(
                              'assets/social/facebook.png',
                              width: 25,
                              height: 25,
                            ),
                            label: Text('')),
                        TextButton.icon(
                            onPressed: () {
                              launchURL('https://instagram.com');
                            },
                            icon: Image.asset(
                              'assets/social/instagram.png',
                              width: 25,
                              height: 25,
                            ),
                            label: Text('')),
                        TextButton.icon(
                            onPressed: () {
                              launchURL('https://twitter.com');
                            },
                            icon: Image.asset(
                              'assets/social/twitter.png',
                              width: 25,
                              height: 25,
                            ),
                            label: Text('')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['codeish500@example.com'],
      cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'mailto example subject',
      body: 'mailto example body',
    );
    await launch('$mailtoLink');
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

class Body extends StatelessWidget {
  final projectsList = [
    {
      'title': 'Building a Cat',
      'subtitle': 'Great client',
      'image': 'https://picsum.photos/id/100/400/300'
    },
    {
      'title': 'Connekto',
      'subtitle': 'A flutter apps for nerds',
      'image': 'https://picsum.photos/id/1014/400/300'
    },
    {
      'title': 'Been There',
      'subtitle': 'Save places you\'ve visited',
      'image': 'https://picsum.photos/id/3/400/300'
    },
    {
      'title': 'Bengo',
      'subtitle': 'Flutter email app',
      'image': 'https://picsum.photos/id/1025/400/300'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Opacity(
                            opacity: .7,
                            child: Image.asset(
                              "assets/person.png",
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              " Hi there,I'm CodeIsh \n  Flutter Developer   ",
                              style: TextStyle(
                                  letterSpacing: 2.0,
                                  fontSize: 44,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 120, top: 50),
                              child: ContactButton(
                                padding: 20.0,
                                title: 'Drop me a line',
                                icon: Icons.mail_outline,
                                onPressed: () {
                                  launchMailto();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "My Projects",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 23),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: projectsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.work),
                                    title: Text(projectsList[index]['title']),
                                    subtitle:
                                        Text(projectsList[index]['subtitle']),
                                  ),
                                  Container(
                                    child: Image.network(
                                      projectsList[index]['image'],
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        )),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['codeish500@example.com'],
      cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'mailto example subject',
      body: 'mailto example body',
    );
    await launch('$mailtoLink');
  }
}
