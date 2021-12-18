import 'package:flutter/material.dart';
import 'package:india_today/widgets/my_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class AstroScreen extends StatefulWidget {
  const AstroScreen({Key? key}) : super(key: key);

  @override
  _AstroScreenState createState() => _AstroScreenState();
}

class _AstroScreenState extends State<AstroScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Talk to an Astrologer",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
