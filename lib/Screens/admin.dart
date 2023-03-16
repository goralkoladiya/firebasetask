import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/my_button.dart';
import '../controller/sign_up_controller.dart';
List<String> list = <String>['Surat', 'Baroda', 'Vapi','Valsad','Mumbai'];
class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  int t=0;
  List<String> templist=[];
  List<String> tempsublist=[];
  List<String> tempcatlist=[];
  String dropdownValue = list.first;
  String categoryValue = "";
  String subcategoryValue = "";
  final CategoryController = TextEditingController().obs;
  final SubCategoryController = TextEditingController().obs;
  String _errorMessage = "";
  SignUpController signUpController = Get.put(SignUpController());
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Category').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: t==0? Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select City",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: HexColor("#8d8d8d"),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: HexColor("#8d8d8d"),
              ),
              isExpanded: true,
              underline: Container(
                height: 2,
                color: HexColor("#ffffff"),
              ),
              iconSize: 30,
              borderRadius: BorderRadius.circular(20),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Add Category",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: HexColor("#8d8d8d"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: CategoryController.value,
              cursorColor: HexColor("#4f4f4f"),
              decoration: InputDecoration(
                fillColor: HexColor("#f0f3f1"),
                contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  color: HexColor("#8d8d8d"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                _errorMessage,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            MyButton(
                buttonText: 'Add',
                onPressed: () async {
                  if(CategoryController.value.text!=null &&  dropdownValue!="")
                    {
                      await FirebaseFirestore.instance.collection("Category").add({
                        "category": CategoryController.value.text,
                        "city": dropdownValue,
                      }).then((value) {
                        CategoryController.value.text="";
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Category Added")));
                      });
                    }

                }),

          ],
        ),
      ):t==1?
      Column(children: [
          Text(
            "Select Category",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: HexColor("#8d8d8d"),
            ),
          ),
          DropdownButton<String>(
            value: categoryValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: HexColor("#8d8d8d"),
            ),
            isExpanded: true,
            underline: Container(
              height: 2,
              color: HexColor("#ffffff"),
            ),
            iconSize: 30,
            borderRadius: BorderRadius.circular(20),
            onChanged: (String? value) {
              setState(() {
                categoryValue = value!;
              });
            },
            items: templist.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextField(
            controller: SubCategoryController.value,
            cursorColor: HexColor("#4f4f4f"),
            decoration: InputDecoration(
              fillColor: HexColor("#f0f3f1"),
              contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              hintStyle: GoogleFonts.poppins(
                fontSize: 15,
                color: HexColor("#8d8d8d"),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              _errorMessage,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          MyButton(
              buttonText: 'Add SubCategory',
              onPressed: () async {
                if(SubCategoryController.value.text!=null &&  categoryValue!="")
                {
                  await FirebaseFirestore.instance.collection("SubCategory").add({
                    "category": SubCategoryController.value.text,
                    "city": categoryValue,
                  }).then((value) {
                    SubCategoryController.value.text="";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sub Category Added")));
                  });
                }

              }),
        ],):t==2?
      ListView(
        children: templist.map((e) {
            return ListTile(
            title: Text(e),
          );
        }).toList(),
      ):
      ListView(
        children: tempsublist.map((e) {
          return ListTile(
            title: Text(e),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            t=value;
          });
          if(t==1)
            {
              CollectionReference users = FirebaseFirestore.instance.collection('Category');
              users.snapshots().listen((event) {
                print(event.docs);
                List<QueryDocumentSnapshot<Object?>> snapshot=event.docs;
                snapshot.forEach((element) {
                  Map? m=element.data() as Map?;
                  if(!templist.contains(m!['category']))
                    {
                      templist.add(m['category']);
                    }
                  print("${templist}");
                });
                categoryValue=templist.first;
                setState(() {

                });
              });

            }
          if(t==3)
          {
            CollectionReference users = FirebaseFirestore.instance.collection('SubCategory');
            users.snapshots().listen((event) {
              print(event.docs);
              List<QueryDocumentSnapshot<Object?>> snapshot=event.docs;
              snapshot.forEach((element) {
                Map? m=element.data() as Map?;
                if(!tempsublist.contains(m!['category']))
                {
                  tempsublist.add(m['category']);
                }
                print("${tempsublist}");
              });
              // categoryValue=templist.first;
              setState(() {

              });
            });

          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: t,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Sub Category"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Show Category"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Show Sub Category"),
        ],
      ),
    );
  }
}
