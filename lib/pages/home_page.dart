import 'package:flutter/material.dart';
import 'package:http_network/service/log_service.dart';

import '../model/emp_model.dart';
import '../model/emplist_model.dart';
import '../service/network_service.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> items = [];

  void _showResponse(String response) {
    EmpList empList = Network.parseEmpList(response);
    setState(() {
      items = empList.data;
    });
  }

  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((response) =>
    {
      _showResponse(response!),
      LogService.w(response)
    });
  }

  @override
  void initState() {
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page", style: TextStyle(color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          },
        ));
  }

  Widget itemOfList(Employee emp) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name + "(" + emp.employee_age.toString() + ")",
              style: const TextStyle(color: Colors.black, fontSize: 20),),
            const SizedBox(height: 10,),
            Text(emp.employee_salary.toString() + "\$",
              style: const TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
      onTap: () {
        _openDetails(emp);
      },
    );
  }

  Future _openDetails(Employee emp) async {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return DetailPage(input: emp, key: null,);
        }));
  }
}