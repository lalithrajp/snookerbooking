import 'dart:async';
import 'dart:convert';
import 'dart:io';
class APIRequests{

  Future<String> apiPOSTRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    print("Raw response");
    print(response);
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print('Sent response:'+reply);
    return reply;
  }

}