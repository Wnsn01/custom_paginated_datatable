import 'package:flutter/material.dart';

class DataSource extends DataTableSource {
  BuildContext context;
  List<Map<String, dynamic>> entries = [];
  final int _selectedCount = 0;

  DataSource({
    required this.context,
    required this.entries,
  });

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => entries.length;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow? getRow(int index) {
    if (index >= entries.length) return null;

    final entry = entries[index];

    return DataRow.byIndex(
      selected: entry['selected'] ?? false,
      color: entry['selected'] == true?MaterialStateColor.resolveWith((states) => Colors.red.shade100)
        : MaterialStateColor.resolveWith((states) => index % 2 == 1
          ? Colors.grey.shade300
          : Colors.transparent),
      onSelectChanged: (select) {
        entry['selected']=select;
        notifyListeners();
      },
      index: index,
      cells: <DataCell>[
        DataCell(
          Text('${entry['student_no']}'),
        ),
        DataCell(
          Text(entry['name']),
        ),
        DataCell(
          Text(entry['gender']),
        ),
        DataCell(
          Text('${entry['age']}'),
        ),
        DataCell(
          Text('${entry['joined_date']}'),
        ),
      ]
    );
  }
}
