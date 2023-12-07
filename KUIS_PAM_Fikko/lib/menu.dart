import 'package:flutter/material.dart';
import 'package:kuis_pam_fikko/Perhitungan/bentuk.dart';
import 'package:kuis_pam_fikko/Perhitungan/lingkaran.dart';
import 'package:kuis_pam_fikko/Perhitungan/persegi.dart';
import 'package:kuis_pam_fikko/Perhitungan/segitiga.dart';
import 'package:kuis_pam_fikko/Perhitungan/trapesium.dart';

class BangunRuang extends StatelessWidget {
  const BangunRuang({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(children: [
          MenuCard(
            bangunRuang: Trapesium(
                name: "Trapesium",
                image:
                "assets/trapesium.png"),
          ),
          MenuCard(
              bangunRuang: Segitiga(
                name: "Segitiga",
                image:
                "assets/segitiga.png",
              )),
          MenuCard(
            bangunRuang: Lingkaran(
                name: "Trapesium",
                image:
                "assets/lingkaran.png",
                ),
          ),
          MenuCard(
              bangunRuang: Persegi(
                  name: "Persegi Panjang",
                  image:
                  "assets/persegi.png",
                  ))
        ]),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.bangunRuang});
  final Bentuk bangunRuang;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return bangunRuang;
        }));
      },
      child: Card(
        child: Column(children: [
          SizedBox(
              height: 200, width: 200, child: Image.network(bangunRuang.image)),
          Text(bangunRuang.name)
        ]),
      ),
    );
  }
}
