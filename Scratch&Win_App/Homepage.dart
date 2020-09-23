import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // import images
  AssetImage circle = AssetImage("flscratchwin/images/circle.png");
  AssetImage rupee = AssetImage("flscratchwin/images/rupee.png");
  AssetImage sad = AssetImage("flscratchwin/images/sadFace.png");
  String message="";
  int count =1;

  // get an array
  List<String> itemArray;
  int luckynumber;

  // init array with 25 elements
  @override
  void initState()
    {
      super.initState();
      itemArray = List<String>.generate(16, (index) => "empty");
      generateRandomNumber();
     }

   generateRandomNumber(){
     int random = Random().nextInt(16);
     setState(() {
       luckynumber=random;
     });
   }

  // define a getImage method

  AssetImage getImage(int index){
    String currentstate = itemArray[index];
    switch (currentstate) {
      case "rupee":
            return rupee;
            break;
      case "sad":
            return sad;
            break;
    }
    return circle;
  }
  

  // play game method

  playGame(int index){
    if(luckynumber == index){
      setState(() {
        itemArray[index]="rupee";
      });
      if(count==1)
      {
        this.message="Outstanding, only $count trial !!";
      }
      else if(count == 2)
      {
        this.message="Excellent, just $count trials !!";
      }
      else if(count == 3)
      {
        this.message="Very good, you took $count trials !! ";
      }
      else if(count == 4)
      {
        this.message="good, you took $count trials !!";
      }
      else if(count == 5){
      this.message="You took $count trials to win !!";
      }
    }
    else{
      setState(() {
        itemArray[index]="sad";
        if(count == 5)
        {
          this.message="Sorry!! Better luck next time";
          showAll();
        }
      });
      count=count+1;
    }
  }

  // showall
  
  showAll(){
    setState(() {
      itemArray = List<String>.filled(16, "sad");
      itemArray[luckynumber]= "rupee";
    });
  }
  
  // Reset all

  resetGame(){
    setState(() {
      itemArray = List<String>.filled(16, "empty");
    });
    message="";
    count=1;
    generateRandomNumber();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              crossAxisSpacing: 20.0 ,
              mainAxisSpacing: 20.0) ,
              itemCount: itemArray.length,
               itemBuilder: (context,i) => SizedBox(
                 width: 30.0,
                 height: 30.0,
                 child: RaisedButton(
                   onPressed: (){
                     this.playGame(i);
                   },
                 child: Image(
                   image: this.getImage(i),
                   ),
                 ),
               ),
          ),
          ),
           Container(
            
            padding: EdgeInsets.all(20.0),
            child: Text(message, style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: (){
                this.showAll();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text('Show All'),
               ),
          ),
                 Container(
            
            margin: EdgeInsets.all(20.0),
            
            child: RaisedButton(
              onPressed: (){
                this.resetGame();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text('Reset All'),
               ),
          ),


        ],
      ),
      
    );
  }
}