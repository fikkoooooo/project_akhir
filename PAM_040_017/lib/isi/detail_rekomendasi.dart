import 'package:flutter/material.dart';
import 'package:pam_040_017/isi/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final TourismPlace place;
  const HalamanDetail({Key? key, required this.place}) : super(key: key);

  @override
  _HalamanDetailState createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool _isBookmarked = false;

  void showInSnackBar(String value, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }

  void _openPictLink(String imgUrls) async {
    if (await canLaunch(imgUrls)) {
      await launch(imgUrls);
    } else {
      throw 'Tidak dapat membuka: $imgUrls';
    }
  }

  void _openRuteLink(String rute) async {
    if (await canLaunch(rute)) {
      await launch(rute);
    } else {
      throw 'Tidak dapat membuka: $rute';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Detail"), actions: <Widget>[
        IconButton(
          icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white),
          onPressed: () {
            setState(() {
              _isBookmarked = !_isBookmarked;
            });

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(_isBookmarked
                      ? 'Ditambahkan ke Favorit'
                      : 'Dihapus dari Favorit'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );

            if (!_isBookmarked) {
              showInSnackBar("Berhasil Menghapus Favorite", Colors.red);
            } else {
              showInSnackBar("Berhasil Menambahkan Favorite", Colors.blue);
            }
          },
        )
      ]),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 2,
            child: Image.network(widget.place.imageUrls[0]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.place.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                children: [
                  SizedBox(width: 5), // Spasi antara ikon dan teks
                  Text("Description:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                      width:
                          5), // Spasi antara teks "Location:" dan lokasi aktual
                  Text(widget.place.description),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue), // Icon lokasi
                  SizedBox(width: 5), // Spasi antara ikon dan teks
                  Text("Location:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                      width:
                          5), // Spasi antara teks "Location:" dan lokasi aktual
                  Text(widget.place.location),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.timer, color: Colors.blue), // Icon lokasi
                  SizedBox(width: 5), // Spasi antara ikon dan teks
                  Text("Open Time:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                      width:
                          5), // Spasi antara teks "Location:" dan lokasi aktual
                  Text(widget.place.openTime),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.blue), // Icon lokasi
                  SizedBox(width: 5), // Spasi antara ikon dan teks
                  Text("Ticket Price:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                      width:
                          5), // Spasi antara teks "Location:" dan lokasi aktual
                  Text(widget.place.ticketPrice),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Untuk mengatur jarak antara tombol
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _openPictLink(widget.place.imageUrls[0]);
                    },
                    child: Text("Lihat Gambar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _openRuteLink(widget.place.rute);
                    },
                    child: Text("Lihat Rute"),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

}
