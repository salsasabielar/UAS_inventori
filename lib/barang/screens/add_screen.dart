import 'package:flutter/material.dart';
import 'package:inventori/barang/widgets/add_item_form.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _namaBarangFocusNode = FocusNode();
  final FocusNode _jumlahBarangFocusNode = FocusNode();
  final FocusNode _kondisiFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();

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
            child: AddItemForm(
              kodeFocusNode: _kodeFocusNode,
              namaBarangFocusNode: _namaBarangFocusNode,
              jumlahBarangFocusNode: _jumlahBarangFocusNode,
              kondisiFocusNode: _kondisiFocusNode,
              kategoriFocusNode: _kategoriFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
