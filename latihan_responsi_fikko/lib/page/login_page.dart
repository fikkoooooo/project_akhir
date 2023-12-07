import 'package:flutter/material.dart';
import 'package:latihan_responsi_fikko/form/my_button.dart';
import 'package:latihan_responsi_fikko/form/my_textfield.dart';
import 'package:latihan_responsi_fikko/form/square_tile.dart';
import 'package:latihan_responsi_fikko/form/my_home.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoginSuccess = true;

  void signUserIn(BuildContext context) {
    // Mengambil nilai dari controller
    final username = usernameController.text;
    final password = passwordController.text;

    // username dan passowrd statis
    final validUsername = 'a';
    final validPassword = 'a';


    if (username == validUsername && password == validPassword) {
      // jika login berhasil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => homepage(),
        ),
      );
    } else {
      // Pesan jika login gagal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau Password salah.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[300],
      body: SafeArea(
        child: ListView(padding: EdgeInsets.all(16.0), children: [
          //logo
          Image.asset(
            'assets/logo.png',
            width: 140,
            height: 140,
          ),

          const SizedBox(height: 25),

          //selamat datang
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome in FikkoOLshop',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 25),

          //username
          MyTextField(
            controller: usernameController,
            hintText: 'Nama pengguna',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          //password
          MyTextField(
            controller: passwordController,
            hintText: 'Kata sandi',
            obscureText: true,
          ),
          const SizedBox(height: 10),

          //lupa password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Lupa kata sandi?'),
              ],
            ),
          ),
          const SizedBox(height: 25),
          //daftar
          MyButton(
            onTap: () => signUserIn(context),
          ),
          const SizedBox(height: 25),

          //login with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Masuk menggunakan',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10),
          //google or apple
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'assets/google.png'),
              const SizedBox(height: 50),
              SquareTile(imagePath: 'assets/apple.png'),
            ],
          ),
          const SizedBox(height: 20),
          //register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Belum punya akun?'),
              const SizedBox(width: 5),
              Text(
                'Daftar disini',
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ),
    );
  }
}