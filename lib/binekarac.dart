import 'package:flutter/material.dart';
import 'package:arac_fiyat_flutter/fiyat.dart';
import 'main.dart';

class BinekArac extends StatefulWidget {
  const BinekArac({super.key});

  @override
  State<BinekArac> createState() => _BinekAracState();
}

class _BinekAracState extends State<BinekArac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BinekAraç")),
      body: ListView.builder(
        itemCount: binekAracListesi.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Faiz(secilenArac: binekAracListesi[index])));
            },
            child: Card(
              child: ListTile(
                title: Text(binekAracListesi[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}