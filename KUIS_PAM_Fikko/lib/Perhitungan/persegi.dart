import 'package:flutter/material.dart';
import 'package:kuis_pam_fikko/Perhitungan/bentuk.dart';

class Persegi extends Bentuk {
  const Persegi({
    super.key,
    required super.image,
    required super.name,
  });

  @override
  State<Persegi> createState() => _PersegiState();
}

class _PersegiState extends State<Persegi> {
  late double sisi1 = 0;
  late double sisi2 = 0;
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
                    sisi1 = double.parse(value);
                  },
                  decoration: const InputDecoration(labelText: "Sisi 1"),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
              ),
              Container(
                width: 200,
                child: TextFormField(
                  onChanged: (value) {
                    sisi2 = double.parse(value);
                  },
                  decoration: const InputDecoration(labelText: "Sisi 2"),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      luas = 0;
                      keliling = 0;

                      keliling = 2 * (sisi1 + sisi2);
                      luas = sisi1 * sisi2;
                    });
                  },
                  child: const Text("Hitung")),
              const SizedBox(
                height: 30,
              ),
              Text("Luas : $luas"),
              Text("Keliling : $keliling"),
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
