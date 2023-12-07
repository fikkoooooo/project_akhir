import 'package:flutter/material.dart';
import 'package:stopwatch_mobile/form/my_home.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopwatchScreen(),
    );
  }
}

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  List<String> _laps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => homepage(),
              ),
            );
          },
        ),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
                ':' +
                (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
                ':' +
                (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
                '.' +
                (_stopwatch.elapsedMilliseconds % 1000).toString().padLeft(3, '0'),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _isRunning ? null : start,
                child: Text('Start'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning ? pause : null,
                child: Text('Pause'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: reset,
                child: Text('Reset'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning ? lap : null,
                child: Text('Lap'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _laps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Lap ${index + 1}'),
                  subtitle: Text(_laps[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void start() {
    setState(() {
      _isRunning = true;
    });
    _stopwatch.start();
    _startTimer();
  }

  void pause() {
    setState(() {
      _isRunning = false;
    });
    _stopwatch.stop();
  }

  void reset() {
    setState(() {
      _isRunning = false;
      _stopwatch.reset();
      _laps.clear();
    });
  }

  void lap() {
    setState(() {
      _laps.insert(
        0,
        _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
            '.' +
            (_stopwatch.elapsedMilliseconds % 1000).toString().padLeft(3, '0'),
      );
    });
  }

  void _startTimer() {
    if (_isRunning) {
      Future.delayed(Duration(milliseconds: 1), () {
        if (_isRunning) {
          setState(() {});
          _startTimer();
        }
      });
    }
  }
}
