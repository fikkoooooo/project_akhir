import 'package:flutter/material.dart';
import 'package:stopwatch_mobile/isi/detail_rekomendasi.dart';
import 'package:stopwatch_mobile/isi/tourism_place.dart';

class halaman_utama extends StatelessWidget {
  const halaman_utama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Utama"),
        ),
        body: ListView.builder(
            itemCount: tourismPlaceList.length,
            itemBuilder: (context, index) {
              final TourismPlace place = tourismPlaceList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return halaman_detail(place: place);
                  }));
                },
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Image.network(place.imageUrls[0]),
                      ),
                      SizedBox(width: 20),
                      Text(place.name)
                    ],
                  ),
                ),
              );
            }));
  }
}