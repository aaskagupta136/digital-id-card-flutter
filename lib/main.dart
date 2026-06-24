import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

const Color kPrimaryColor = Color.fromARGB(255, 24, 28, 49);
const Color kPanelColor = Colors.white70;
const Color kLabelColor = Colors.blue;
const Color kValueColor = Colors.black87;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController sessionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController collegeIdController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? selectedImage;

  Future<void> pickImage() async {
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
  void dispose() {
    sessionController.dispose();
    nameController.dispose();
    dobController.dispose();
    branchController.dispose();
    collegeIdController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (sessionController.text.trim().isEmpty ||
        nameController.text.trim().isEmpty ||
        dobController.text.trim().isEmpty ||
        branchController.text.trim().isEmpty ||
        collegeIdController.text.trim().isEmpty ||
        mobileController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return false;
    }
    return true;
  }

  void _onGeneratePressed() {
    if (!_validateFields()) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          session: sessionController.text,
          name: nameController.text,
          dob: dobController.text,
          branch: branchController.text,
          collegeId: collegeIdController.text,
          mobile: mobileController.text,
          address: addressController.text,
          image: selectedImage,
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
  }) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black87,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
      ),
    );
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
                const SizedBox(height: 50),
                Text(
                  " DIGITAL STUDENT ID CARD ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  "(FILL YOUR INFORMATION) ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
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
                          buildTextField(
                            controller: sessionController,
                            label: "ENTER YOUR SESSION",
                            icon: Icons.calendar_today,
                            hint: " (example- SESSION:2024-2028 ) ",
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: nameController,
                            label: "ENTER YOUR NAME",
                            icon: Icons.person,
                            hint: " ( IN CAPITAL LETTERS ) ",
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: dobController,
                            label: "ENTER YOUR DOB",
                            icon: Icons.calendar_month_rounded,
                            hint: "DD-MM-YYYY",
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: branchController,
                            label: "ENTER YOUR BRANCH",
                            icon: Icons.school_rounded,
                            hint: " ( IN CAPITAL LETTERS ) ",
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: collegeIdController,
                            label: "ENTER YOUR COLLEGE ID NO.",
                            icon: Icons.card_membership_rounded,
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: mobileController,
                            label: "ENTER YOUR MOBILE NUMBER",
                            icon: Icons.phone_android_rounded,
                          ),
                          const SizedBox(height: 18),

                          buildTextField(
                            controller: addressController,
                            label: "ENTER YOUR ADDRESS",
                            icon: Icons.place_rounded,
                            hint: " ( IN CAPITAL LETTERS ) ",
                          ),
                          const SizedBox(height: 18),

                          // IMAGE UPLOAD BOX
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
                                  : const Column(
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

                const SizedBox(height: 20),

                // SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: _onGeneratePressed,
                    icon: const SizedBox.shrink(),
                    label: const Text(
                      "GENERATE ID CARD",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
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
    final cardWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    // ---------- TOP HEADER (college info + photo) ----------
                    Container(
                      width: cardWidth,
                      height: 390,
                      decoration: const BoxDecoration(color: kPrimaryColor),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "SPMS(TRUST)",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(height: 1),

                          SizedBox(
                            width: cardWidth,
                            child: const Text(
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
                          const SizedBox(height: 5),

                          SizedBox(
                            width: cardWidth,
                            child: Text(
                              session,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // PHOTO
                          Container(
                            height: 240,
                            width: 200,
                            decoration: const BoxDecoration(
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
                                : const Icon(Icons.person, size: 100),
                          ),
                        ],
                      ),
                    ),

                    // ---------- BLUE DIVIDER LINE ----------
                    Container(
                      width: cardWidth,
                      height: 15,
                      decoration: const BoxDecoration(
                        color: Colors.lightBlue,
                      ),
                    ),

                    // ---------- DETAILS PANEL ----------
                    Container(
                      width: cardWidth,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(color: kPanelColor),
                      child: Column(
                        children: [
                          const SizedBox(height: 3),
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 20),

                          infoRow(title: "D.O.B", value: dob),
                          const SizedBox(height: 5),

                          infoRow(
                            title: "BRANCH",
                            value: branch,
                            valueFontSize: 11,
                            valueWeight: FontWeight.w900,
                          ),
                          const SizedBox(height: 5),

                          infoRow(title: "COLLEGE ID", value: collegeId),
                          const SizedBox(height: 10),

                          infoRow(title: "MOBILE", value: mobile),
                          const SizedBox(height: 5),

                          infoRow(title: "ADDRESS", value: address),
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

  Widget infoRow({
    required String title,
    required String value,
    double valueFontSize = 13,
    FontWeight valueWeight = FontWeight.bold,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: kLabelColor,
            ),
          ),
        ),
        const Text(": ", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: valueWeight,
              color: kValueColor,
            ),
          ),
        ),
      ],
    );
  }
}
