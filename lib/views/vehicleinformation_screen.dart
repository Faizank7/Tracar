import 'package:flutter/material.dart';
import 'findingyourcehicle_screen.dart'; // Updated import statement

class VehicleInformationScreen extends StatefulWidget {
  final String vehicleType;

  const VehicleInformationScreen({Key? key, required this.vehicleType}) : super(key: key);

  @override
  _VehicleInformationScreenState createState() => _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields values
  String? _numberPlate = '';
  String? _engineNumber = '';
  String? _chassisNumber = '';
  String? _make = '';
  String? _model = '';
  String? _variant = '';
  late String _selectedVehicleType; // To store the selected vehicle type
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _selectedVehicleType = widget.vehicleType.isNotEmpty ? widget.vehicleType : 'Two Wheeler'; // Set default value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Information'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color
      ),
      body: GestureDetector(
        onTap: () {
          // Handle onTap event if needed
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700], // Set linear gradient colors
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: _selectedVehicleType,
                          items: <String>['Two Wheeler', 'Four Wheeler']
                              .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                              .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedVehicleType = newValue ?? '';
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      buildLabelText('Number Plate'),
                      buildTransparentTextField('XYZ-123', 'Please enter Number Plate', (String? value) {
                        _numberPlate = value;
                      }),
                      SizedBox(height: 10),
                      buildLabelText('Engine Number'),
                      buildTransparentTextField('---------------------------', 'Please enter Engine Number',
                              (String? value) {
                            _engineNumber = value;
                          }),
                      SizedBox(height: 10),
                      buildLabelText('Chassis Number'),
                      buildTransparentTextField('---------------------------', 'Please enter Chassis Number',
                              (String? value) {
                            _chassisNumber = value;
                          }),
                      SizedBox(height: 10),
                      buildLabelText('Make'),
                      buildTransparentTextField('Enter make', 'Please enter Make', (String? value) {
                        _make = value;
                      }),
                      SizedBox(height: 10),
                      buildLabelText('Model'),
                      buildTransparentTextField('Enter model', 'Please enter Model', (String? value) {
                        _model = value;
                      }),
                      SizedBox(height: 10),
                      buildLabelText('Variant'),
                      buildTransparentTextField('Enter variant', 'Please enter Variant', (String? value) {
                        _variant = value;
                      }),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirm'),
                                  content: StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value ?? false;
                                                  });
                                                },
                                              ),
                                              Text('I am not a robot'),
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: _isChecked
                                                ? () {
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => FindingYourVehicleScreen()),
                                              );
                                            }
                                                : null,
                                            child: Text('Proceed'),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black), // Set background color to black
                          foregroundColor: MaterialStateProperty.all(Colors.white), // Set text color to white
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabelText(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        labelText,
        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), // Adjust font size and weight as needed
      ),
    );
  }

  Widget buildTransparentTextField(String hintText, String errorText, Function(String?) onSaved) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.3), // Set the transparency level here
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
            style: TextStyle(color: Colors.black), // Text color
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            },
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
