import 'package:flutter/material.dart';
import 'package:kuis_pam_fikko/Perhitungan/bentuk.dart';

class Lingkaran extends Bentuk {
  const Lingkaran({super.key, required super.name, required super.image});

  @override
  State<Lingkaran> createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  late double jari = 0;
  late double luas = 0;
  late double keliling = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text(widget.name), backgroundColor: Colors.lightBlueAccent[100]),
      body: Center(
          child: Column(
            children: [
              CardHalamanDetail(image: widget.image, name: widget.name),
              Container(
                width: 200,
                child: TextFormField(
                  onChanged: (value) {
                    jari = double.parse(value);
                  },
                  decoration: const InputDecoration(labelText: "Jari-jari"),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      keliling = 0;
                      luas = 0;
                      keliling = 2 * 3.14 * jari;
                      luas = 3.14 * jari * jari;
                    });
                  },
                  child: Text("Hitung")),
              const SizedBox(
                height: 30,
              ),
              Text("Luas : $luas"),
              Text("Keliling : $keliling")
            ],
          )),
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
