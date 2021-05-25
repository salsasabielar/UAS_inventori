import 'package:flutter/material.dart';
import 'model/kategori.dart';

class EntryFormKategori extends StatefulWidget {
  final Kategori kategori;
  EntryFormKategori(this.kategori);

  @override
  EntryFormKategoriState createState() => EntryFormKategoriState(this.kategori);
}

//class controller
class EntryFormKategoriState extends State<EntryFormKategori> {
  Kategori kategori;
  EntryFormKategoriState(this.kategori);
  TextEditingController nameController = TextEditingController();
  TextEditingController kodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (kategori != null) {
      nameController.text = kategori.name;
      kodeController.text = kategori.kode;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: kategori == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // Kode Barang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (kategori == null) {
                            // tambah data
                            kategori = Kategori(
                                nameController.text, kodeController.text);
                          } else {
                            // ubah data
                            kategori.name = nameController.text;
                            kategori.kode = kodeController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek kategori
                          Navigator.pop(context, kategori);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
