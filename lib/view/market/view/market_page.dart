import 'package:flutter/material.dart';

import '../../converter/widget/buildAppBar.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Center(child: Text("Market Page")),
      ),
    );
  }
}
