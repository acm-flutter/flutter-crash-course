import 'package:flutter/material.dart';
import 'package:test_app/general_files/calc_results.dart';
import 'package:test_app/shared_methods.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var number1 = TextEditingController();
  var number2 = TextEditingController();
  var number1Node = FocusNode();
  var number2Node = FocusNode();
  double? result;
  List<String> operations = [];
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Basic Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //num1 text field
              SizedBox(
                height: 20,
              ),
              widget.result == null
                  ? SizedBox()
                  : Text(
                      widget.result.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: widget.number1Node,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(widget.number2Node);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "number can't be empty";
                          } else if (num.tryParse(value) == null) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                        controller: widget.number1,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          label: Text(
                            'enter a valid number',
                            style: TextStyle(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: widget.number2Node,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "number can't be empty";
                          } else if (num.tryParse(value) == null) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                        controller: widget.number2,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          label: Text(
                            'enter a valid number',
                            style: TextStyle(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'add', // Unique tag for addition
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                        widget.result = double.parse(widget.number1.text) +
                            double.parse(widget.number2.text).round();
                        widget.operations.add(
                            "${widget.number1.text} + ${widget.number2.text} = ${widget.result}");
                        setState(() {});
                      }
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'subtract', // Unique tag for subtraction
                    backgroundColor: Colors.blue,

                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                        widget.result = double.parse(widget.number1.text) -
                            double.parse(widget.number2.text).round();
                        widget.operations.add(
                            "${widget.number1.text} - ${widget.number2.text} = ${widget.result}");
                        setState(() {});
                      }
                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'multiply', // Unique tag for multiplication
                    backgroundColor: Colors.blue,

                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                        widget.result = double.parse(widget.number1.text) *
                            double.parse(widget.number2.text).round();
                        widget.operations.add(
                            "${widget.number1.text} * ${widget.number2.text} = ${widget.result}");
                        setState(() {});
                      }
                    },
                    child: Text(
                      'x',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'divide', // Unique tag for division
                    backgroundColor: Colors.blue,

                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                        widget.result = double.parse(widget.number1.text) /
                            double.parse(widget.number2.text).round();
                        widget.operations.add(
                            "${widget.number1.text} / ${widget.number2.text} = ${widget.result}");
                        setState(() {});
                      }
                    },
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                    goto(
                      context: context,
                      screen: CalcResults(
                        operations: widget.operations,
                      ),
                    );
                  }
                },
                child: Text('Show All Operations'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
