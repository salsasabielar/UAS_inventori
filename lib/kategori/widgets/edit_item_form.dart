import 'package:flutter/material.dart';
import 'package:inventori/kategori/utils/database.dart';
import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode kategoriFocusNode;
  final String currentKode;
  final String currentKategori;
  final String documentId;

  const EditItemForm({
    this.kodeFocusNode,
    this.kategoriFocusNode,
    this.currentKode,
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
  TextEditingController _kategoriController;

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode,
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
                // Text(
                //   'kode',
                //   style: TextStyle(
                //     //color: CustomColors.firebaseGrey,
                //     fontSize: 22.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _kodeController,
                //   focusNode: widget.kodeFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   // validator: (value) => Validator.validateField(
                //   //   value: value,
                //   // ),
                //   label: 'kode',
                //   hint: 'Enter your note kode',
                // ),
                // SizedBox(height: 24.0),
                // Text(
                //   'kategori',
                //   style: TextStyle(
                //    // color: CustomColors.firebaseGrey,
                //     fontSize: 22.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kategoriController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // CustomFormField(
                //   maxLines: 10,
                //   isLabelEnabled: false,
                //   controller: _kategoriController,
                //   focusNode: widget.kategoriFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.done,
                //   // validator: (value) => Validator.validateField(
                //   //   value: value,
                //   // ),
                //   label: 'kategori',
                //   hint: 'Enter your note kategori',
                // ),
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
                      widget.kategoriFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
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
