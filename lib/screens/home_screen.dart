import 'package:flutter/material.dart';
import 'package:flutter_custom_class_reactive_state_management_by_getx/widgets/student_data.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({Key? key,required this.title}) : super(key: key);
  // var studentData = StudentData();

  //make the entire class observable (second way)//
  final studentData = StudentData(name: 'radifa', age: 9).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=>
            // Text('The Name is: ${studentData.name}',
            // textScaleFactor: 1.3,
            // ),
            Text('The Name is: ${studentData.value.name}')
            ),

            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('Upper',textScaleFactor: 1.3,),
              // onPressed: ()=>studentData.name.value = StudentData().name.value.toString().toUpperCase(),
              onPressed: () =>
              studentData.update((studentData) {
                studentData!.name =studentData.name.toString().toUpperCase();
              })
            ),

          ],
        ),
      ),
    );
  }
}