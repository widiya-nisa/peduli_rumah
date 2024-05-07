import 'package:flutter/material.dart';
import 'package:peduli_rumah/chat_page.dart';
import 'package:peduli_rumah/doctor_info_page.dart';
import 'package:peduli_rumah/doctor_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Doctor> doctors = [
    Doctor(name: "Dr. John Doe", description: "Dokter Umum", age: "25"),
    Doctor(name: "Dr. Jane Smith", description: "Dokter Gigi", age: "35"),
    Doctor(name: "Dr. Michael Johnson", description: "Dokter Anak", age: "29"),
    Doctor(name: "Dr. Elizabeth Wilson", description: "Dokter THT", age: "55"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Anisa!",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Hope you have a great day!",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        ClipOval(
                          child: Image.network(
                            "https://fastly.picsum.photos/id/64/4326/2884.jpg?hmac=9_SzX666YRpR_fOyYStXpfSiJ_edO3ghlSRnH2w09Kg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            "https://picsum.photos/200/200",
                            width: 100,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 200,
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Health, Your Priority!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                Text(
                                  "Dr. Widiyanti, Sp. THT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ))
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Doctor Speciality",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text("View all")
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Speciality(
                                      title: "Tiktok",
                                      icon: Icons.tiktok,
                                      color: Colors.purple),
                                  Speciality(
                                      title: "Food",
                                      icon: Icons.fastfood,
                                      color: Colors.green),
                                  Speciality(
                                      title: "Car",
                                      icon: Icons.car_crash,
                                      color: Color.fromARGB(255, 245, 8, 8)),
                                  Speciality(
                                      title: "Airplane",
                                      icon: Icons.airplane_ticket,
                                      color: Colors.blue),
                                ]))
                      ],
                    )),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recomended Doctor",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorListPage(),
                                    ),
                                  );
                                },
                                child: Text("View all"))
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: doctors.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DoctorInfoPage(doctor: doctors[index],),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 16, left: index == 0 ? 16 : 0),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: ClipOval(
                                            child: Image.network(
                                              "https://picsum.photos/200/200",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          doctors[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          doctors[index].description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "2 years",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Row(
                                              children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 20,
                                                      )).toList(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 200,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatPage(
                                                      doctorName:
                                                          doctors[index].name,
                                                    ),
                                                  ));
                                            },
                                            child: Text("Chat"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Speciality extends StatelessWidget {
  const Speciality(
      {super.key,
      required this.title,
      required this.icon,
      required this.color});

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
