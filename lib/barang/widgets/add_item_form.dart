import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventori/barang/utils/database.dart';
import 'package:inventori/kategori/utils/database.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode namaBarangFocusNode;
  final FocusNode jumlahBarangFocusNode;
  final FocusNode kondisiFocusNode;
  final FocusNode kategoriFocusNode;

  const AddItemForm({
    this.kodeFocusNode,
    this.namaBarangFocusNode,
    this.jumlahBarangFocusNode,
    this.kondisiFocusNode,
    this.kategoriFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _jumlahBarangController = TextEditingController();
  final TextEditingController _kondisiController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  String dropdownValue = '-';
  bool status = false;
  var selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),

                // Kode Kategori
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Barang',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _namaBarangController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _jumlahBarangController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Barang',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kondisiController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kondisi Barang',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String newValue) {
                //     setState(() {
                //       dropdownValue = newValue;
                //       status = true;
                //     });
                //   },
                //   items: <String>['-', 'Baru', 'Perlu Perbaikan', 'Rusak']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: DatabaseKategori.readItems(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          const Text("Loading.....");
                        else {
                          List<DropdownMenuItem> currencyItems = [];
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            var snap = snapshot.data.docs[i].data();
                            String nama = snap['kategori'];
                            currencyItems.add(
                              DropdownMenuItem(
                                child: Text(
                                  nama,
                                  style: TextStyle(color: Colors.black45),
                                ),
                                value: "${nama}",
                              ),
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 50.0),
                              DropdownButton(
                                items: currencyItems,
                                onChanged: (currencyValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Currency value is $currencyValue',
                                      style:
                                          TextStyle(color: Colors.black45),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCurrency = currencyValue;
                                  });
                                },
                                value: selectedCurrency,
                                isExpanded: false,
                                hint: new Text(
                                  "Choose Currency Type",
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                      // valueColor: AlwaysStoppedAnimation<Color>(
                      //   //CustomColors.firebaseOrange,
                      // ),
                      ),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.teal[600],
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () async {
                      widget.kodeFocusNode.unfocus();
                      widget.namaBarangFocusNode.unfocus();
                      widget.jumlahBarangFocusNode.unfocus();
                      widget.kondisiFocusNode.unfocus();
                      widget.kategoriFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          kode: _kodeController.text,
                          namaBarang: _namaBarangController.text,
                          jumlahBarang: int.parse(_jumlahBarangController.text),
                          kondisi: _kondisiController.text,
                          kategori: selectedCurrency,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 16, right: 16),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
