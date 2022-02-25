class Calculator {
  List<int> _numberSequence = [];
  List<String> _operators = [];
  String _gatheredNumber = "";

  calculate({String? expression}){
     for(int i = 0; i< expression!.length; i++){
        final char = expression[i];
        print(char);
        if(isNumeric(char)){
          _gatheredNumber = "$_gatheredNumber$char";
          print(_gatheredNumber);
        }else{
          // _addNumberInSequence(_gatheredNumber);
          // _addOperatorInSequence(char);
          print(_gatheredNumber);
          _clearGatheredNumber();
        }
     }
     _clearCalculatorCache();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  _addNumberInSequence(num){
    _numberSequence.add(int.parse(num));
  }

  _addOperatorInSequence(operator){
    _operators.add(operator);
  }

  _clearGatheredNumber(){
    _gatheredNumber = "";
  }

  _clearCalculatorCache(){
    _gatheredNumber = "";
    _numberSequence.clear();
    _operators.clear();
  }
}