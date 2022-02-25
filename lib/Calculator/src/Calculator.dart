import 'package:flutter/material.dart';

import '../Helper/Calculator.dart';

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({Key? key}) : super(key: key);

  @override
  _CalculatorMainState createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {
  TextEditingController calculatorInput = TextEditingController();
  Calculator calculator = Calculator();

  inputNumber(number){
    setState(() {
      final previousValue = "${calculatorInput.text}${number}";
      calculatorInput = TextEditingController(text: previousValue);
    });
  }


  setOperator(operator){
    //get the last character from calculator input
    final lastCharacter = calculatorInput.text[calculatorInput.text.length - 1];
    if(calculator.isNumeric(lastCharacter)){
      inputNumber(operator);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Calculator"),
              ),
              TextField(
                  controller: calculatorInput,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(title: "7", onTap: (){inputNumber(7);}),
                  CalculatorButton(title: "8", onTap: (){inputNumber(8);}),
                  CalculatorButton(title: "9", onTap: (){inputNumber(9);}),
                  CalculatorButton(title: "/", onTap: (){
                    setOperator("/");
                  },),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(title: "4",onTap: (){inputNumber(4);}),
                  CalculatorButton(title: "5",onTap: (){inputNumber(5);}),
                  CalculatorButton(title: "6", onTap: (){inputNumber(6);}),
                  CalculatorButton(title: "*",onTap: (){
                    setOperator("*");
                  },),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(title: "1", onTap: (){inputNumber(1);}),
                  CalculatorButton(title: "2", onTap: (){inputNumber(2);}),
                  CalculatorButton(title: "3", onTap: (){inputNumber(3);}),
                  CalculatorButton(title: "-", onTap: (){
                    setOperator("-");
                  },),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(title: ""),
                  CalculatorButton(title: "0",onTap: (){inputNumber(0);}),
                  CalculatorButton(title: ""),
                  CalculatorButton(title: "+", onTap: (){
                    setOperator("+");
                  },),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CalculatorButton(title: "=",onTap: (){
                    calculator.calculate(expression: calculatorInput.text);
                  },),
                ],),
            ],),
          ),
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String title;
  Function()? onTap;

   CalculatorButton({
    Key? key,
    required this.title,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 18 / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: buttonWidth,
          width: buttonWidth,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child:  Padding(
            padding:  EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
