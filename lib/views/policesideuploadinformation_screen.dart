import 'package:flutter/material.dart';
import 'policesidelast_screen.dart'; // Import the PoliceSideLastScreen

class PoliceSideUploadInformationScreen extends StatefulWidget {
  final String vehicleType;

  const PoliceSideUploadInformationScreen({Key? key, required this.vehicleType}) : super(key: key);

  @override
  _PoliceSideUploadInformationScreenState createState() => _PoliceSideUploadInformationScreenState();
}

class _PoliceSideUploadInformationScreenState extends State<PoliceSideUploadInformationScreen> {
  late String _selectedVehicleType;
  bool _showInformationBox = true; // Set initial value to true

  @override
  void initState() {
    super.initState();
    _selectedVehicleType = widget.vehicleType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Information'),
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/police_logo.png',
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Selected Vehicle Type: $_selectedVehicleType',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedVehicleType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedVehicleType = newValue!;
                    });
                  },
                  items: <String>['Two Wheeler', 'Four Wheeler'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push( // Navigate to PoliceSideLastScreen with vehicleType
                      context,
                      MaterialPageRoute(builder: (context) => PoliceSideLastScreen()),
                    );
                  },
                  child: Text('Upload Information'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ),
                if (_showInformationBox)
                  InformationBox(), // Show the custom InformationBox widget
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationBox extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200]!.withOpacity(0.5), // Set opacity to 50%
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black, // Set border color to black
          width: 2, // Set border width
        ),
      ),
      child: Row(
        children: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('Upload from Gallery'),
                value: 'gallery',
              ),
              PopupMenuItem(
                child: Text('Upload from Camera'),
                value: 'camera',
              ),
              PopupMenuItem(
                child: Text('Upload from File Manager'),
                value: 'file_manager',
              ),
            ],
            onSelected: (value) {
              // Handle selection
              print('Selected option: $value');
            },
            icon: Icon(Icons.attach_file),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add Information Here',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
