import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/men_jam_deskripsi.dart';
import 'package:project_akhir/kategori/men_jam_model.dart';

const accessoriesColor = Color(0xffeab56f);

class menjam extends StatefulWidget {
  const menjam({super.key});

  @override
  State<menjam> createState() => _menjamState();
}

class _menjamState extends State<menjam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MENS WATCHES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListmenjamBody(),
    );
  }

  Widget _buildListmenjamBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadMenWatches(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              JamPria jampria = JamPria.fromJson(snapshot.data);
              return _buildSuccessSection(jampria);
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

  Widget _buildSuccessSection(JamPria data) {
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
        return _BuildItemJamPria(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemJamPria(Products JamPria) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              JamPria.thumbnail!,
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              JamPria.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${JamPria.rating} /5.0',
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
                    builder: (context) => DesJambaju(jampria: JamPria),
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
