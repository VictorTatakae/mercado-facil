import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends ChangeNotifier {
  BuildContext? _context;

  void show(BuildContext context) {
    _context = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.65),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: LoadingAnimationWidget.bouncingBall(
                color: Colors.white,
                size: 75,
              ),
            ),
          ),
        );
      },
    );
    notifyListeners();
  }

  void hide() {
    if (_context != null) {
      Navigator.of(_context!).pop();
      _context = null;
      notifyListeners();
    }
  }
}
