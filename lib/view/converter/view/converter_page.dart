import 'package:flutter/material.dart';

import '../widget/buildAppBar.dart';
import '../widget/buildConverter.dart';
import '../widget/buildTop.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: GestureDetector(
            // Hide keyboard after clicking outside
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: const [BuildTop(), BuildConverter()],
            ),
          ),
        ),
      ),
    );
  }
}
