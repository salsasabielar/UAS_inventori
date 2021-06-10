import 'package:flutter/material.dart';
import 'package:inventori/barang/utils/database.dart';
import 'package:inventori/barang/widgets/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentKode;
  final String currentNamaBarang;
  final int currentJumlahBarang;
  final String currentKondisi;
  final String currentKategori;
  final String documentId;

  EditScreen({
    this.currentKode,
    this.currentNamaBarang,
    this.currentJumlahBarang,
    this.currentKondisi,
    this.currentKategori,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _namaBarangFocusNode = FocusNode();
  final FocusNode _jumlahBarangFocusNode = FocusNode();
  final FocusNode _kondisiFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _namaBarangFocusNode.unfocus();
        _jumlahBarangFocusNode.unfocus();
        _kondisiFocusNode.unfocus();
        _kategoriFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Barang'),
          backgroundColor: Colors.teal[500],
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
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
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              kodeFocusNode: _kodeFocusNode,
              namaBarangFocusNode: _namaBarangFocusNode,
              jumlahBarangFocusNode: _jumlahBarangFocusNode,
              kondisiFocusNode: _kondisiFocusNode,
              kategoriFocusNode: _kategoriFocusNode,
              currentKode: widget.currentKode,
              currentNamaBarang: widget.currentNamaBarang,
              currentJumlahBarang: widget.currentJumlahBarang,
              currentKondisi: widget.currentKondisi,
              currentKategori: widget.currentKategori,
            ),
          ),
        ),
      ),
    );
  }
}
