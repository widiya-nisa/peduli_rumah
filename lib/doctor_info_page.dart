import 'package:flutter/material.dart';
import 'package:peduli_rumah/doctor_list_page.dart';

class DoctorInfoPage extends StatefulWidget {
  const DoctorInfoPage({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends State<DoctorInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network("https://picsum.photos/200/200",
                      height: 150, width: 150, fit: BoxFit.cover),
                ),
                SizedBox(height: 8),
                Text(widget.doctor.name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(widget.doctor.description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Umur: ${widget.doctor.age} tahun',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
