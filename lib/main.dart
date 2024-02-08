import 'dart:io';

import 'package:flutter/material.dart';
import 'romaneio_model.dart'; // Import the generated file
import 'excel_exporter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatelessWidget {
  final Romaneio formData = Romaneio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Romaneio Bresolin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: _buildFormFields(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields() {
    List<Widget> formFields = [];
    var jsonFields = Romaneio().toJson();
    jsonFields.forEach((key, value) {
      if (key.contains('especie')) {
        // Handle enum fields with a dropdown list
        formFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DropdownButtonFormField<Especie>(
              value: Especie.values.firstWhere(
                (e) => e.name == value,
                orElse: () => Especie
                    .values.last, // Default to the first value if not found
              ),
              items: Especie.values.map((status) {
                return DropdownMenuItem<Especie>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
              onChanged: (Especie? selectedStatus) {
                // Update the corresponding property in the form data
                if (selectedStatus != null) {
                  jsonFields[key] = selectedStatus.toString().split('.').last;
                }
              },
              decoration: InputDecoration(labelText: key),
            ),
          ),
        );
      } else if (key == 'destino') {
        // Handle enum fields with a dropdown list
        formFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DropdownButtonFormField<Destino>(
              value: Destino.values.firstWhere(
                (e) => e.name == value,
                orElse: () => Destino
                    .values.last, // Default to the first value if not found
              ),
              items: Destino.values.map((status) {
                return DropdownMenuItem<Destino>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
              onChanged: (Destino? selectedStatus) {
                // Update the corresponding property in the form data
                if (selectedStatus != null) {
                  jsonFields[key] = selectedStatus.toString().split('.').last;
                }
              },
              decoration: InputDecoration(labelText: key),
            ),
          ),
        );
      } else {
        // Handle other fields (non-enums) with TextFormField
        formFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              initialValue: value.toString(),
              decoration: InputDecoration(labelText: key),
              onChanged: (text) {
                // Update the corresponding property in the form data
                jsonFields[key] = text;
              },
            ),
          ),
        );
      }
    });
    // Add a submit button
    formFields.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle the form submission here
            // You can call a function to post the data or perform other actions
            ExcelExporter t = ExcelExporter(Directory.current.path);
            t.exportToExcel(formData);
          },
          child: Text('Submit'),
        ),
      ),
    );
    return formFields;
  }
}
