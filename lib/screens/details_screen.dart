import 'package:flutter/material.dart';
import 'package:upc_tour/models/lugar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Place place = ModalRoute.of(context)!.settings.arguments as Place;
    //final LugaresService place = ModalRoute.of(context)!.settings.arguments as LugaresService;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            //Background
            _Background(place),
            _TextDetails(
              place: place,
            ),
            _CircleEmblem(
              place: place,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 300,
                  child: Center(
                    child: FadeInImage(
                      placeholder: const AssetImage("assets/White_box.png"),
                      image: NetworkImage(place.map),
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.map_outlined),
        ));
  }
}

class _CircleEmblem extends StatelessWidget {
  const _CircleEmblem({
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.65,
        left: -220,
        child: Container(
          height: 320,
          width: 320,
          margin: const EdgeInsets.all(100.0),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(196, 81, 99, 1), shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Emblema: ",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(place.altId,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _TextDetails extends StatelessWidget {
  const _TextDetails({
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 20, color: Colors.white);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text(
              place.nombre,
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          _PlaceDetails(textStyle: textStyle, place: place),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          // FadeInImage(
          //   placeholder: AssetImage("assets/blackScreen.png"),
          //   image: NetworkImage(place.map),
          //   height: 200,
          // )
        ],
      ),
    );
  }
}

class _PlaceDetails extends StatelessWidget {
  const _PlaceDetails({
    required this.textStyle,
    required this.place,
  });

  final TextStyle textStyle;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 50),
      height: 200,
      width: 220,
      //color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalles:",
              style: textStyle,
            ),
            Text(
              place.detalles,
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ubicación: ",
              style: textStyle,
            ),
            Text(
              place.ubicacion,
              style: textStyle,
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background(this.place);
  final Place place;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        //color: Colors.red,
        child: FadeInImage(
          placeholder: const AssetImage("assets/blackScreen.png"),
          image: NetworkImage(place.foto),
          fit: BoxFit.cover,
        ),
      ),
      _Shaders(size: size),

      //_Shades(size: size)
    ]);
  }
}

class _Shaders extends StatelessWidget {
  const _Shaders({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.9,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.black87, Colors.black12])),
        ),
        Container(
          //height: size.height * 0.9,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [Colors.black45, Colors.black12])),
        ),
      ],
    );
  }
}
