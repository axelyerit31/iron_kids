import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'D Large',
                style: Theme.of(context).textTheme.displayLarge
              ),
              Text(
                'D Medium',
                style: Theme.of(context).textTheme.displayMedium
              ),
              Text(
                'D Small',
                style: Theme.of(context).textTheme.displaySmall
              ),
              Text(
                'H Large',
                style: Theme.of(context).textTheme.headlineLarge
              ),
              Text(
                'H Medium',
                style: Theme.of(context).textTheme.headlineMedium
              ),
              Text(
                'H Small',
                style: Theme.of(context).textTheme.headlineSmall
              ),
              Text(
                'T Large',
                style: Theme.of(context).textTheme.titleLarge
              ),
              Text(
                'T Medium',
                style: Theme.of(context).textTheme.titleMedium
              ),
              Text(
                'T Small',
                style: Theme.of(context).textTheme.titleSmall
              ),
              Text(
                'L Large',
                style: Theme.of(context).textTheme.labelLarge
              ),
              Text(
                'L Medium',
                style: Theme.of(context).textTheme.labelMedium
              ),
              Text(
                'L Small',
                style: Theme.of(context).textTheme.labelSmall
              ),
              Text(
                'B Large',
                style: Theme.of(context).textTheme.bodyLarge
              ),
              Text(
                'B Medium',
                style: Theme.of(context).textTheme.bodyMedium
              ),
              const Text(
                'Regular',
              ),
              Text(
                'B Small',
                style: Theme.of(context).textTheme.bodySmall
              ),
            ],
          ),
        ),
      ),
    );
  }
}
