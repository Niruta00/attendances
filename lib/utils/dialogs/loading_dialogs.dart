import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 40.0,
          itemCount: 7,
        ),
      );
    },
  );
}
