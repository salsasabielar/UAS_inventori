import 'package:flutter/material.dart';

class FormBarang extends StatefulWidget {
  // final Item item;
  // EntryForm(this.item);

  @override
  FormBarangState createState() => FormBarangState();
}

//class controller
class FormBarangState extends State<FormBarang> {
  //Item item;
  //EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController kodeController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // //kondisi
    // if (item != null) {
    //   kodeController.text = item.kode;
    //   rasController.text = item.ras;
    //   nameController.text = item.name;
    //   jenisKelaminController.text = item.jenisKelamin;
    // }
    //rubah
    return Scaffold(
        appBar: AppBar(
          // title: item == null ? Text('Tambah') : Text('Ubah'),
          // leading: Icon(Icons.keyboard_arrow_left),
          title: Text('Barang'),
          backgroundColor: Colors.teal[600],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal[600], Colors.teal[200]],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // Kode
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

                // nama
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Barang',
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
                          color: Colors.teal[600],
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            // if (item == null) {
                            //   // tambah data
                            //   item = Item(
                            //       kodeController.text,
                            //       rasController.text,
                            //       nameController.text,
                            //       jenisKelaminController.text);
                            // } else {
                            //   // ubah data
                            //   item.kode = kodeController.text;
                            //   item.ras = rasController.text;
                            //   item.name = nameController.text;
                            //   item.jenisKelamin = jenisKelaminController.text;
                            // }
                            // kembali ke layar sebelumnya dengan membawa objek item
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      // tombol batal
                      Expanded(
                        child: RaisedButton(
                          color: Colors.teal[600],
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
          ),
        ));
  }
}
