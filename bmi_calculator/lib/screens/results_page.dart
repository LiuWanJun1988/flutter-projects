import 'file:///C:/Users/julmo/AndroidStudioProjects/bmi-calculator-flutter/lib/components/bottom_button.dart';
import 'file:///C:/Users/julmo/AndroidStudioProjects/bmi-calculator-flutter/lib/components/card_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {

  final String resultsBMI;
  final String numberBMI;
  final String descriptionBMI;

  const ResultsPage({Key key,@required this.resultsBMI,@required this.numberBMI,@required this.descriptionBMI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void returnRoute(){
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your result',
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
              flex: 5,
              child: CardWidget(
                colour: kActiveCardWidgetColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultsBMI.toUpperCase(),
                    style: kResultTextStyle,),
                    Text(numberBMI,
                    style: kBMITextStyle),
                    Text(descriptionBMI,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,)
                  ],
                ),
              )
          ),
          BottomButton(function: returnRoute, buttonText: 'RECALCULATE')
        ],
      ),
    );
  }
}
