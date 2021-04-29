import 'package:flutter/material.dart';
import 'package:alisveris_liste/HTTP/Urun_Servis.dart';
import 'package:alisveris_liste/item.dart';

class AlisverisListesiUrunSayfasi extends StatefulWidget {
  @override
  _AlisverisListesiUrunSayfasiState createState() => _AlisverisListesiUrunSayfasiState();
}

class _AlisverisListesiUrunSayfasiState extends State<AlisverisListesiUrunSayfasi> {
  @override
  UrunServis _itemService;

  void initState(){
    _itemService=UrunServis();
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _itemService.fetchItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot){
        if(snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Item item = snapshot.data[index];

              return ListTile(title: Text(item.name),);
            },);
        }
        if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },);
  }
}
