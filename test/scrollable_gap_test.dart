import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gapplus/gapplus.dart';

void main() {
  testWidgets('Gap inside horizontal ListView', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                Gapplus(100),
              ],
            ),
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gapplus));
    expect(box.size.width, 100);
    expect(box.size.height, 200);
  });

  testWidgets('Gap inside vertical ListView', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 200,
            child: ListView(
              children: const <Widget>[
                Gapplus(100),
              ],
            ),
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gapplus));
    expect(box.size.width, 200);
    expect(box.size.height, 100);
  });

  testWidgets('Gap with crossAxisExtent inside ListView',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 200,
            child: ListView(
              children: const <Widget>[
                Gapplus(100, crossAxisExtent: 20),
              ],
            ),
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gapplus));
    expect(box.size.width, 200);
    expect(box.size.height, 100);
  });

  testWidgets('Gap inside a Row inside a SingleChildScrollView',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 200,
            child: SingleChildScrollView(
                child: Row(
              children: <Widget>[
                Gapplus(100),
              ],
            )),
          ),
        ),
      ),
    );
  });

  testWidgets('Gap inside a SingleChildScrollView inside a Row',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 500,
            child: Row(
              children: [
                Container(width: 100),
                const SingleChildScrollView(
                  child: Gapplus(100),
                ),
                Container(width: 100),
              ],
            ),
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gapplus));
    expect(box.size.height, 100);
    expect(box.size.width, 0);
  });
}
