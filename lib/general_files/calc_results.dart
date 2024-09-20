import 'package:flutter/material.dart';

class CalcResults extends StatelessWidget {
  CalcResults({super.key, required this.operations});
  List<String> operations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            color: Colors.blueAccent,
            child: Center(
                child: Text(
              operations[index],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: operations.length,
        ),
      ),
    );
  }
}
