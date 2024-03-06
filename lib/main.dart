import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// TODO: User can copy the resulting CSS to the clipboard

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BorderRadius 미리보기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Border Radius Previewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double topLeftRadius = 0.0;
  double topRightRadius = 0.0;
  double bottomLeftRadius = 0.0;
  double bottomRightRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double mediaHeight = MediaQuery.of(context).size.height / 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: mediaHeight,
                height: mediaHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeftRadius),
                    topRight: Radius.circular(topRightRadius),
                    bottomLeft: Radius.circular(bottomLeftRadius),
                    bottomRight: Radius.circular(bottomRightRadius),
                  ),
                  color: colorScheme.primary,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'topLeftRadius'),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) topLeftRadius = double.parse(value);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'topRightRadius'),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) topRightRadius = double.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'bottomLeftRadius'),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null)
                          bottomLeftRadius = double.parse(value);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'bottomRightRadius'),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null)
                          bottomRightRadius = double.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
