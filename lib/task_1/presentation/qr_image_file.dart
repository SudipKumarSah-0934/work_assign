import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImage extends StatelessWidget {
  final generatedLink;
  const QrImage(this.generatedLink, {super.key});

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: generatedLink,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
