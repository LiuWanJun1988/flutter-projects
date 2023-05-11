import 'package:bitcoin_ticker/network_helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '9E54173C-8F91-4771-A854-01322BEFEA03';
const url = 'https://rest.coinapi.io/v1/exchangerate';


class CoinData {

  double roundDouble(dynamic number, int decimalPlaces) {
    var temp = number.toStringAsFixed(decimalPlaces);
    return double.parse(temp);
  }

  /*Future<dynamic> getCoinData() async {
    List<List<double>> coinExchangeRates = [];

    for(String cryptoName in cryptoList){
      print('$cryptoName');
      List<double> currencyExchangeRate = [];
      for(String currencyName in currenciesList){
        NetworkHelper networkHelper = NetworkHelper(
            '$url/$cryptoName/$currencyName?apikey=$apiKey');

        var newCoinExchangeRate = await networkHelper.getData();

        if(newCoinExchangeRate != null) {
          double roundedRate = roundDouble(newCoinExchangeRate['rate'], 2);
          //print('$roundedRate');
          currencyExchangeRate.add(roundedRate);
        }
        coinExchangeRates.add(currencyExchangeRate);
      }
      return coinExchangeRates;
    }*/
  Future<dynamic> getCoinRates(String currencyName) async {
    List<String> coinExchangeRates = [];

    for (String cryptoName in cryptoList) {
      NetworkHelper networkHelper = NetworkHelper(
          '$url/$cryptoName/$currencyName?apikey=$apiKey');

      var newCoinExchangeRate = await networkHelper.getData();
      if (newCoinExchangeRate != null) {
        double roundedRate = roundDouble(newCoinExchangeRate['rate'], 2);
        coinExchangeRates.add(roundedRate.toString());
      } else {
        coinExchangeRates.add('?');
      }
    }
    return coinExchangeRates;
  }
}
