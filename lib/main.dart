import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';

void main() {
  runApp(new application());
}

class application extends StatefulWidget {
  @override
  _applicationState createState() => _applicationState();
}

class ControlMechanics {
  String _titleText = "";
  int _incrementValue = 0;

  ControlMechanics() {
    _titleText = "Press the button to start.";
    _incrementValue = 0;
  }

  void setTitleText(String _text) {
    this._titleText = _text;
  }

  void setIncrementValue(int _value) {
    this._incrementValue = _value;
  }

  String getTitleText() {
    return _titleText;
  }

  int getIncrementValue() {
    return _incrementValue;
  }
}

class AchievementMechanics {
  bool reached10, reached50, reached100, reachedn10, reachedn50, reachedn100;

  AchievementMechanics() {
    reached10 = false;
    reached50 = false;
    reached100 = false;
    reachedn10 = false;
    reachedn50 = false;
    reachedn100 = false;
  }

  void setReach10(bool flag) {
    this.reached10 = flag;
  }

  void setReach50(bool flag) {
    this.reached50 = flag;
  }

  void setReach100(bool flag) {
    this.reached100 = flag;
  }

  void setReachN10(bool flag) {
    this.reachedn10 = flag;
  }

  void setReachN50(bool flag) {
    this.reachedn50 = flag;
  }

  void setReachN100(bool flag) {
    this.reachedn100 = flag;
  }

  bool getReach10() {
    return this.reached10;
  }

  bool getReach50() {
    return this.reached50;
  }

  bool getReach100() {
    return this.reached100;
  }

  bool getReachN10() {
    return this.reachedn10;
  }

  bool getReachN50() {
    return this.reachedn50;
  }

  bool getReachN100() {
    return this.reachedn100;
  }
}

class _applicationState extends State<application> {
  // Variables
  String _hexColor;

  // Objects
  ControlMechanics opt = new ControlMechanics();
  AchievementMechanics ach = new AchievementMechanics();

  // Methods
  void incrementor() {
    setState(() {
      int currentIncrementValue = opt.getIncrementValue();
      int newIncrementValue = currentIncrementValue + 1;
      opt.setIncrementValue(newIncrementValue);
    });
  }

  void decrementor() {
    setState(() {
      int currentIncrementValue = opt.getIncrementValue();
      int newIncrementValue = currentIncrementValue - 1;
      opt.setIncrementValue(newIncrementValue);
    });
  }

  void setTitleText() {
    int currentIncrementValue = opt.getIncrementValue();
    if (currentIncrementValue != 0) {
      opt.setTitleText(
          "You have pressed the button $currentIncrementValue times.");
    }
    if (currentIncrementValue == 0) {
      opt.setTitleText("Press on either of the buttons below to resume.");
    }
  }

  void resetApp() {
    setState(() {
      opt.setIncrementValue(0);
      opt.setTitleText("Press on either of the buttons below to begin!");
      ach.setReach10(false);
      ach.setReach50(false);
      ach.setReach100(false);
      ach.setReachN10(false);
      ach.setReachN50(false);
      ach.setReachN100(false);
      _hexColor = "#FFFFFF";
    });
  }

  void positiveMilestoneChecker() {
    switch (opt.getIncrementValue()) {
      case 10:
        if (!ach.getReach10()) {
          opt.setTitleText(
              "Nice job! You have clicked for 10 times straight in the positive direction.");
          ach.setReach10(true);
        }
        break;
      case 50:
        if (!ach.getReach50()) {
          opt.setTitleText(
              "Awesome! You have clicked for 50 times continuously in the positive direction.");
          ach.setReach50(true);
        }
        break;
      case 100:
        if (!ach.getReach100()) {
          opt.setTitleText(
              "A hundred clicks in the positive direction... You are persistent!");
          ach.setReach100(true);
        }
        break;
    }
  }

  void negativeMilestoneChecker() {
    switch (opt.getIncrementValue()) {
      case -10:
        if (!ach.getReachN10()) {
          opt.setTitleText(
              "Good job! You have clicked for 10 times straight in the negative direction.");
          ach.setReachN10(true);
        }
        break;
      case -50:
        if (!ach.getReachN50()) {
          opt.setTitleText(
              "Marvellous! You have clicked for 50 times continuously in the negative direction.");
          ach.setReachN50(true);
        }
        break;
      case -100:
        if (!ach.getReachN100()) {
          opt.setTitleText(
              "A hundred clicks in the negative direction... You are tough!");
          ach.setReachN100(true);
        }
        break;
    }
  }

  String colorRandomizer() {
    var _hexDigit = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F"
    ];

    final _random = new Random();

    String output = "#" +
        _hexDigit[_random.nextInt(_hexDigit.length)] +
        _hexDigit[_random.nextInt(_hexDigit.length)] +
        _hexDigit[_random.nextInt(_hexDigit.length)] +
        _hexDigit[_random.nextInt(_hexDigit.length)] +
        _hexDigit[_random.nextInt(_hexDigit.length)] +
        _hexDigit[_random.nextInt(_hexDigit.length)];
    return _hexColor = output;
  }

  @override
  void initState() {
    opt.setTitleText("Press on either of the buttons below to begin!");
    _hexColor = "#FFFFFF";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Incrementor",
        home: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.amber,
              title: new Text("Incrementor"),
            ),
            body: new Container(
                color: HexColor(_hexColor),
                child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      new Text(opt.getTitleText()),
                      new Text(""),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                              onPressed: () {
                                incrementor();
                                setTitleText();
                                positiveMilestoneChecker();
                                colorRandomizer();
                              },
                              child: new Text("Click me to add to counter")),
                          new RaisedButton(
                            onPressed: () {
                              decrementor();
                              setTitleText();
                              negativeMilestoneChecker();
                              colorRandomizer();
                            },
                            child:
                                new Text("Click me to subtract from counter"),
                          ),
                        ],
                      ),
                      new Text(""),
                      new RaisedButton(
                          onPressed: () {
                            resetApp();
                          },
                          child: new Text("Click me to reset"))
                    ])))));
  }
}
