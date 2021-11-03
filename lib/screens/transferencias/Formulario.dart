import 'package:bytebank/components/Editor.dart';
import 'package:flutter/material.dart';

import '../../models/Transferencia.dart';

class FormularioTransferencia extends StatefulWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  State<StatefulWidget> createState(){
    return FormularioTransferenciaState();
  }

}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criando transferencia'),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: widget._controladorCampoNumeroConta,
                rotulo: "Numero da conta",
                dica: "0000",
              ),
              Editor(
                controlador: widget._controladorCampoValor,
                rotulo: "Valor",
                dica: "0.00",
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => widget._criaTransferencia(context),
                child: Text('Confirmar'),
              ),
            ],
          ),
        ),
    );
  }
}
