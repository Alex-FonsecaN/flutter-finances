import 'package:flutter/material.dart';
import './widgets/finance_data.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 6.0,
          radius: const Radius.circular(10.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 11, // 10 FinanceData + 1 Row para inputs
            itemBuilder: (context, index) {
              if (index < 10) {
                // Mostra o widget FinanceData
                return const FinanceData();
              } else {
                // Mostra a Row de inputs para adicionar novo item
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botão redondo
                      IconButton(
                        icon: const Icon(Icons.circle),
                        onPressed: () {},
                        color: Colors.blue,
                        iconSize: 24.0,
                      ),
                      // Input de texto
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Texto',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // Input de número
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Número',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // Botão com bordas arredondadas
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text('Adicionar'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
