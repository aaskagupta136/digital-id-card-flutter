import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

//LOGIN PAGE
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController sessionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController collegeidnumberController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? selectedImage;
  Future pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  " DIGITAL STUDENT ID CARD ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "(FILL YOUR INFORMATION) ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 10,
                  shadowColor: const Color.fromARGB(66, 179, 116, 116),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),

                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: sessionController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR SESSION",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                              hintText: " (example- SESSION:2024-2028 ) ",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),
                          TextField(
                            controller: nameController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR NAME",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              hintText: " ( IN CAPITAL LETTERS ) ",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.person),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),

                          TextField(
                            controller: dobController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR DOB",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: "DD-MM-YYYY",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.calendar_month_rounded),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),

                          TextField(
                            controller: branchController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR BRANCH",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              hintText: " ( IN CAPITAL LETTERS ) ",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.school_rounded),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),

                          TextField(
                            controller: collegeidnumberController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR COLLEGE ID NO.",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.card_membership_rounded),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),

                          TextField(
                            controller: mobilenumberController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR MOBILE NUMBER",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.phone_android_rounded),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),

                          TextField(
                            controller: addressController,
                            cursorColor: Colors.black87,

                            decoration: InputDecoration(
                              labelText: "ENTER YOUR ADDRESS",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),

                              hintText: " ( IN CAPITAL LETTERS ) ",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              prefixIcon: Icon(Icons.place_rounded),
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),
                          GestureDetector(
                            onTap: pickImage,

                            child: Container(
                              height: 250,
                              width: double.infinity,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black38,
                                  width: 2,
                                ),

                                borderRadius: BorderRadius.circular(15),

                                color: Colors.grey.shade100,
                              ),

                              child: selectedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),

                                      child: Image.file(
                                        selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        Icon(
                                          Icons.cloud_upload,
                                          size: 45,
                                          color: Colors.black54,
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "UPLOAD IMAGE",

                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),

                                        SizedBox(height: 3),

                                        Text(
                                          ".jpg / .jpeg",

                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            session: sessionController.text,
                            name: nameController.text,
                            dob: dobController.text,
                            branch: branchController.text,
                            collegeId: collegeidnumberController.text,
                            mobile: mobilenumberController.text,
                            address: addressController.text,
                            image: selectedImage,
                          ),
                        ),
                      );
                    },

                    label: Text(
                      "GENERATE ID CARD",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 28, 49),

                      elevation: 10,

                      shadowColor: Colors.black54,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String session;
  final String name;
  final String dob;
  final String branch;
  final String collegeId;
  final String mobile;
  final String address;

  final File? image;

  const HomePage({
    super.key,

    required this.session,
    required this.name,
    required this.dob,
    required this.branch,
    required this.collegeId,
    required this.mobile,
    required this.address,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,

              margin: EdgeInsets.all(15),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18.0),

                child: Column(
                  children: [
                    // TOP CONTAINER
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 390,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          255,
                          24,
                          28,
                          49,
                        ),
                      ),

                      child: Column(
                        children: [
                          SizedBox(height: 10),

                          Text(
                            "SPMS(TRUST)",

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),

                          SizedBox(height: 1),

                          SizedBox(
                            width: 500,

                            child: Text(
                              "RAJIV GANDHI COLLEGE OF ENGINEERING RESEARCH AND TECHNOLOGY",

                              textAlign: TextAlign.center,

                              maxLines: 3,

                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),

                          SizedBox(
                            width: 500,

                            child: Text(
                              session,

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(height: 8),

                          // IMAGE
                          Container(
                            height: 240,
                            width: 200,

                            decoration: BoxDecoration(
                              color: Colors.white70,
                            ),

                            child: image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),

                                    child: Image.file(
                                      image!,

                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 100,
                                  ),
                          ),
                        ],
                      ),
                    ),

                    // BLUE LINE
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,

                      height: 15,

                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                      ),
                    ),

                    // DETAILS CONTAINER
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,

                      padding: EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),

                      child: Column(
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            name,

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),

                          SizedBox(height: 20),

                          // DOB
                          Row(
                            children: [
                              SizedBox(
                                width: 120,

                                child: Text(
                                  "D.O.B",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              Text(
                                ": ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  dob,

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),

                          // BRANCH
                          Row(
                            children: [
                              SizedBox(
                                width: 120,

                                child: Text(
                                  "BRANCH",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              Text(
                                ": ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  branch,

                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),

                          // COLLEGE ID
                          Row(
                            children: [
                              SizedBox(
                                width: 120,

                                child: Text(
                                  "COLLEGE ID",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              Text(
                                ": ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  collegeId,

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          // MOBILE
                          Row(
                            children: [
                              SizedBox(
                                width: 120,

                                child: Text(
                                  "MOBILE",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              Text(
                                ": ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  mobile,

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),

                          // ADDRESS
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(
                                width: 120,

                                child: Text(
                                  "ADDRESS",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              Text(
                                ": ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  address,

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // REUSABLE ROW
  Widget infoRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 120,

          child: Text(
            title,

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),

        Text(
          ": ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        Expanded(
          child: Text(
            value,

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
