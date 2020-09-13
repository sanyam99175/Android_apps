

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {      
  bool isCross=true;
  bool isCircle=true;
 
  String message="";
  List<String> gamestate;
  AssetImage cross=AssetImage("fltictactoe/images/cross.png");
  AssetImage circle=AssetImage("fltictactoe/images/circle.png");
  AssetImage edit=AssetImage("fltictactoe/images/edit.png");
  
  
  // initializing state of empty boxes
  @override
  void initState(){
    
    setState(() {
      super.initState();
      this.gamestate=[
        "empty","empty","empty",
        "empty","empty","empty",
        "empty","empty","empty"
      ];
      
      
    });
  }


  // playGame method
  playGame(int index){
    if(this.gamestate[index]=="empty"){
      setState(() {
        if(this.isCross){
          this.gamestate[index]="cross";
        }
        else
        {
          this.gamestate[index]="circle";
        }
        this.isCross=!this.isCross;
        this.isCircle=!this.isCircle;
       this.checkWin();
      });
    }
  }


  // Reset game method
  void resetGame()
  {
    setState(() {
      this.gamestate=[
         "empty","empty","empty",
        "empty","empty","empty",
        "empty","empty","empty"

      ];
    this.message="";
    });
  }


  // get image method
  AssetImage getImage(String Value){
    switch (Value) {
      case ('empty'):
         return edit;
         break;
      case ('cross'):
         return cross;
         break;
      case ('circle'):
         return circle;
         break;
      
    }

  }


  // check for win logic
  checkWin(){
    if((gamestate[0]!='empty') &&
        (gamestate[0]==gamestate[1]) && 
        (gamestate[1]==gamestate[2]))
        {
          setState(() {
            this.message='${this.gamestate[0]} wins';
           
          });
        }
    else if((gamestate[3]!='empty') &&
        (gamestate[3]==gamestate[4]) && 
        (gamestate[4]==gamestate[5]))
        {
          setState(() {
            this.message='${this.gamestate[3]} wins';
          
          });
        }
    else if((gamestate[6]!='empty') &&
        (gamestate[6]==gamestate[7]) && 
        (gamestate[7]==gamestate[8]))
        {
          setState(() {
            this.message='${this.gamestate[6]} wins';
      
          });
        }
    else if((gamestate[0]!='empty') &&
        (gamestate[0]==gamestate[3]) && 
        (gamestate[3]==gamestate[6]))
        {
          setState(() {
            this.message='${this.gamestate[0]} wins';
           
          });
        }
    else if((gamestate[1]!='empty') &&
        (gamestate[1]==gamestate[4]) && 
        (gamestate[4]==gamestate[7]))
        {
          setState(() {
            this.message='${this.gamestate[1]} wins';
         
          });
        }
    else if((gamestate[2]!='empty') &&
        (gamestate[2]==gamestate[5]) && 
        (gamestate[5]==gamestate[8]))
        {
          setState(() {
            this.message='${this.gamestate[2]} wins';
         
          });
        } 
    else if((gamestate[0]!='empty') &&
        (gamestate[0]==gamestate[4]) && 
        (gamestate[4]==gamestate[8]))
        {
          setState(() {
            this.message='${this.gamestate[0]} wins';
            
          });
        }
    else if((gamestate[2]!='empty') &&
        (gamestate[2]==gamestate[4]) && 
        (gamestate[4]==gamestate[6]))
        {
          setState(() {
            this.message='${this.gamestate[0]} wins';
        
          });
        }
        else if(!gamestate.contains('empty')){
          setState(() {
            this.message='Game Draw';
         
          });
        }
      

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
                itemCount: this.gamestate.length,
                itemBuilder: (context,i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: (){
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gamestate[i]),
                      ),
                    ),
                ),
            ),
          ),
          Container(
            
            padding: EdgeInsets.all(20.0),
            child: Text(message, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
            MaterialButton(
              color: Colors.purple,
              minWidth:300.0,
              height:50.0,
              child: Text("Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),),
              
              onPressed: (){
                this.resetGame();
              },
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text("A Project by Sanyam Arora",
                style: TextStyle(fontSize: 18.0),
                ),
              )

        ],
      ),
      
    );
  }
}