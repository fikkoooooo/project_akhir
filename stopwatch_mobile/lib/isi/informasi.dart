import 'package:flutter/material.dart';
import 'package:stopwatch_mobile/form/my_home.dart';
import 'package:stopwatch_mobile/page/login_page.dart';


class informasi extends StatefulWidget {
  const informasi({super.key});


  @override
  _InformasiState createState() => _InformasiState();
}

class _InformasiState extends State<informasi> {
  int _currentIndex = 0;

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bantuan'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => homepage(),
                ),
              );
            },
          )
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              children: <Widget>[

                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {

                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.book_outlined,
                            size: 70,
                            color: Colors.purpleAccent,
                          ),
                          Text("Panduan Informasi", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      logout(context);
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.logout,
                            size: 70,
                            color: Colors.red,
                          ),
                          Text("Logout",
                              style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });

          // Handle navigasi ke halaman yang sesuai
          if (_currentIndex == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => homepage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories_outlined),
            label: 'Bantuan',
          ),
        ],
      ),
    );
  }
}
