import 'package:flutter/material.dart';

import 'screens/transferencias/Lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary
          )
      ),
      home: ListaTransferencias(),
    );
  }
}

