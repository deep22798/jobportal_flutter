import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webangle/screens/job_details.dart';
import 'package:webangle/utils/constant.dart';
import 'package:get/get.dart';
class Dashboard extends StatefulWidget {

   Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   List<dynamic>? listres;
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
   Future<bool> showExitPopup() async {
     return await showDialog(
       context: context,
       builder: (context) => AlertDialog(
         title: Text('Exit App',style: TextStyle(color: Colors.black,fontSize: 20),),
         content: Text('Do you want to exit App?',style: TextStyle(color: Colors.black,fontSize: 15),),
         actions:[
           ElevatedButton(
             onPressed: () => Navigator.of(context).pop(false),
             child:Text('No'),
           ),
           ElevatedButton(
             onPressed: () => Navigator.of(context).pop(true),
             child:Text('Yes'),
           ),
         ],
       ),
     )??false;
   }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('The HR India',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
              height: 80,width: double.infinity,color: Colors.white,),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
              child: InkWell(
                onTap: (){
                  Get.toNamed('/search');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),
                  height: 50,width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Search...."),
                          Icon(Icons.search)
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Align(alignment: Alignment.topLeft,
                child: Text("All Jobs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            ),

            listres==null?Center(child: CircularProgressIndicator(color: Colors.blue,)):Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listres!.length,
                itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  elevation: 2,color: Colors.blue.shade50,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Job_details(
                          idd:listres![index]['id'],
                          date:listres![index]['date'],
                          company:listres![index]['company'],
                          role:listres![index]['role'],
                          vacancy:listres![index]['vacancy'],
                          salary:listres![index]['salary'],
                          location:listres![index]['location'],
                          category:listres![index]['category'],
                          type:listres![index]['type'],
                        experience:listres![index]['experience'],
                        gender:listres![index]['gender'],
                        qualification:listres![index]['qualification'],
                        sector:listres![index]['sector'],
                        discription:listres![index]['discription'],
                        call_hr:listres![index]['call_hr'],
                      )));
                    },
                    isThreeLine: true,
                    style: ListTileStyle.list,
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    leading: Container(height: 50,width: 50,
                    child: Center(child:Image.asset("assets/job.png")),
                    ),
                    title: Text(listres![index]['role']),
                    subtitle: Text(listres![index]['company']),

                    trailing: Text(listres![index]['salary']),

                  ),
                ),
              );
              },),
            ),
          ],
        ),

      ),
    );
  }
}
