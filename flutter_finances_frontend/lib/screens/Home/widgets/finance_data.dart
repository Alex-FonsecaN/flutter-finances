import 'package:flutter/material.dart';

class FinanceData extends StatefulWidget {
  const FinanceData({super.key});

  @override
  State<FinanceData> createState() => _FinanceDataState();
}

class _FinanceDataState extends State<FinanceData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Icon(Icons.money),
        Text('finance name'),
        Text('R\$ 20,00'),
         ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text('Deletar'),
        ),
      ],
    );
  }
}