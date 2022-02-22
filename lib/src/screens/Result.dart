import 'dart:developer';

import 'package:flutter/material.dart';

import '../Constants.dart';


var _bmiStore = [
  {
    "min": 0.0,
    "max": 15.9,
    "message": "Severely Underweight"
  },
  {
    "min": 16.0,
    "max": 18.4,
    "message": "Underweight"
  },
  {
    "min": 18.5,
    "max": 24.9,
    "message": "Normal"
  },
  {
    "min": 25.0,
    "max": 29.9,
    "message": "Overweight"
  },
  {
    "min": 30.0,
    "max": 34.9,
    "message": "Moderately Obese"
  },
  {
    "min": 35.0,
    "max": 39.9,
    "message": "Severely Obese"
  },
  {
    "min": 40.0,
    "max": double.infinity,
    "message": "Morbidly Obese"
  }
];

class Result extends StatefulWidget {
  const Result({Key? key,required this.height,required this.weight}) : super(key: key);

  final double height;
  final double weight;


  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double bmiResult = 0.0;

  _calculateBmi(){
    setState(() {
      bmiResult = widget.weight / widget.height / widget.height * 10000;
    });

    for (var element in _bmiStore) {
      double? min = element['min']??;
      double? max = element['max']??;
      // if(bmiResult > min! && bmiResult < max!){
      //     print(element);
      // }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calculateBmi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: primaryColor),
              child: const Center(
                child: Text(
                  "Calculate Again",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Result"),
                  ),
                  // Text(bmiResult.toInt().toString()
                ],
              ),
            ),
          )),
    );
  }
}
