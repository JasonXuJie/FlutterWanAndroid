import 'package:html/parser.dart';

String parseHtml(String html){
  var document = parse(html);
  return document.body.text;
}

