import 'package:flutter/material.dart';

import '../model/emp_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.input}) : super(key: key);

  static const String id = "detail_page";

  final Employee input;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page", style: TextStyle(color: Colors.white,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(widget.input.employee_name + ' (' + widget.input.employee_age.toString() + ')',
                  style: TextStyle(color: Colors.black, fontSize: 20),),
                const SizedBox(height: 5,),
                Text(widget.input.employee_salary.toString() + '\$',
                  style: const TextStyle(color: Colors.black, fontSize: 18),),
              ],
            ),
          ),
        ],
      ),
    );
  }

}