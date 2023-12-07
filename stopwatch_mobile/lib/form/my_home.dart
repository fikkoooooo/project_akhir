import 'package:flutter/material.dart';
import 'package:stopwatch_mobile/isi/rekomendasi.dart';
import 'package:stopwatch_mobile/page/login_page.dart';
import 'package:stopwatch_mobile/isi/profil.dart';
import 'package:stopwatch_mobile/isi/stopwatch.dart';
import 'package:stopwatch_mobile/isi/informasi.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<homepage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard', style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/logo.png',
                  width: 140,
                  height: 140,
                ),
              ),
              const SizedBox(height: 10),
              Text('Welcome', style: Theme.of(context).textTheme.headline4),
              Text('Kami menyediakan apa yang kamu butuh', style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              ListTile(
                onTap: () {
                  Navigator.push(context, //buat next ke halaman sleanjutnya
                      MaterialPageRoute(builder: (context) {
                        return profil();
                      }));
                },
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.person_2_outlined, color: Colors.blueAccent),
                ),
                title: Text('Profile', style: Theme.of(context).textTheme.bodyText1),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_outlined, size: 18.0, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),

              ListTile(
                onTap: () {
                  Navigator.push(context, //buat next ke halaman sleanjutnya
                      MaterialPageRoute(builder: (context) {
                        return StopwatchApp();
                      }));
                },
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.alarm_sharp, color: Colors.blueAccent),
                ),
                title: Text('StopWatch', style: Theme.of(context).textTheme.bodyText1),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_outlined, size: 18.0, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),

              ListTile(
                onTap: () {
                  Navigator.push(context, //buat next ke halaman sleanjutnya
                      MaterialPageRoute(builder: (context) {
                        return halaman_utama();
                      }));
                },
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.location_on, color: Colors.blueAccent),
                ),
                title: Text('Rekomendasi Tempat', style: Theme.of(context).textTheme.bodyText1),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_outlined, size: 18.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });

          // Handle navigasi ke halaman yang sesuai
          if (_currentIndex == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => informasi(),
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
