import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/furniture_deskripsi.dart';
import 'package:project_akhir/kategori/furniture_model.dart';

const accessoriesColor = Color(0xffeab56f);

class furniture extends StatefulWidget {
  const furniture({super.key});

  @override
  State<furniture> createState() => _furnitureState();
}

class _furnitureState extends State<furniture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "FURNITURE",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListFurnitureBody(),
    );
  }

  Widget _buildListFurnitureBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadFurniture(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Furniture furniture = Furniture.fromJson(snapshot.data);
              return _buildSuccessSection(furniture);
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

  Widget _buildSuccessSection(Furniture data) {
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
        return _BuildItemFurniture(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemFurniture(Products Furniture) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Furniture.thumbnail!,
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Furniture.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Furniture.rating} /5.0',
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
                    builder: (context) => DesFurniture(furniture: Furniture),
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
