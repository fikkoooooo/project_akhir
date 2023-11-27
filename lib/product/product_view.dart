import 'package:flutter/material.dart';
import 'package:project_akhir/kamera/kamera.dart';
import 'package:project_akhir/kategori/furniture_detail.dart';
import 'package:project_akhir/kategori/home_detail.dart';
import 'package:project_akhir/kategori/laptop_detail.dart';
import 'package:project_akhir/kategori/men_baju_detail.dart';
import 'package:project_akhir/kategori/men_jam_detail.dart';
import 'package:project_akhir/kategori/men_sepatu_detail.dart';
import 'package:project_akhir/kategori/motor_detail.dart';
import 'package:project_akhir/kategori/parfum_detail.dart';
import 'package:project_akhir/kategori/phone_detail.dart';
import 'package:project_akhir/kategori/skincare_detail.dart';
import 'package:project_akhir/keranjang/card_page.dart';
import 'package:project_akhir/product/all_produk.dart';
import 'package:project_akhir/profile/profile_page.dart';

const accessoriesColor = Color(0xffeab56f);

class product_page extends StatefulWidget {
  const product_page({super.key});

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "KATEGORI PRODUK",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: accessoriesColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text(
                'All Produk',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return all_produk();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text(
                'Kategori Produk',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return product_page();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text(
                'Keranjang',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartPage();
                }));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.count(
            padding: const EdgeInsets.all(25),
            crossAxisCount: 5,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return phone();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/phone.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "SMARTPHONE",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return laptop();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/laptop.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "LAPTOP",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return skincare();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/skincare.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "SKINCARE",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return furniture();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/furniture.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "FURNITURE",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeDeco();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/interior.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "HOME DECORATIONS",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return parfum();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/parfum.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "FRAGRANCES",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return menbaju();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/baju.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "MENS SHIRTS",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return mensepatu();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/sepatup.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "MENS SHOES",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return menjam();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/jamp.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "MENS WATCHES",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return motorcycle();
                    }));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/motor.png',
                            width: 200, height: 200),
                        Text(
                          "MOTORCYCLE",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/dress.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "WOMENS DRESSES",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/sepatuw.png',
                            width: 200, height: 200),
                        Text(
                          "WOMENS SHOES",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/bagw.png', width: 200, height: 200),
                        Text(
                          "WOMENS BAGS",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/anting.png',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "WOMENS JEWELLERY",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 20,
                shadowColor: Colors.blue[800],
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/jamw.png',
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          "WOMENS WATCHES",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
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
