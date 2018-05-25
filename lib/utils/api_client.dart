import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class APIClient {
  final String server;

  APIClient(this.server);

  getData(String url, params) async {
    var httpClient = new HttpClient();
    var uri = new Uri.https(server, url, params);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      var jsonRes = await response.transform(UTF8.decoder).join();
      var data = json.decode(jsonRes);
      return data;
    } else {
      print('Error while getting data:\nHttp status ${response.statusCode}');
      return null;
    }
  }

  postData(String url, body, params, bool secured) async {
    var uri;

    if (secured) {
      uri = new Uri.https(server, url, params);
    } else {
      uri = new Uri.http(server, url, params);
    }

    String data = json.encode(body);

    var response = await http.post(uri,
        body: data, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
    if (response.statusCode == HttpStatus.OK) {
      print("Response body: ${response.body}");
    } else {
      print('Error while posting data:\nHttp status ${response.statusCode}');
      return null;
    }
  }
}
