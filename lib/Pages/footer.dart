import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Footerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: Card(
          child:Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text('I am a Customizable footer!!')
          ),
        )
    );
  }

  void main(List<String> arguments) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'http://192.168.0.105/PHPAPI/API/product/read.php';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
     // var jsonResponse = convert.jsonDecode(response.body);
    //  var itemCount = jsonResponse['totalItems'];
      print('Number of books about http:.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}