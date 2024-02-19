import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
var wtcontroller= TextEditingController();
  var ftcontroller= TextEditingController();
  var incontroller=TextEditingController();
  var result= "";
  var bgcolor= Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            color: bgcolor,
            width: 300,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text('BMI', style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w700
                    ),),

                TextField(

                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight in kG'),

                        prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType:TextInputType.number ,
                ),


                SizedBox(height: 11,),
                TextField(

                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text('Enter your Height in feet'),

                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType:TextInputType.number ,
                ),

                SizedBox(height: 11,),

                TextField(

                  controller: incontroller,
                  decoration: InputDecoration(
                      label: Text('Now enter your inch'),

                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType:TextInputType.number ,
                ),

                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                 var wt=wtcontroller.text.toString();
                     var ft= ftcontroller.text.toString();
                 var inch= incontroller.text.toString();


                 if(wt!="" && ft!="" && inch!=""){


                   var iwt= int.parse(wt);
                   var ift= int.parse(ft);
                   var iinch= int.parse(inch);

                   var tinch= (ift*12)+iinch;
                   var tcm= tinch*2.54;
                   var tm=tcm/100;
                   var bmi=iwt/(tm*tm);
                   var msg;

                   if (bmi>25){

                     msg= "You are Over Weight !!";
                     bgcolor= Colors.red.shade400;

                   }
                   else if(bmi<18){

                     msg="You are Under Weight !!";
                         bgcolor=Colors.pink.shade300;

                   }
                   else{

                     msg= "You are Healthy !!";
                     bgcolor=Colors.green.shade200;
                   }
                   setState(() {
                     result= "$msg \n Your BMi is : ${bmi.toStringAsFixed(2)}";
                   });





                 }else{

                   setState(() {
                     result= "Please fill all the requires field";
                   });

                 }

                }, child: Text('Calculate'),),
                SizedBox(height: 12,),

                Text(result, style: TextStyle(fontSize: 19),),




              ],
            ),
          ),
        ),
      )
    );
  }
}
