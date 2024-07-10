
import 'package:flutter/material.dart';
class HomeBottom extends StatefulWidget {
  const HomeBottom({super.key, required this.sum});
  final double sum;

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom>{

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Text('Total: R\$ ${widget.sum.toStringAsFixed(2)}'),
    );
  }
}