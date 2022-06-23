import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
      child: Image.network(dovizYorumLogo),
    ),
    title: const Text("Döviz Yorum"),
    actions: [
      IconTheme(
          data: Theme.of(context).copyWith().iconTheme,
          child:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
    ],
  );
}
