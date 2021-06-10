import 'package:flutter/material.dart';
import 'package:inventori/kategori/utils/database.dart';
import 'package:inventori/kategori/widgets/custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode kategoriFocusNode;

  const AddItemForm({
    this.kodeFocusNode,
    this.kategoriFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                // Text(
                //   'Kode Kategori',
                //   style: TextStyle(
                //     // color: CustomColors.firebaseGrey,
                //     fontSize: 20.0,
                //     //letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                //SizedBox(height: 8.0),
                // Kode Kategori
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
                //   label: 'Title',
                //   hint: 'Enter your kode here',
                // ),
                // kategori
                // Text(
                //   'Nama Kategori',
                //   style: TextStyle(
                //     //color: CustomColors.firebaseGrey,
                //     fontSize: 20.0,
                //     //letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
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
                // SizedBox(height: 24.0),

                // SizedBox(height: 8.0),
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
                //   label: 'Kategori',
                //   hint: 'Enter your kategori here',
                // ),
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
                      widget.kategoriFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
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
                      padding: EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 16, right: 16),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: CustomColors.firebaseGrey,
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
