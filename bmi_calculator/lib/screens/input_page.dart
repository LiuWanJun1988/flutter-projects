import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/card_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/card_widget.dart';
import '../constants.dart';

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  void activateMaleGender(){
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void activateFemaleGender(){
    setState(() {
      selectedGender = Gender.female;
    });
  }

  void addWeight(){
    setState(() {
      weight++;
    });
  }

  void subtractWeight(){
    setState(() {
      weight--;
    });
  }

  void addAge(){
    setState(() {
      age++;
    });
  }

  void subtractAge(){
    setState(() {
      age--;
    });
  }

  void changeRoute(){
    CalculatorBrain calc = CalculatorBrain(height, weight);

    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(numberBMI: calc.calculateBMI(), descriptionBMI: calc.getInterpretation(), resultsBMI: calc.getResult())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                    children: [
                      Expanded(
                        child: CardWidget(
                          colour: selectedGender == Gender.male ? kActiveCardWidgetColor : kInactiveCardWidgetColor,
                          tapReaction: (){
                            activateMaleGender();
                          },
                          cardChild: CardContent(
                              icon: FontAwesomeIcons.mars,
                              iconText: 'MALE'
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardWidget(
                            colour: selectedGender == Gender.female ? kActiveCardWidgetColor : kInactiveCardWidgetColor,
                            tapReaction: (){
                              activateFemaleGender();
                            },
                            cardChild: CardContent(
                              icon: FontAwesomeIcons.venus,
                              iconText: 'FEMALE',
                            )
                        ),
                      ),
                    ]
                ),
              ),
              Expanded(
                child: CardWidget(
                  colour: kActiveCardWidgetColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.toInt();
                              });
                            }
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                    children: [
                      Expanded(
                        child: CardWidget(
                          colour: kActiveCardWidgetColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT',
                                  style: kLabelTextStyle),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      function: subtractWeight,
                                    ),
                                    SizedBox(
                                        width: 10.0
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      function: addWeight,
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardWidget(
                          colour: kActiveCardWidgetColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE',
                                  style: kLabelTextStyle),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      function: subtractAge,
                                    ),
                                    SizedBox(
                                        width: 10.0
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      function: addAge,
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              ),
              BottomButton(function: changeRoute, buttonText: 'CALCULATE')
            ]
        )
    );
  }
}


