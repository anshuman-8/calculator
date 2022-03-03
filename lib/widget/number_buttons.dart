import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  //const NumberButton({Key? key}) : super(key: key);

  final Function handler;

  NumberButton(this.handler);

  var row1 = ['1', '2', '3', '+'];
  var row2 = ['4', '5', '6', '-'];
  var row3 = ['7', '8', '9', 'x'];
  var row4 = ['e', '0', 'd', '/'];

  @override
  Widget build(BuildContext context) {
    final children1 = <Widget>[];
    final children2 = <Widget>[];
    final children3 = <Widget>[];
    final children4 = <Widget>[];

    for (var bn in row1) {
      children1.add(
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.pink[100];
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.teal[100];
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.cyan[200];
              }
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: () {
            handler(bn);
          },
          child: Text(
            bn,
            style: const TextStyle(fontSize: 35),
          ),
        ),
      );
    }
    for (var ele2 in row2) {
      children2.add(
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.pink[100];
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.teal[100];
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.cyan[200];
              }
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: () {
            handler(ele2);
          },
          child: Text(
            ele2,
            style: const TextStyle(fontSize: 35),
          ),
        ),
      );
    }
    for (var ele3 in row3) {
      children3.add(
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.pink[100];
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.teal[100];
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.cyan[200];
              }
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: () {
            handler(ele3);
          },
          child: Text(
            ele3,
            style: const TextStyle(fontSize: 35),
          ),
        ),
      );
    }
    for (var ele4 in row4) {
      children4.add(
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.pink[100];
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.teal[100];
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.cyan[200];
              }
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: () {
            handler(ele4);
          },
          child: ele4 == 'd' || ele4 == 'e'
              ? ele4 == 'd'
                  ? Icon(Icons.backspace_outlined)
                  : Icon(Icons.drag_handle_rounded)
              : Text(
                  ele4,
                  style: TextStyle(fontSize: 35),
                ),
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Divider(
            color: Colors.black87,
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children1,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children2,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children3,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children4,
          ),
        ],
      ),
    );
  }
}
