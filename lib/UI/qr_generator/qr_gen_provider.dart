
import 'package:flutter/material.dart';

class QrGenProvider extends ChangeNotifier{

String qrdata = '';

  var url = TextEditingController();

  void UpdateData(){

    qrdata = url.text.toString();
    notifyListeners();



  }
}