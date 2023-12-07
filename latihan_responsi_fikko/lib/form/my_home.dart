import 'package:flutter/material.dart';
import 'package:latihan_responsi_fikko/menu/blogs.dart';
import 'package:latihan_responsi_fikko/menu/news.dart';
import 'package:latihan_responsi_fikko/menu/reports.dart';
import 'package:latihan_responsi_fikko/page/login_page.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  void logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: Text(
              'SPACE FLIGHT NEWS ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 3,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return news();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/news.png',
                            width: 300,
                            height: 300,
                          ),
                          Text("NEWS", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,)),
                          Text("Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites"),
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return blog();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/blogs.png',
                            width: 300,
                            height: 300,
                          ),
                          Text("BLOGS", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,)),
                          Text("Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast"),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return reports();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/reports.png',
                            width: 280,
                            height: 280,
                          ),
                          Text("REPORT", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,)),
                          Text("Space station and other missions often publish their data. with SNAPI, you can include it in your app as well!")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
