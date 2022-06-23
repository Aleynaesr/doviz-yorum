import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class BuildTop extends StatefulWidget {
  const BuildTop({Key? key}) : super(key: key);

  @override
  State<BuildTop> createState() => _BuildTopState();
}

class _BuildTopState extends State<BuildTop> {
  String? selected = "alış";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 25, top: 35),
      child: Row(children: [
        Radio(
            value: "alış",
            groupValue: selected,
            activeColor: orange,
            onChanged: (value) {
              setState(() {
                selected = value.toString();
              });
            }),
        const Text(
          'Alış',
        ),
        const SizedBox(
          width: 25,
        ),
        Radio(
            value: "satış",
            groupValue: selected,
            activeColor: orange,
            onChanged: (value) {
              setState(() {
                selected = value.toString();
              });
            }),
        const Text(
          'Satış',
        ),
      ]),
    );
  }
}
