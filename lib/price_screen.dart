import 'dart:convert';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String price = '';

  String selectedcurrrency = 'USD';

  ////data recieving method

  Future newprice() async {
    Response response = await get(Uri.parse(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$selectedcurrrency'));
    String data = response.body;
    var decodedata = jsonDecode(data);
    price = decodedata['main']['high'];
  }

  ///data recieving end

  ////this is gonna work

  List<DropdownMenuItem> getdropdownitems() {
    List<DropdownMenuItem<String>> dropdownitems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      setState(() {
        selectedcurrrency = currency;
        newprice();
      });

      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  //// working dropdownmenu item end

  ////method for the picker

  List<Text> getpickeritems() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      Text(currency);
      pickerItems.add(Text(currency));
      setState(() {
        selectedcurrrency = currency.toString();
      });
    }
    return pickerItems;
  }

  ////method for the picker end

  /*List<DropdownMenuItem> getdropdownitems() {
    List<DropdownMenuItem<dynamic>> dropdownitems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      // print(currenciesList[i]);
      String currency = currenciesList[i];
     /* var newitem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(newitem);
      */
      dropdownitems.add(
        DropdownMenuItem(
            child: Text(currency),
          value: currency,
        ),
      );
    }
    return dropdownitems;
  }*/
  /* ////chtgpt
  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    List<String> items = [
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
    List<DropdownMenuItem<String>> menuItems = [];
    for (String item in items) {
      menuItems.add(
        DropdownMenuItem(
          child: Text(item),
          value: item,
        ),
      );
    }
    return menuItems;
  }

  ///cht gpt end
*/
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
          Padding(
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
                  '1 BTC = $price $selectedcurrrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            //defult picker
            child: DropdownButton(
              value: selectedcurrrency,
              items: getdropdownitems(),
              onChanged: (value) {
                setState(() {
                  selectedcurrrency = value.toString();
                });
                print(value);
              },
            ),
            //defualt picker end
            //cupertino
            /*
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedindex) {
                print(selectedindex);
              },
              children: getpickeritems(),
            ),
            */
            //cupertino end
          ),
        ],
      ),
    );
  }
}
