import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  List<String> currencyExchangeRate = ['?', '?', '?'];
  CoinData coinData = CoinData();

  void getCoinData() async {
    try {
      currencyExchangeRate = await coinData.getCoinRates(selectedCurrency);
      setState(() {

      });
    }
    catch(e){
      print(e);
    }
  }

  DropdownButton<String> androidDropdown() {

    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i<currenciesList.length; i++){
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency);

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getCoinData();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() async {
          selectedCurrency = currenciesList[selectedIndex];
          getCoinData();
        });
      },
      children: pickerItems,
    );
  }

  @override
  initState() {
    super.initState();
    getCoinData();
  }

  Widget generateCryptoCards() {
    List<Widget> cryptoCards = [];

    for (int i=0; i<3; i++){
      cryptoCards.add(CryptoCard(currencyExchangeRate: currencyExchangeRate[i], selectedCurrency: selectedCurrency, cryptoName: cryptoList[i]));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: cryptoCards);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          generateCryptoCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    Key key,
    @required this.currencyExchangeRate,
    @required this.selectedCurrency,
    @required this.cryptoName
  }) : super(key: key);

  final String currencyExchangeRate;
  final String selectedCurrency;
  final String cryptoName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoName = $currencyExchangeRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
