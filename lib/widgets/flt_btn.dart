import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:upc_tour/models/lugar.dart';

class FltBtn extends StatelessWidget {
  const FltBtn({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromRGBO(106, 12, 70, 1),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3D8BEF", "Cancelar", false, ScanMode.QR);
        //print(barcodeScanRes);

        for (var element in places) {
          if (barcodeScanRes == element.plId) {
            //print(element.plId);
            Future.microtask(() => Navigator.pushNamed(
                context, 'details_screen',
                arguments: element));

            break;
          } else {
            //print("Did not make it");
          }
        }
      },
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
