import 'package:flutter/material.dart';
import 'package:modul_6/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState(){
    super.initState();
    initial();
  }

  void initial() async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString("username")!;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Utama"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome $username",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(onPressed: (){
            logindata.setBool("login", true);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
            {
              return LoginPage();
            }));
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
