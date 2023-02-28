import 'dart:io';

import 'package:chatflutter/models/user_model.dart';
import 'package:chatflutter/screen/chat/chat_screen.dart';
import 'package:chatflutter/screen/home/home_screen.dart';
import 'package:chatflutter/service/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  File? selectedImage;
  final ApiService _apiService = ApiService();
  UserModel? user;
  bool com_flag = false;
  String? firstName;
  String? lastName;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController personalController = TextEditingController();
  TextEditingController yourIdController = TextEditingController();
  TextEditingController providerController = TextEditingController();
  TextEditingController dateIssueController = TextEditingController();
  TextEditingController dateExpireController = TextEditingController();

  Future<void> _getImage(BuildContext context) async {
    if (selectedImage != null) {
      var imageFile = selectedImage;
      /*var image = imageLib.decodeImage(imageFile.readAsBytesSync());
      fileName = basename(imageFile.path);
      image = imageLib.copyResize(image,
          width: (MediaQuery.of(context).size.width * 0.8).toInt(),
          height: (MediaQuery.of(context).size.height * 0.7).toInt());
      _image = image;*/
    }
  }

  void profile() {
    _apiService.Profile().then((value) {
      user = value;
      String name = user!.name!;
      String? dob = user!.dob!;
      String? doi = user!.dateOfIssue!;
      String? doe = user!.dateOfExpire!;
      // dob = dob.replaceRange(10, dob.length, '').toString();
      // doi = doi.replaceRange(10, doi.length, '').toString();
      // doe = doe.replaceRange(10, doe.length, '').toString();

      int idx = name.indexOf(" ");
      List nameParts = [
        name.substring(0, idx).trim(),
        name.substring(idx + 1).trim()
      ];
      firstName = nameParts[0].toString();
      lastName = nameParts[1].toString();
      firstNameController.text = firstName!;
      lastNameController.text = lastName!;
      emailController.text = user!.email!;
      birthdayController.text = dob;
      phoneController.text = user!.phone!;
      addressController.text = user!.address!;
      zipController.text = user!.zip!;
      countryController.text = user!.country!;
      cityController.text = user!.city!;
      personalController.text = user!.personalCode!;
      yourIdController.text = user!.yourId!;
      providerController.text = user!.authority!;
      dateIssueController.text = doi;
      dateExpireController.text = doe;
    });
  }

  void profileUpdate(
    String firstName,
    String lastName,
    String email,
    String birthday,
    String phone,
    String address,
    String zip,
    String city,
    String country,
    String personal,
    String yourId,
    String authority,
    String doi,
    String doe,
  ) {
    _apiService.ProfileUpdate(firstName, lastName, email, birthday, phone,
            address, zip, city, country, personal, yourId, authority, doi, doe)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Updated successfully"),
        backgroundColor: Colors.green,
      ));
      user = value;
      String name = user!.name!;
      String? dob = user!.dob!;
      String? doi = user!.dateOfIssue!;
      String? doe = user!.dateOfExpire!;
      // dob = dob.replaceRange(10, dob.length, '').toString();
      // doi = doi.replaceRange(10, doi.length, '').toString();
      // doe = doe.replaceRange(10, doe.length, '').toString();

      int idx = name.indexOf(" ");
      List nameParts = [
        name.substring(0, idx).trim(),
        name.substring(idx + 1).trim()
      ];
      firstName = nameParts[0].toString();
      lastName = nameParts[1].toString();
      firstNameController.text = firstName;
      lastNameController.text = lastName;
      emailController.text = user!.email!;
      birthdayController.text = dob;
      phoneController.text = user!.phone!;
      addressController.text = user!.address!;
      zipController.text = user!.zip!;
      countryController.text = user!.country!;
      cityController.text = user!.city!;
      personalController.text = user!.personalCode!;
      yourIdController.text = user!.yourId!;
      providerController.text = user!.authority!;
      dateIssueController.text = doi;
      dateExpireController.text = doe;
    });
  }

  @override
  void initState() {
    profile();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void logout() {
    _apiService.logout().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 246, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: IconButton(
          icon: Image.network(
              'http://wh.saas.test/geniusBankWallet/assets/images/GZrLGJFQ1674480311.jpg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        leading: PopupMenuButton(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          color: Colors.white, // color setting

          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                "Home",
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Shop"),
              value: 2,
            ),
            PopupMenuItem(
              child: Text("Loan"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Investments"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Payment"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Vouchers"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Merchant"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Supervisor"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("invoice"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("ICO"),
              value: 1,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 1),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.dark_mode_outlined,
                  size: 24,
                  color: Colors.black,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(8), // Border width
            decoration: const BoxDecoration(
                color: Colors.transparent, shape: BoxShape.rectangle),
            child: PopupMenuButton(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(20), // Image radius
                  child: Image.network(
                      'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'),
                ),
              ),
              color: Colors.white, // color setting

              itemBuilder: (context) => [
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      print("edit profile");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileUpdateScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Edit Profile",
                      ),
                    ),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Module"),
                  value: 2,
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        print("here");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      child: Text("Chat                          ")),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Change Password"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Pricing Plan"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Security"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Login Activity"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("AML/KYC"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Pincode"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        print("logout");
                        logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text("Logout                      ")),
                  value: 1,
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 28),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0.5, 0.5),
                        ),
                      ]),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: FutureBuilder(
                                  future: _getImage(context),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        return Text('Please wait');
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: CircularProgressIndicator());
                                      default:
                                        if (snapshot.hasError)
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        else {
                                          return selectedImage != null
                                              ? Image.file(selectedImage!)
                                              : Center(
                                                  child: Text(
                                                      "Please Get the Image"),
                                                );
                                        }
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                              ),
                            ],
                          ),
                          Container(
                            child: InkWell(
                                child: Text(
                                  "File Picker",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 88, 165, 228),
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {}),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: firstNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: lastNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: birthdayController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Birthday"),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2030));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    birthdayController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: phoneController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Address',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: zipController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Zip Code',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: countryController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Country',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: personalController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Personal Code/Number',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: yourIdController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Your ID Number',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: providerController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Provider Authority Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: dateIssueController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Date of Issue"),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2030));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    dateIssueController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: dateExpireController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Date of Expire"),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2030));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    dateExpireController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: FutureBuilder(
                                  future: _getImage(context),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        return Text('Please wait');
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: CircularProgressIndicator());
                                      default:
                                        if (snapshot.hasError)
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        else {
                                          return selectedImage != null
                                              ? Image.file(selectedImage!)
                                              : Center(
                                                  child: Text(
                                                      "Please Get the Image"),
                                                );
                                        }
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                              ),
                            ],
                          ),
                          Container(
                            child: InkWell(
                                child: Text(
                                  "Signature file Picker",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 88, 165, 228),
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {}),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: FutureBuilder(
                                  future: _getImage(context),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        return Text('Please wait');
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: CircularProgressIndicator());
                                      default:
                                        if (snapshot.hasError)
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        else {
                                          return selectedImage != null
                                              ? Image.file(selectedImage!)
                                              : Center(
                                                  child: Text(
                                                      "Please Get the Image"),
                                                );
                                        }
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                              ),
                            ],
                          ),
                          Container(
                            child: InkWell(
                                child: Text(
                                  "Stamp file Picker",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 88, 165, 228),
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {}),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                profileUpdate(
                                  firstNameController.text.toString(),
                                  lastNameController.text.toString(),
                                  emailController.text.toString(),
                                  birthdayController.text.toString(),
                                  phoneController.text.toString(),
                                  addressController.text.toString(),
                                  zipController.text.toString(),
                                  cityController.text.toString(),
                                  countryController.text.toString(),
                                  personalController.text.toString(),
                                  yourIdController.text.toString(),
                                  providerController.text.toString(),
                                  dateIssueController.text.toString(),
                                  dateExpireController.text.toString(),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
