import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/motor_deskripsi.dart';
import 'package:project_akhir/kategori/motor_model.dart';

const accessoriesColor = Color(0xffeab56f);

class motorcycle extends StatefulWidget {
  const motorcycle({super.key});

  @override
  State<motorcycle> createState() => _motorcycleState();
}

class _motorcycleState extends State<motorcycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MOTORCYCLE",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListMotorcycleBody(),
    );
  }

  Widget _buildListMotorcycleBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadMotorcycle(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Motorcycle motorcycle = Motorcycle.fromJson(snapshot.data);
              return _buildSuccessSection(motorcycle);
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

  Widget _buildSuccessSection(Motorcycle data) {
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
        return _BuildItemMotorcycle(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemMotorcycle(Products Motorcycle) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Motorcycle.thumbnail!,
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Motorcycle.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Motorcycle.rating} /5.0',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //ElevatedButton(
            //onPressed: () {
            //Navigator.push(
            //context,
            //MaterialPageRoute(
            //builder: (context) => DesSepedamotor(motorcycle: Motorcycle),
            //),
            //);
            //},
            //child: Text("Detail"),
            //)
          ],
        ),
      ),
    );
  }
}
