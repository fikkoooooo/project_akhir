import 'package:flutter/material.dart';
import 'package:project_akhir/kamera/kamera.dart';
import 'package:project_akhir/login/login_page.dart';
import 'package:project_akhir/product/product_view.dart';

const accessoriesColor = Color(0xffeab56f);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Pindah ke halaman Home
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => product_page()));
      } else if (index == 1) {
        // Pindah ke halaman Camera
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => kamera()));
      } else if (index == 2) {
        // Pindah ke halaman Profile
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      }
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => login_page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/fikko.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Fikko Rafirs Yanuar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '124210040',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit Profile'),
                  onTap: () {
                    // Action to edit profile
                  },
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Action to go to settings
                  },
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    _logout();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
