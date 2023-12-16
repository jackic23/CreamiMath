import 'package:flutter/material.dart';

void main() {
  runApp(const CreamiMath());
}

class CreamiMath extends StatelessWidget {
  const CreamiMath({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CreamiMath',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CreamiMath App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  double _totalFat = 0;
  double _totalCups = 0;

  double _fatHCream = 0.35;
  double _cupsHCream = 0;
  double _fatHalfAndHalf = 0.1;
  double _cupsHalfAndHalf = 0;
  double _fatMilk = 0.02;
  double _cupsMilk = 0.35;
  double _fatFlavour = 0;
  double _cupsFlavour = 0;

  void updateTotal() {
    _totalCups = _cupsHCream + _cupsHalfAndHalf + _cupsMilk + _cupsFlavour;
    _totalFat = (_fatHCream * _cupsHCream +
        _fatHalfAndHalf * _cupsHalfAndHalf +
        _fatMilk * _cupsMilk +
        _fatFlavour * _cupsFlavour) * 100 /
            (_cupsHCream + _cupsHalfAndHalf + _cupsMilk + _cupsFlavour);
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Total Fat (%)',
            ),
            Text(
              _totalFat.roundToDouble().toString(),
              style: TextStyle(
                color: _totalFat >= 8 && _totalFat <= 14
                    ? Colors.green : Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,                
              ),
            ),
            const Text(
              'Total Volume',
            ),
            Text(
              '$_totalCups',
              style: TextStyle(
                color: _totalCups >= 2 && _totalCups <= 2.5
                    ? Colors.green : Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,            
              ),
            ),
            const Text(
              'Heavy Cream (cups)',
            ),
            Text(
              '$_cupsHCream',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              value: _cupsHCream,
              min: 0.0,
              max: 2.0,
              divisions: 8,
              label: _cupsHCream.toString(),
              onChanged: (value) {
                setState(() {
                  _cupsHCream = value;
                  updateTotal();
                });
              },
            ),
            const Text(
              'Half and Half (cups)',
            ),
            Text(
              '$_cupsHalfAndHalf',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              value: _cupsHalfAndHalf,
              min: 0.0,
              max: 2.0,
              divisions: 8,
              label: _cupsHalfAndHalf.toString(),
              onChanged: (value) {
                setState(() {
                  _cupsHalfAndHalf = value;
                  updateTotal();
                });
              },
            ),
            const Text(
              'Milk (cups)',
            ),
            Text(
              '$_cupsMilk',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              value: _cupsMilk,
              min: 0.0,
              max: 2.0,
              divisions: 8,
              label: _cupsMilk.toString(),
              onChanged: (value) {
                setState(() {
                  _cupsMilk = value;
                  updateTotal();
                });
              },
            ),
            const Text(
              'Flavour Fat (%)',
            ),
            Text(
              (_fatFlavour * 100).round().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              value: _fatFlavour,
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: (_fatFlavour * 100).round().toString(),
              onChanged: (value) {
                setState(() {
                  _fatFlavour = value;
                  updateTotal();
                });
              },
            ),
            const Text(
              'Flavour (cups)',
            ),
            Text(
              '$_cupsFlavour',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              value: _cupsFlavour,
              min: 0.0,
              max: 2.0,
              divisions: 8,
              label: _cupsFlavour.toString(),
              onChanged: (value) {
                setState(() {
                  _cupsFlavour = value;
                  updateTotal();
                });
              },
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
