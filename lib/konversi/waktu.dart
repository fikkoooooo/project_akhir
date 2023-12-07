import 'package:flutter/material.dart';

const accessoriesColor = Color(0xffeab56f);

class TimeConversionPage extends StatefulWidget {
  const TimeConversionPage({Key? key}) : super(key: key);
  @override
  _TimeConversionPageState createState() => _TimeConversionPageState();
}

class _TimeConversionPageState extends State<TimeConversionPage> {
  DateTime _currentTime = DateTime.now();
  String _formatTime(DateTime time, String timeZone) {
    return "${time.toLocal()} ($timeZone)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "KONVERSI WAKTU",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waktu Sekarang:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'WIB: ${_formatTime(_currentTime, 'WIB')}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'WITA: ${_formatTime(_currentTime, 'WITA')}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'WIT: ${_formatTime(_currentTime, 'WIT')}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'London GMT:\n${_formatTime(_currentTime.toUtc(), 'London GMT')}',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentTime = DateTime.now();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: accessoriesColor,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Refresh Waktu'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TimeConversionPage(),
    ),
  );
}
