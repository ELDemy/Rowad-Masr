import 'package:flutter/material.dart';
import 'package:flutter_basics/session_1/widgets/highlighted_container.dart';
import 'package:flutter_basics/session_1/widgets/numbered_container.dart';

class View2 extends StatelessWidget {
  const View2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEE534F),
      appBar: AppBar(
        title: const Text("I'm an App"),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xFFE43935),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row1(),
            Row2_3(),
            SizedBox(
              height: 100,
              child: Row2_3(crossAxisAlignment: CrossAxisAlignment.stretch),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NumberedContainer("1"),
                  NumberedContainer("2"),
                  NumberedContainer("3"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Row2_3 extends StatelessWidget {
  const Row2_3({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: const [
        NumberedContainer("1"),
        Expanded(
          child: NumberedContainer("2", color: Colors.green),
        ),
        NumberedContainer("3"),
      ],
    );
  }
}

class Row1 extends StatelessWidget {
  const Row1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            NumberedContainer("1"),
            NumberedContainer("2"),
            NumberedContainer("3"),
          ],
        ),
        HighlightedContainer(
          width: 95,
          height: 105,
        ),
      ],
    );
  }
}
