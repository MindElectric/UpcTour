import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:upc_tour/services/lugares_service.dart';

import '../widgets/flt_btn.dart';
import '../widgets/slides.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeService = Provider.of<LugaresService>(context);
    //print(placeService.places);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear QR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "BIENVENIDOS A LA UPC",
                style: GoogleFonts.merriweather(
                    fontSize: 28,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Slides(),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    "Valores Institucionales",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "1. Lealtad \n"
                    "2. Equidad \n"
                    "3. Responsabilidad \n"
                    "4. Respeto \n"
                    "5. Honestidad \n"
                    "6. Libertad \n"
                    "7. Compromiso \n"
                    "8. Creatividad \n"
                    "9. Solidaridad \n"
                    "10. Tolerancia \n"
                    "11. Empatía",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text("Escanea los QR para saber más"),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      floatingActionButton: FltBtn(
        places: placeService.places,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
