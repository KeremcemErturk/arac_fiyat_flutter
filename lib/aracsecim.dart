import 'package:arac_fiyat_flutter/binekarac.dart';
import 'package:arac_fiyat_flutter/ticariarac.dart';
import 'package:flutter/material.dart';

class AracSecim extends StatefulWidget {
  const AracSecim({super.key});

  @override
  State<AracSecim> createState() => _AracSecim();
}

class _AracSecim extends State<AracSecim> {
  String? aracTipi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Araç Seçim", style: TextStyle(fontSize: 20),),
            RadioListTile(title: const Text("Binek"),value: "binek", groupValue: aracTipi, onChanged: (value) {
              setState(() {
                aracTipi = value.toString();
              });
            }),
            RadioListTile(title: const Text("Ticari"),value: "ticari", groupValue: aracTipi, onChanged: (value) {
              setState(() {
                aracTipi = value.toString();
              });
            }),
            ElevatedButton(onPressed: () {
              if(aracTipi == "ticari") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TicariArac()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BinekArac()));
              }
            }, child: const Text("Devam")),
            const Image(image: AssetImage("images/say.gif")),
          ],
        ),
      )
    );
  }
}