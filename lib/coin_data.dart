import 'package:http/http.dart' as http;
import 'dart:convert';

const apiHost = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = 'E186A5DC-D095-4012-B504-DDD05A7CD1E0';
const headers = {
  'X-CoinAPI-Key': 'apiKey',
  "Accept": "application/json",
};

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

class CoinData {
  // get exchange rate from coinapi
  Future<void> getExchangeRate(String currency, String cryptocurrency) async {
    var url = apiHost + cryptocurrency + '/' + currency;
    url += '?apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var rate = jsonDecode(response.body)['rate'].toDouble();
      return rate.round().toString();
    }
    return 0.0;
  }

  // end of exchange rate
}
