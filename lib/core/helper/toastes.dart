import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

doneToast(BuildContext context,String msg){
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.green,
    gravity: ToastGravity.TOP,
    fontSize: MediaQuery.textScalerOf(context).scale(18),
    toastLength: Toast.LENGTH_LONG,

  );
}