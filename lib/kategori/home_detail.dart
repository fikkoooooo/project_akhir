import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/home_deskripsi.dart';
import 'package:project_akhir/kategori/home_model.dart';

const accessoriesColor = Color(0xffeab56f);

class HomeDeco extends StatefulWidget {
  const HomeDeco({super.key});

  @override
  State<HomeDeco> createState() => _HomeDecoState();
}

class _HomeDecoState extends State<HomeDeco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "HOME DECORATION",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListHomeDecoBody(),
    );
  }

  Widget _buildListHomeDecoBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadHomeDecoration(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              HomeDekorasi homeDekorasi = HomeDekorasi.fromJson(snapshot.data);
              return _buildSuccessSection(homeDekorasi);
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

  Widget _buildSuccessSection(HomeDekorasi data) {
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
        return _BuildItemHomeDeco(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemHomeDeco(Products HomeDekorasi) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              HomeDekorasi.thumbnail!,
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              HomeDekorasi.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${HomeDekorasi.rating} /5.0',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesHome(homeDekorasi: HomeDekorasi),
                  ),
                );
              },
              child: Text("Detail"),
            )
          ],
        ),
      ),
    );
  }
}
