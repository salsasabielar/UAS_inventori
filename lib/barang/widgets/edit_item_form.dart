import 'package:flutter/material.dart';
import 'package:inventori/barang/utils/database.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode namaBarangFocusNode;
  final FocusNode jumlahBarangFocusNode;
  final FocusNode kondisiFocusNode;
  final FocusNode kategoriFocusNode;
  final String currentKode;
  final String currentNamaBarang;
  final int currentJumlahBarang;
  final String currentKondisi;
  final String currentKategori;
  final String documentId;

  const EditItemForm({
    this.kodeFocusNode,
    this.namaBarangFocusNode,
    this.jumlahBarangFocusNode,
    this.kondisiFocusNode,
    this.kategoriFocusNode,
    this.currentKode,
    this.currentNamaBarang,
    this.currentJumlahBarang,
    this.currentKondisi,
    this.currentKategori,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _kodeController;
  TextEditingController _namaBarangController;
  TextEditingController _jumlahBarangController;
  TextEditingController _kondisiController;
  TextEditingController _kategoriController;

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode,
    );
    _namaBarangController = TextEditingController(
      text: widget.currentNamaBarang,
    );
    _jumlahBarangController = TextEditingController(
      text: widget.currentJumlahBarang.toString(),
    );
    _kondisiController = TextEditingController(
      text: widget.currentKondisi,
    );
    _kategoriController = TextEditingController(
      text: widget.currentKategori,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Barang',
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
                    controller: _namaBarangController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
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
                    controller: _kategoriController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kategori Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                      // valueColor: AlwaysStoppedAnimation<Color>(
                      //   CustomColors.firebaseOrange,
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

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
                          namaBarang: _namaBarangController.text,
                          jumlahBarang: int.parse(_jumlahBarangController.text),
                          kondisi: _kondisiController.text,
                          kategori: _kategoriController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //color: CustomColors.firebaseGrey,
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
