import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String? _selectedYear;
  String? _selectedMonth;

  String? get selectedYear => _selectedYear;
  String? get selectedMonth => _selectedMonth;

  void setSelectedYear(String year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setSelectedMonth(String month) {
    _selectedMonth = month;
    notifyListeners();
  }

  Future<void> fetchData() async {
    // if (_selectedYear != null && _selectedMonth != null) {
    //   final response = await http.get(
    //     Uri.parse('http://localhost:3000/data?year=$_selectedYear&month=$_selectedMonth'),
    //   );
    //   if (response.statusCode == 200) {
    //     // Processar a resposta da API
    //   } else {
    //     // Lidar com erro
    //   }
    // }
  }
}
