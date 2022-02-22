import 'package:flutter/material.dart';
import 'package:todo_app/src/Constants.dart';
import 'package:todo_app/src/screens/Result.dart';
import 'package:todo_app/src/widgets/ReusableCard.dart';

enum Gender { male, female }

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Gender? gender = Gender.male;

  double _height = 0;
  double _weight = 0;

  setGender(Gender value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Result(height: _height, weight: _weight)));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: primaryColor),
              child: const Center(
                child: Text(
                  "Calculate",
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
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("BMI Calculator"),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableCard(
                            onTap: () {
                              setGender(Gender.male);
                            },
                            color: gender == Gender.male
                                ? selectedCardColor
                                : unselectedCardColor,
                            child: labeledIcon(title: "Male", icon: Icons.male),
                          ),
                          ReusableCard(
                            onTap: () {
                              setGender(Gender.female);
                            },
                            color: gender == Gender.female
                                ? selectedCardColor
                                : unselectedCardColor,
                            child: labeledIcon(
                                title: "Female", icon: Icons.female),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableCard(child: Column(
                            children: [
                              const Text("Height"),
                              const SizedBox(height: 10,),
                              Text("${_height.toInt().toString()} cm", style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                              Slider(
                                min: 0,
                                max: 250,
                                value: _height,
                                activeColor: primaryColor,
                                thumbColor: primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _height = value;
                                  });
                                },
                              ),
                            ],
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableCard(child: Column(
                            children: [
                              const Text("Weight"),
                              const SizedBox(height: 10,),
                              Text("${_weight.toInt().toString()} kg", style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              Slider(
                                min: 0,
                                max: 250,
                                value: _weight,
                                activeColor: primaryColor,
                                thumbColor: primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _weight = value;
                                  });
                                },
                              ),
                            ],
                          ),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget labeledIcon({IconData? icon, String title = ""}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 60),
        Text(title, style: const TextStyle(fontSize: 12))
      ],
    );
  }
}
