import 'package:flutter/material.dart';
import 'package:random_picker/setting.dart';
import 'package:spinner/spinner.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const int NUM_ELEMENTS = 50;
  static const int ON_SCREEN = 10;
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:
      Container(
      child: new Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
                children: [
                  Builder(
                      builder: (ctx) {
                        var height = MediaQuery.of(ctx).size.height;
                        var width = MediaQuery.of(ctx).size.width;
                        return Spinner(
                            containerCount: ON_SCREEN,
                            containerSize: height / ON_SCREEN,
                            animationSpeed: (30+random.nextInt(100)),
                            zoomFactor: 1.5,
                            builder: (index) {
                              // var color =
                              //     (cos((2 * pi) * index / NUM_ELEMENTS) + 1) / 2 * 255;
                              return Container(
                                height: height / ON_SCREEN,
                                // color: Color.fromARGB(255, 0, 0, color.floor()),
                                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                child: Center(
                                    child: Text(
                                      "Container #${index % NUM_ELEMENTS}",
                                      style: TextStyle(
                                          fontSize: height / ON_SCREEN * 0.4,
                                          color: Colors.white),
                                    )),
                              );
                            },
                            spinDirection: SpinnerDirection.down,
                            duration: Duration(seconds: 5)
                        );
                      }
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_right_sharp,
                        size: 100.0,
                      )
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_left_sharp,
                        size: 100.0,
                      )
                  ),
                ]
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, double.infinity),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.settings,
                        size: 80,
                      ),
                      label: Text(''),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingRoute()),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, double.infinity),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => MyApp(),
                          ),
                        );
                      },
                      child: Text(
                        'Spin',
                        textScaleFactor: 5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, double.infinity),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.refresh,
                        size: 80,
                      ),
                      label: Text(''),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),
                  ),
                ]
            ),
          ),
        ]
      ),
      ),
    );
  }
}

