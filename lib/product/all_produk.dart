import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kamera/kamera.dart';
import 'package:project_akhir/keranjang/cart.dart';
import 'package:project_akhir/product/all_model.dart';
import 'package:project_akhir/product/product_view.dart';
import 'package:project_akhir/profile/profile_page.dart';
import '../keranjang/card_page.dart';

const accessoriesColor = Color(0xffeab56f);

class all_produk extends StatefulWidget {
  const all_produk({super.key});

  @override
  State<all_produk> createState() => _all_produkState();
}

class _all_produkState extends State<all_produk> {
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
          "ALL PRODUCT",
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
      body: _buildListAllBody(),
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

  Widget _buildListAllBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadAll(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              AllProduk all = AllProduk.fromJson(snapshot.data);
              return _buildSuccessSection(all);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(AllProduk data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Menentukan jumlah kolom dalam grid
        crossAxisSpacing: 10.0, // Spasi antar kolom
        mainAxisSpacing: 10.0, // Spasi antar baris
        childAspectRatio:
            0.75, // Perbandingan tinggi terhadap lebar setiap item
      ),
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemAll(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemAll(Products allProduct) {
    return InkWell(
      child: Card(
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              allProduct.thumbnail!,
              width: 220,
              height: 220,
            ),
            Text(
              allProduct.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              allProduct.category!,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                Cart.addToCart(allProduct);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Produk telah masuk keranjang'),
                    backgroundColor: Colors.blue,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              mini: true,
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
