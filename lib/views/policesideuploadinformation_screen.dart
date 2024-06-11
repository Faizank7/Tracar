import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
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
                    Navigator.push(
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

class InformationBox extends StatefulWidget {
  @override
  _InformationBoxState createState() => _InformationBoxState();
}

class _InformationBoxState extends State<InformationBox> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedFile;

  Future<void> _pickFileFromSource(FileType source) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: source);

    if (result != null) {
      setState(() {
        _selectedFile = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }

  void _showFilePickerMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Upload from Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickFileFromSource(FileType.image);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Upload from Camera'),
            onTap: () {
              Navigator.pop(context);
              // Add logic to handle camera upload
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text('Upload from File Manager'),
            onTap: () {
              Navigator.pop(context);
              _pickFileFromSource(FileType.any);
            },
          ),
        ],
      ),
    );
  }

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
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () => _showFilePickerMenu(context),
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
          if (_selectedFile != null)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                _selectedFile!,
                style: TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
