import 'package:flutter/material.dart';
import 'package:peduli_rumah/chat_page.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<Doctor> doctors = [
    Doctor(name: "Dr. John Doe", description: "Dokter Umum", age: "25"),
    Doctor(name: "Dr. Jane Smith", description: "Dokter Gigi", age: "35"),
    Doctor(name: "Dr. Michael Johnson", description: "Dokter Anak", age: "29"),
    Doctor(name: "Dr. Elizabeth Wilson", description: "Dokter THT", age: "55"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recomended Doctor")),
      body: Container(
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            Doctor doctor = doctors[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://picsum.photos/250'),
                  ),
                  title: Text(doctor.name),
                  subtitle: Text(doctor.description),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              doctorName: doctor.name,
                            ),
                          ));
                    },
                    child: Text('Chat'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String description;
  final String age;
  final String? specialization;

  Doctor({required this.name, required this.description, required this.age, this.specialization});
}
