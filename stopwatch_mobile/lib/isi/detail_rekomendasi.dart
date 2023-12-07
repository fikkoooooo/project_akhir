import 'package:flutter/material.dart';
import 'package:stopwatch_mobile/isi/tourism_place.dart';

class halaman_detail extends StatelessWidget {
  final TourismPlace place;
  const halaman_detail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Detail"),
      ),
      body: ListView(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.height / 2,
              child: Image.network(place.imageUrls[0])
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(place.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.pink,
                ),
              ),
            ],
          ),

          Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
          SizedBox(height: 10),
          Text("Description :", style: TextStyle(
              fontWeight: FontWeight.bold)),
          Text(place.description),

          SizedBox(height: 10),
          Text("Location :", style: TextStyle(
              fontWeight: FontWeight.bold)),
          Text(place.location),

          SizedBox(height: 10),
          Text("Open Time :", style: TextStyle(
              fontWeight: FontWeight.bold)),
          Text(place.openTime),

          SizedBox(height: 10),
          Text("Ticket Price :", style: TextStyle(
              fontWeight: FontWeight.bold)),
          Text(place.ticketPrice),

          SizedBox(height: 10),
          IconButton(
            onPressed: () {
              var place;
              _launcher(place.imageUrls[0]);
            },
            icon: Icon(Icons.link),
          ),
          ],
          ),
        ],
      ),
    );
  }
  Future<void> _launcher(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url.toString() as Uri)) {
      throw Exception("Gagal membuka url : $_url");
    }
  }

  launchUrl(Uri string) {}
}