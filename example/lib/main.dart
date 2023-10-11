import 'package:flutter/material.dart';
import 'package:gapplus/gapplus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gap Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

/// A widget.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({
   super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
             Gapplus.expand(20, color: Colors.red),
             Gapplus(80),
             Gapplus.expand(20, color: Colors.red),
             MaxGap(2000),
             Gapplus.expand(20, color: Colors.red),
            Row(
              children:  <Widget>[
                Gapplus(20, color: Colors.green, crossAxisExtent: 20),
                Gapplus(50),
                Gapplus(20, color: Colors.green, crossAxisExtent: 20),
              ],
            ),
             Gapplus.expand(200, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
