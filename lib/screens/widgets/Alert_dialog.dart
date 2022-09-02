import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseAlertDialog extends StatelessWidget {

  String _title;
  String _content;
  String _yes;
  String _no;
  Function _yesOnPressed;
  Function _noOnPressed;

  BaseAlertDialog({String title, String content, Function yesOnPressed, Function noOnPressed, String yes = "", String no = ""}){
    this._title = title;
    this._content = content;
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
      // shape:
          // RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        
        new FlatButton(
          child: Text(this._no),
          textColor: Color(0xFFF807F7F),
          onPressed: () {
            this._noOnPressed();
          },
        ),
        new FlatButton(
          child: new Text(this._yes),
          
          onPressed: () {
            this._yesOnPressed();
          },
        ),
      ],
    );
  }
}


// ignore: must_be_immutable
class BaseAlertDialogOK extends StatelessWidget {

  String _title;
  String _content;
  String _ok;
  Function _okOnPressed;


  BaseAlertDialogOK({String title, String content, Function okOnPressed, Function noOnPressed, String ok = "",}){
    this._title = title;
    this._content = content;
    this._okOnPressed = okOnPressed;
    this._ok = ok;

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
      // shape:
          // RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        
        new FlatButton(
          child: new Text(this._ok),
          
          onPressed: () {
            this._okOnPressed();
          },
        ),
      ],
    );
  }
}