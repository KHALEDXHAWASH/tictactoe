import 'package:flutter/material.dart';
import 'package:tictactoe/Button.dart';
class board extends StatefulWidget {
  static const String routename = "board";

  @override
  State<board> createState() => _boardState();
}
int p1score=0;
int p2score=0;

class _boardState extends State<board> {
  List<String> boardindex = [
    ' ', ' ', ' ',
    ' ', ' ', ' ',
    ' ', ' ', ' '
  ];

  int cnt = 0;

  void click(index) {
    if (boardindex[index] == ' ') { // Ensure the cell is empty before updating
      if (cnt % 2 == 0) {
        boardindex[index] = 'x';
      } else {
        boardindex[index] = 'o';
      }
      cnt++;
      if(checkwinner('x')){
        p1score++;
        reset();
      }
      else if (checkwinner('o'))
      {

        p2score++;
        reset();

      }
      else if (cnt == 9) { // Check if all cells are filled
        // It's a draw
        reset();
      }
      setState(() {});

    }

  }
  bool checkwinner(String symbol) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (boardindex[i] == symbol && boardindex[i + 1] == symbol && boardindex[i + 2] == symbol) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (boardindex[i] == symbol && boardindex[i + 3] == symbol && boardindex[i + 6] == symbol) {
        return true;
      }
    }

    // Check diagonals
    if (boardindex[0] == symbol && boardindex[4] == symbol && boardindex[8] == symbol) {
      return true;
    }
    if (boardindex[2] == symbol && boardindex[4] == symbol && boardindex[6] == symbol) {
      return true;
    }

    return false;
  }
  void reset()
  {
    boardindex = [
      ' ', ' ', ' ',
      ' ', ' ', ' ',
      ' ', ' ', ' '
    ];
    cnt=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "xo game",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white], // Gradient background
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Row: Player Scores
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Semi-transparent white
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10), // Margin around the container
                padding: EdgeInsets.all(20), // Padding inside the container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("p1(x)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                        Text("$p1score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("p2(o)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                        Text("$p2score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Second Row: Buttons
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10), // Margin around the container
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Semi-transparent white
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: button(text: '${boardindex[0]}', index: 0, click: click)),
                    Expanded(child: button(text: '${boardindex[1]}', index: 1, click: click)),
                    Expanded(child: button(text: '${boardindex[2]}', index: 2, click: click)),
                  ],
                ),
              ),
            ),

            // Third Row: Buttons
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10), // Margin around the container
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Semi-transparent white
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: button(text: '${boardindex[3]}', index: 3, click: click)),
                    Expanded(child: button(text: '${boardindex[4]}', index: 4, click: click)),
                    Expanded(child: button(text: '${boardindex[5]}', index: 5, click: click)),
                  ],
                ),
              ),
            ),

            // Fourth Row: Buttons
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10), // Margin around the container
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Semi-transparent white
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: button(text: '${boardindex[6]}', index: 6, click: click)),
                    Expanded(child: button(text: '${boardindex[7]}', index: 7, click: click)),
                    Expanded(child: button(text: '${boardindex[8]}', index: 8, click: click)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}