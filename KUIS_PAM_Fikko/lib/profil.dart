import 'package:flutter/material.dart';

class profil extends StatelessWidget {

  final List<Map<String, String>> profiles = [
    {
      'name': 'Fikko Rafirs Yanuar',
      'nim': '124210040',
      'image': 'assets/fikko.png',
      'tempat': 'Cilacap, 06 Mei 2002',
      'hobi': 'Bernyanyi dan Memasak',
      'description':
      'Saya adalah seorang mahasiswa di UPN "Veteran" Yogyakarta. Berdiam diri sangatlah tidak efektif, sehingga saya selalu mencari kegiatan yang memiliki benefit. Mendapatkan hubungandan bersosialisasi dengan baik adalah hal utama yang saya cari. Kekuatan saya terletak padadiri saya sendiri yaitu konsisten dengan tujuan serta eksekusi kegiatan dengan baik.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileCard(profile: profiles[index]);
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Image.asset(
            profile['image']!,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  profile['name']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profile['nim']!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  profile['tempat']!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  profile['hobi']!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  profile['description']!,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
