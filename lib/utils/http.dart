import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as ioHttp;

enum HttpRequestType { GET, POST, DELETE, UPDATE, PATCH, PUT }

const String header_key = '';

Map<String, String> headers = {};

http.Client myClient(url) {
  var ioClient = new HttpClient();
  return ioHttp.IOClient(ioClient);
}

doPost(String url, String body, f(http.Response response)) async {
  await myClient(url)
      .post(Uri.parse(url), headers: headers, body: body)
      .then((res) => dealResponse(response: res, f: f, url: url));
}

doGet(String url, f(http.Response response)) async {
  await myClient(url).get(Uri.parse(url), headers: headers).then((res) => dealResponse(response: res, f: f, url: url));
}

dealResponse({
  required http.Response response,
  required f(http.Response response),
  url,
}) {
  //fixme 增加处理sentry的接口
  switch (response.statusCode) {
    case 401:
      print(jsonDecode(response.body));
      break;
    case 200:
    default:
      f(response);
      break;
  }
}
