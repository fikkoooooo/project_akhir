import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_akhir/kategori2/womens_watches_model.dart';

const accessoriesColor = Color(0xffeab56f);

class DesWomenjam extends StatelessWidget {
  final Products jamwanita;
  const DesWomenjam({Key? key, required this.jamwanita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "DETAIL WOMENS WATCHES",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: jamwanita.images != null && jamwanita.images!.isNotEmpty
                  ? CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
                items: jamwanita.images!.map((item) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
                  : Center(
                child: Text('No images available'),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              jamwanita.title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Price            : \$${jamwanita.price}',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Rating          : ${jamwanita.rating}/5',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Stock           : ${jamwanita.stock}',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Kategori      : ${jamwanita.category}',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description : ',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              jamwanita.description!,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(jamwanita.thumbnail ?? '');
        },
        icon: Icon(Icons.search),
        label: Text("See Pict"),
      ),
    );
  }

  _launchURL(String thumbnail) async {
    if (await canLaunch(thumbnail)) {
      await launch(thumbnail);
    } else {
      throw 'Could not launch $thumbnail';
    }
  }
}
