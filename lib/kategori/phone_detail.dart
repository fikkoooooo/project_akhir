import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/phone_deskripsi.dart';
import 'package:project_akhir/kategori/phone_model.dart';

const accessoriesColor = Color(0xffeab56f);

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "SMARTPHONES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListPhoneBody(),
    );
  }

  Widget _buildListPhoneBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadPhone(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Phone phone = Phone.fromJson(snapshot.data);
              return _buildSuccessSection(phone);
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

  Widget _buildSuccessSection(Phone data) {
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
        return _BuildItemPhone(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemPhone(Products Phone) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Phone.thumbnail!,
              width: 220,
              height: 220,
            ),
            Text(
              Phone.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Phone.rating} /5.0',
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
                    builder: (context) => DesPhone(phone: Phone),
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
