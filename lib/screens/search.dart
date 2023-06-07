import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webangle/screens/job_details.dart';
import '../utils/constant.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  List<dynamic>? listres;
  List <dynamic>? _founduser=[];

  List<dynamic>? listress;
  String? iddd;


  Future<void> fetchData() async {
    Map mapres;
    final response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      // print(response.body);\

      setState(() {
        // set
        mapres=json.decode(response.body);
        listres=mapres['data'];
        print(listres);
      });
      // Handle the successful response here
      // You can parse the response body using the appropriate JSON parsing library
    } else {
      // Handle the error response here
    }
  }



  Future<void> fetchDataa() async {
    Map mapres;
    final response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      // print(response.body);\

      setState(() {
        // set
        mapres=json.decode(response.body);
        listres=mapres['data'];
        print(listres);
      });
      // Handle the successful response here
      // You can parse the response body using the appropriate JSON parsing library
    } else {
      // Handle the error response here
    }
  }
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = listres!.cast<Map<String, dynamic>>();
    } else {
      results = listres!
          .where((user) =>
          user["role"].toLowerCase().contains(enteredKeyword.toLowerCase())).cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _founduser = results;
      print(_founduser);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    fetchDataa();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,

          title: Text('Search',style: TextStyle(color: Colors.black,fontSize: 20),),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  // prefix: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _founduser!.isNotEmpty
                  ? ListView.builder(
                itemCount: _founduser!.length,
                itemBuilder: (context, index) => Card(color: Colors.blue.shade50,
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Job_details(
                        idd:_founduser![index]['id'],
                        date:_founduser![index]['date'],
                        company:_founduser![index]['company'],
                        role:_founduser![index]['role'],
                        vacancy:_founduser![index]['vacancy'],
                        salary:_founduser![index]['salary'],
                        location:_founduser![index]['location'],
                        category:_founduser![index]['category'],
                        type:_founduser![index]['type'],
                        experience:_founduser![index]['experience'],
                        gender:_founduser![index]['gender'],
                        qualification:_founduser![index]['qualification'],
                        sector:_founduser![index]['sector'],
                        discription:_founduser![index]['discription'],
                        call_hr:_founduser![index]['call_hr'],
                      )));
                    },
                    isThreeLine: true,
                    style: ListTileStyle.list,
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    leading: Container(height: 50,width: 50,
                      child: Center(child:Image.asset("assets/job.png")),
                    ),
                    title: Text(_founduser![index]['role']),
                    subtitle: Text(_founduser![index]['company']),
                    trailing: Text(_founduser![index]['salary']),

                  ),
                ),
              )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                'Please search with a valid one',
                style: TextStyle(fontSize: 15),
              ),
                  ),
            ),


          ],
        ),

      ),
    );
  }
}
