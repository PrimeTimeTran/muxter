import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

prompt(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      duration: const Duration(seconds: 3),
      content: Text(text),
    ),
  );
}

promptWithUndo(
  context,
  text,
  undo,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      showCloseIcon: true,
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          undo();
        },
      ),
    ),
  );
}

Future<String> readJson(file) async {
  final String response = await rootBundle.loadString(file);
  return response;
}
