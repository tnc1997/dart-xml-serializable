import 'package:xml/xml.dart';

import '../example/bookshelf.dart' show Bookshelf;

void main(List<String> arguments) {
  final document = XmlDocument.parse(
    '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">XML Pocket Reference</title>
        <author>Simon St. Laurent</author>
        <author>Michael James Fitzgerald</author>
        <price></price>
      </book>
      <book>
        <title lang="english">HTML and XHTML Pocket Reference</title>
        <author>Jennifer Niederst Robbins</author>
        <price></price>
      </book>
    </bookshelf>''',
  );

  final bookshelf = Bookshelf.fromXmlElement(document.rootElement);
  print(bookshelf);

  final element = bookshelf.toXmlElement();
  print(element);
}
