import 'dart:math';
import 'package:flutter/material.dart';

double sliderDegeri = 30;
double fiyat = 0;
double faiz = 0;
double kalan = 0;
double aylikTaksit = 0;
double sonuc = 0;

TextEditingController pesinat = TextEditingController();

// ignore: must_be_immutable
class Faiz extends StatefulWidget {
  Faiz({super.key, required this.secilenArac});

  String secilenArac = "";

  @override
  State<Faiz> createState() => _FaizState();
}

class _FaizState extends State<Faiz> {

  @override
  void initState() {
    super.initState();
    fiyat = Random().nextInt(400000) + (800000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Fiyat")),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            ListTile(
                title: Text( "Araç : ${widget.secilenArac}"),
                trailing: Text("${fiyat.toStringAsFixed(0)} TL")
            ),
            TextField(
              controller: pesinat,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Peşinat"),
            ),
            ListTile(
                title: const Text("Kalan"),
                trailing: Text("${kalan.toStringAsFixed(0)} TL")
            ),
            const Text("Vade Seçimi"),
            Text("${sliderDegeri.toStringAsFixed(0)} Ay"),
            Slider(divisions: 30,min: 0,max: 30,value: sliderDegeri, onChanged: (value) {
              sliderDegeri = value;
              setState(() {

              });
            }),
            const Text("Aylık tam tamina %3 (üc) faiz uygulanir"),
            const SizedBox( height: 40),
            ElevatedButton(onPressed: () {
              if(int.parse(pesinat.text) >= ((fiyat/100)/12)) {
                kalan = fiyat - int.parse(pesinat.text);

                aylikTaksit = ((kalan / 100) * 3);

                faiz = sliderDegeri * aylikTaksit;

                sonuc = kalan + faiz;
                setState(() {

                });

                showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sonuclar'),
                      content:  SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Peşinat : ${pesinat.text} TL'),
                            Text("Kalan : ${kalan.toStringAsFixed(0)} TL"),
                            Text('Vade : ${sliderDegeri.toStringAsFixed(0)} Ay'),
                            Text("Aylık Taksit : ${aylikTaksit.toStringAsFixed(0)} TL"),
                            Text('Toplam Tutar : ${sonuc.toStringAsFixed(0)} TL'),
                            const Image(image: AssetImage("images/dance.gif"))
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Tamamdir'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Peşinat Fiyatın %12sinden Büyük Yada Eşit Olmalıdır",style: TextStyle(color: Colors.red),)));
              }
            },
                child: const Text("Devam")),
            const Image(image: AssetImage("images/spin.gif"))
          ],
        ));
  }
}