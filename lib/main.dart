
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Calculator",
      theme:  ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title : 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "0";

  buttonPressed(String buttonText){
    if(buttonText == "AC" ){
      _output ="0";
      num1=0;
      num2=0;
      operand="";
    }

    else if (buttonText == '+' || buttonText ==  '-' || buttonText ==  '*'  || buttonText == '÷' ){
      num1 = double.parse(output);
      operand = buttonText ;
      _output = "0";
    }
    
    else if (buttonText == '.'){
      if(_output.contains('.')){
        print("Already contain decimal");
      }
      else{
        _output += ".";
      }
    }

    else if(buttonText == "="){
      num2 = double.parse(output);
      if (operand == '+' ) {
       _output = (num1+num2).toString();
      }
      if (operand == '-' ) {
       _output = (num1-num2).toString();
      }
      if (operand == '*' ) {
       _output = (num1*num2).toString();
      }
      if (operand == '÷' ) {
       _output = (num1/num2).toString();
      }
      //clear the screen and reset variables
      num1=0;
      num2=0;
      operand="";
  }

  else{
    _output = _output + buttonText;
  }
  print(_output);
  setState(() {
    output= double.parse(_output).toString();
  });
  }

  Widget buildButton(String buttonText){
  return Expanded(
     child: SizedBox(
      height: 70.0,
      child:Padding(
        padding: const EdgeInsets.all(2.0),
        child:OutlinedButton(
        child: Text(
          buttonText,
          style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,),
        ),
        onPressed:()=> buttonPressed(buttonText),
        ),
      ), 
      ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( title:const Text('Simple calculator')
    ),
      body: Container(
         child: Column(
        children:<Widget> [
           Container(
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.symmetric(vertical: 24.0,horizontal: 12.0),
            child: Text(output, style: TextStyle(fontSize: 38.0,fontWeight:FontWeight.bold,color: Colors.pinkAccent),)
          ),

           Expanded(
            child:Divider() 
            ),

            new Column(
              children: [
                new Row(
                  children:[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("÷"),
                  ],
                ),

                  new Row(
                  children:[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*"),
                  ],
                ),

                  new Row(
                  children:[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),

                 new Row(
                  children:[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                 new Row(
                  children:[
                    buildButton("AC"),
                    buildButton("="),
                  ],
                ),
              ],
            ),

        ],
      ),

    ),
    );
  }
}


// class SimpleCalculator extends StatefulWidget {
//   @override
//   _SimpleCalculatorState createState()=> _SimpleCalculatorState();
// }

// class _SimpleCalculatorState extends State<SimpleCalculator> {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar( title:const Text('Simple calculator')),
//       body: Column(
//         children:<Widget> [
//            Container(
//             alignment: Alignment.centerRight,
//             padding:const EdgeInsets.fromLTRB(10, 20,10,0),
//             child: const Text("0", style: TextStyle(fontSize: 38.0),)
//           ),
//            Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.fromLTRB(10, 20,10,0),
//             child: const Text("1", style: TextStyle(fontSize: 48.0),)
//           ), 

//           Expanded(
//             child:Divider() 
//             ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width * .75,
//                 child: Table(
//                   children: [
//                     TableRow(
//                       children:[
//                         Container(
//                           height:MediaQuery.of(context).size.height * 0.1 ,
//                           color: Color.fromRGBO(255, 82, 82, 1),
//                           child: TextButton(
//                               shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(0.0),
//                               side: BorderSide(
//                                 color:Colors.white,
//                                 width:1,
//                                 style: BorderStyle.solid,

//                               )
//                               ),
//                               style: Padding, 
//                               onPressed: (){
//                                   print('Text button taped successfuly !');
//                                 },
                              
//                           ),
//                         )
//                       ]
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),

//     );
//   }
// }