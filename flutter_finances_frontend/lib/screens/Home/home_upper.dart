import 'package:flutter/material.dart';
class HomeUpper extends StatefulWidget {
  const HomeUpper({super.key});

  @override
  State<HomeUpper> createState() => _HomeUpperState();
}


class _HomeUpperState extends State<HomeUpper> {
  String? _selectedYear;
  String? _selectedMonth;

  final List<String> _years = List<String>.generate(20, (index) => (2020 + index).toString());
  final List<String> _months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    hint: const Text('ANO', style: TextStyle(color: Colors.white),),
                    value: _selectedYear,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedYear = newValue;
                      });
                    },
                    items: _years.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.white),),
                      );
                    }).toList(),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    hint: const Text('MÊS', style: TextStyle(color: Colors.white)),
                    value: _selectedMonth,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMonth = newValue;
                      });
                    },
                    items: _months.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.white)),
                        );
                    }).toList(),
                  )
                  )
              ],
            ),
          ],
        )
      );
  }
}