import 'package:flutter/material.dart';

import 'device_info.dart';

class OverlayService {
  static showPopup(
    BuildContext context, {
    Widget? child,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            width: Device.width,
            height: Device.height,
            child: child,
          ),
        );
      },
    );
  }

  static void showDialogResponsive(
    BuildContext context, {
    Widget? child,
    Color? backgroundColor,
    Duration? transitionDuration,
    Color? containerColor,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, _, __) {
          return SingleChildScrollView(
              child: Dialog(
            backgroundColor: Colors.transparent,
            child: child,
          ));
        },
      ),
    );
  }

  static showDialogInsert(BuildContext context, Widget widget) {
    OverlayService.showDialogResponsive(
      context,
      transitionDuration: const Duration(milliseconds: 500),
      child: SizedBox(
        width: Device.width,
        child: widget,
      ),
    );
  }

  static void messageIntoSnackBar(BuildContext context, String message,
      {Duration? duration, Color? color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color ?? const Color(0xff354b8a),
      duration: duration ?? const Duration(seconds: 2),
    ));
  }
}
