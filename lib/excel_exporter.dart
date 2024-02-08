import 'package:excel/excel.dart';
import 'dart:io';

class ExcelExporter {
  final String filePath;

  ExcelExporter(this.filePath);

  Future<void> exportToExcel(dynamic yourObject) async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    // Assuming yourObject is a Map<String, dynamic> or has a toJson() method
    final Map<String, dynamic> objectData =
        yourObject is Map<String, dynamic> ? yourObject : yourObject.toJson();

    // Add headers
    List<CellValue> headers =
        objectData.keys.map((header) => TextCellValue(header)).toList();
    sheet.appendRow(headers);

    // Add data rows
    final data = objectData.values.map((value) {
      if (value is num) {
        return DoubleCellValue(value as double);
      } else {
        return TextCellValue(value as String);
      }
    }).toList();
    sheet.appendRow(data);

    // Save the Excel file
    final file = File('$filePath/r.xlsx');
    await file.writeAsBytes(excel.encode()!);
  }
}
