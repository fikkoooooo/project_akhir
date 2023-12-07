import 'package:flutter/material.dart';
import 'package:kuis_pam_fikko/Perhitungan/bentuk.dart';

class Segitiga extends Bentuk {
  const Segitiga({super.key, required super.name, required super.image});

  @override
  State<Segitiga> createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  late double alas = 0;
  late double tinggi = 0;
  late double sisi1 = 0;
  late double sisi2 = 0;
  late double sisi3 = 0;
  late double keliling = 0;
  late double luas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text(widget.name), backgroundColor: Colors.lightBlueAccent[100]),
      body: ListView(
        children: [
          Center(
              child: Column(
                children: [
                  CardHalamanDetail(image: widget.image, name: widget.name),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        alas = double.parse(value);
                      },
                      decoration: const InputDecoration(labelText: "Alas"),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        tinggi = double.parse(value);
                      },
                      decoration: const InputDecoration(labelText: "Tinggi"),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        sisi1 = double.parse(value);
                      },
                      decoration: const InputDecoration(labelText: "Sisi 1"),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        sisi2 = double.parse(value);
                      },
                      decoration: const InputDecoration(labelText: "Sisi 2"),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        sisi3 = double.parse(value);
                      },
                      decoration: const InputDecoration(labelText: "Sisi 3"),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          keliling = 0;
                          luas = 0;

                          luas = 0.5 * alas * tinggi;
                          keliling = sisi1 + sisi2 + sisi3;
                        });
                      },
                      child: Text("Hitung")),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Luas : $luas"),
                  Text("Keliling: $keliling"),
                  SizedBox(
                    height: 80,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CardHalamanDetail extends StatelessWidget {
  const CardHalamanDetail({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(children: [
          SizedBox(height: 200, width: 200, child: Image.network(image)),
          Text(name)
        ]),
      ),
    );
  }
}
