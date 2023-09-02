import 'package:flutter/material.dart';
import 'package:arac_fiyat_flutter/fiyat.dart';
import 'main.dart';

class TicariArac extends StatefulWidget {
  const TicariArac({super.key});

  @override
  State<TicariArac> createState() => _TicariAracState();
}

class _TicariAracState extends State<TicariArac> {
  bool isFord = true;
  String dropdownValue = "Ford";

  var items = [
    "Renault",
    "Ford",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Ticari Araç")),
      body: Column(
        children: [
          const Text("Marka Seçimi"),
          Image(image: AssetImage(isFord? "images/hu.gif" : "images/hypno.gif")),
          Expanded(
              flex: 1,
              child: DropdownButton(
                hint: Text(dropdownValue),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

            onChanged: (String? newValue) {
                  if(newValue == "Ford") {
                    isFord  = true;
                  } else {
                    isFord = false;
                  }
              setState(() {
                dropdownValue = newValue!;
              });
            },
          )),
          Expanded(
            flex: 7,
          child: ListView.builder(
            itemCount: isFord? fordTicariAracListesi.length : renaultTicariAracListesi.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Faiz(secilenArac: isFord? fordTicariAracListesi[index] : renaultTicariAracListesi[index])));
                },
                child: Card(
                  child: ListTile(
                    title: Text(isFord? fordTicariAracListesi[index] : renaultTicariAracListesi[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ]
      ),
    );
  }
}