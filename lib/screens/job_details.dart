import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_html/flutter_html.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

class Job_details extends StatefulWidget {
  final String idd;
  final String date;
  final String salary;
  final String company;
  final String category;
  final String vacancy;
  final String role;
  final String location;
  final String type;
  final String experience;
  final String gender;
  final String qualification;
  final String discription;
  final String sector;
  final String call_hr;

   const Job_details({Key? key,
     required this.idd,
     required this.date,
     required this.company,
     required this.role,
     required this.vacancy,
     required this.salary,
     required this.location,
     required this.category,
     required this.type,
     required this.experience,
     required this.gender,
     required this.qualification,
     required this.sector,
     required this.discription,
     required this.call_hr
   }) : super(key: key);

  @override
  State<Job_details> createState() => _Job_detailsState();
}

class _Job_detailsState extends State<Job_details> {
  List<dynamic>? listres;
  String a='' ;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Job Details',style: TextStyle(color: Colors.black,fontSize: 25),),
                    ),
                  )
                ],
              ),
              height: 80,width: double.infinity,color: Colors.white,),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 50,right: 10),
              child: Align(alignment: Alignment.topLeft,
                child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Role: ",
                        style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(widget.role.toUpperCase(),
                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7,right: 20),
              child: Align(alignment: Alignment.topLeft,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Text("Date: ",
                          style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text(widget.date,
                          style: TextStyle(color: Colors.black,fontSize: 12,),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Job Id: ",
                          style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text(widget.idd,
                          style: TextStyle(color: Colors.black,fontSize: 12,),),
                      ],
                    ),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7,right: 10),
              child: Align(alignment: Alignment.topLeft,
                child: SingleChildScrollView(scrollDirection:Axis.horizontal ,
                  child: Row(
                    children: [
                      Text("Company: ",
                        style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(widget.company,
                        style: TextStyle(color: Colors.black,fontSize: 12,),),
                    ],
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                      child: Text("Location: ",
                        style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 5,),
                    Align(alignment: Alignment.topLeft,
                      child: Text(widget.location,
                        style: TextStyle(color: Colors.black,fontSize: 12,),),
                    ),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Salary: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.salary,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Qualification: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.qualification,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Vacancy: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.vacancy,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Gender: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.gender,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Category: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.category,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Type: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.type,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Experience: ",
                        style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(widget.experience,
                        style: TextStyle(color: Colors.black,fontSize: 12,),),
                    ],
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Sector: ",
                      style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(widget.sector,
                      style: TextStyle(color: Colors.black,fontSize: 12,),),
                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 20,top: 7),
              child: Align(alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text("Description: ",textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Align(alignment: Alignment.topLeft,
                      child:
                      Html(data:HtmlUnescape().convert(widget.discription)),

                      // Text(HtmlUnescape().convert(widget.discription),
                      //   style: TextStyle(color: Colors.black,fontSize: 12,),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(onPressed: () {
                _makePhoneCall(widget.call_hr);
              },
              color: Colors.blue,
                child: Text("Apply now",style: TextStyle(color: Colors.white),),
              ),
            )

          ],
        ),
      ),

    );
  }
}
