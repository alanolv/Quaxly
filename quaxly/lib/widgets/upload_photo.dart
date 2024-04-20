import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('Complete the delivery',
                    style: TextStyle(
                      color: Color(0xFF13D460),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(
                    color: Color(0xFF08A045),
                    height: 1,
                  ),
                ),
              ),
              const ListTile(
                title: Text(
                  'Delivery ID',
                  style: TextStyle(color: Color(0xFF8C8C8C)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Confirm your delivery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt,
                    color: Color(0xFF13D460), size: 90.0),
                onPressed: () {
                  //codigo para permitir tomar foto y subirla
                },
              ),
              ElevatedButton(
                onPressed: () {
                  //codigo para subir foto
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF13D460)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Upload photo'),
              ),
              TextButton(
                onPressed: () {
                  //codigo para subir foto
                },
                child: const Text('Cancel Confirmation'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Modal Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showModal,
          child: const Text('Show Modal'),
        ),
      ),
    );
  }
}
