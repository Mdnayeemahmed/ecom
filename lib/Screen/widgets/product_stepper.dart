import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class productstepper extends StatefulWidget {
  const productstepper({Key? key}) : super(key: key);

  @override
  State<productstepper> createState() => _productstepperState();
}

class _productstepperState extends State<productstepper> {
  int _currentvalue = 1;
  late TextEditingController _steppercontroller =
      TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: InkWell(
            onTap: () {
              if (_currentvalue > 1) {
                _currentvalue--;
                _steppercontroller.text = _currentvalue.toString();
              }
            },
            child: Container(
              decoration: BoxDecoration(color: primaryColor),
              child: Icon(
                Icons.remove,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 30,
          child: TextField(
            controller: _steppercontroller,
            enabled: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child:InkWell(
            onTap: () {
              if (_currentvalue < 10) {
                _currentvalue++;
                _steppercontroller.text = _currentvalue.toString();
              }
            },
            child: Container(
              decoration: BoxDecoration(color: primaryColor),
              child: Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
