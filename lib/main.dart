import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'models/romaneio_model.dart'; // Import the generated file
import 'models/carro_form_model.dart';

late FirebaseFirestore db;
late List<dynamic> jsonFields;
late List<List<Widget>> formFields;
final TextEditingController formController = TextEditingController();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  db = FirebaseFirestore.instance;
  jsonFields = List.empty(growable: true);
  formFields = List.empty(growable: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [MyForm(Romaneio(), 0), MyForm(CarroForm(), 1)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mainPage')),
      body: Column(
        children: [
          Container(
              color: Theme.of(context).primaryColor,
              child: BottomNavigationBar(
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'form',
                    ),
                  ])),
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  dynamic formData;
  late int index;
  MyForm(dynamic dataInstance, int i) {
    formData = dataInstance;
    index = i;
  }
  // final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  //     GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text('APP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: _buildFormFields(
                  formData, formData.enumUsed(), context, index),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildFormFields(dynamic dataModel,
    Map<String, List<Enum>>? enumMap, BuildContext context, int index) {
  List<Widget> formFields = [];

  // create
  var jsonFields = dataModel.toJson();
  jsonFields.forEach((key, value) {
    if (enumMap != null && enumMap.containsKey(key)) {
      List<String> enumValues = List.empty(growable: true);

      enumMap[key]!.forEach((element) {
        enumValues.add(element.name);
      });

      // Handle enum fields with a dropdown list
      formFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButtonFormField<dynamic>(
            value: value,
            items: enumValues.map((status) {
              return DropdownMenuItem<dynamic>(
                value: status,
                child: Text(status.toString().split('.').last),
              );
            }).toList(),
            onChanged: (dynamic selectedStatus) {
              // Update the corresponding property in the form data
              if (selectedStatus != null) {
                jsonFields[key] = selectedStatus.toString().split('.').last;
              }
            },
            decoration: InputDecoration(labelText: key),
          ),
        ),
      );
    }
    //data fields
    else if ((key as String).contains('data')) {
      formFields.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: OutlinedButton(
              onPressed: () async {
                await openDate(jsonFields[key], context, key);
              },
              child: const Text('Open Date Picker'))));
    } else {
      // Handle other fields with TextFormField
      formFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            key: UniqueKey(),
            initialValue: jsonFields[key].toString(),
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
          uploadData(jsonFields[index], db, dataModel.toString());
        },
        child: Text('Submit'),
      ),
    ),
  );
  return formFields;
}

Future<void> openDate(dynamic jsonFields, BuildContext context, key) async {
  DateTime currentDate = DateTime.now();

  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime.now().add(Duration(days: -30)),
    lastDate: DateTime.now().add(Duration(days: 30)),
  );

  if (selectedDate != null) {
    // Update the corresponding property in the form data
    jsonFields[key] = selectedDate;
  }
}

void uploadData(Map<String, dynamic> jsonFields, FirebaseFirestore db,
    String collectionFB) async {
  try {
    CollectionReference collectionR = db.collection(collectionFB);
    await collectionR.add(jsonFields);
    _showSuccessSnackBar();
  } catch (e) {
    print('Error uploading data: $e');
  }
}

void _showSuccessSnackBar() {
  SnackBar(
    content: Text('Form submitted successfully!'),
    duration: Duration(seconds: 3),
  );
}



// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('mainPage'), actions: <Widget>[
//       IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => MyForm()));
//           },
//           icon: Icon(Icons.arrow_back)),
//       IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => MyForm()));
//           },
//           icon: Icon(Icons.arrow_back))
//     ]));
//   }
// }
