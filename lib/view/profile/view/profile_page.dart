import 'package:flutter/material.dart';

import '../../converter/widget/buildAppBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: const Center(child: Text("Profile Page")),
      ),
    );
  }
}
