import 'package:flutter/material.dart';
import 'package:modul_6/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  void initState(){
    super.initState();
    check_if_allready_login();
  }

  void check_if_allready_login() async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool("login")??true);
    print(newuser);
    if(newuser == false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return Page1();
      }));
    }
  }

  @override
  void dispose(){
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(label: Text('Username')),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(label: Text('Password')),
            ),

            SizedBox(height: 30,),

            OutlinedButton(onPressed: (){
              String username = _username.text;
              String password = _password.text;

              if (username == "a" && password == "a" ){
                logindata.setBool("login", false);
                logindata.setString('username', username);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Page1() ;
                }));
              }
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}