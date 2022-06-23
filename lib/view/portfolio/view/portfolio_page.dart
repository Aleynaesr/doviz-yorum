import 'package:flutter/material.dart';

import '../../converter/widget/buildAppBar.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: const Center(child: Text("Portfolio Page")),
      ),
    );
  }
}
