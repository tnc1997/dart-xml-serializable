import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'xml_serializable_example.g.dart';

void main() {
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

@annotation.XmlRootElement(name: 'book')
@annotation.XmlSerializable(createMixin: true)
class Book with _$BookXmlSerializableMixin {
  @annotation.XmlElement(name: 'title')
  Title? title;

  @annotation.XmlElement(name: 'author')
  List<String>? authors;

  @annotation.XmlElement(name: 'price', isSelfClosing: false)
  String? price;

  Book({
    this.title,
    this.authors,
    this.price,
  });

  factory Book.fromXmlElement(XmlElement element) =>
      _$BookFromXmlElement(element);

  @override
  String toString() {
    return 'Book{title: $title, authors: $authors, price: $price}';
  }
}

@annotation.XmlRootElement(name: 'bookshelf')
@annotation.XmlSerializable(createMixin: true)
class Bookshelf with _$BookshelfXmlSerializableMixin {
  @annotation.XmlElement(name: 'book')
  List<Book>? books;

  @annotation.XmlElement(name: 'price', includeIfNull: false)
  String? price;

  Bookshelf({
    this.books,
    this.price,
  });

  factory Bookshelf.fromXmlElement(XmlElement element) =>
      _$BookshelfFromXmlElement(element);

  @override
  String toString() {
    return 'Bookshelf{books: $books, price: $price}';
  }
}

@annotation.XmlRootElement(name: 'title')
@annotation.XmlSerializable(createMixin: true)
class Title with _$TitleXmlSerializableMixin {
  @annotation.XmlAttribute(name: 'lang')
  String? lang;

  @annotation.XmlText()
  String? text;

  Title({
    this.lang,
    this.text,
  });

  factory Title.fromXmlElement(XmlElement element) =>
      _$TitleFromXmlElement(element);

  @override
  String toString() {
    return 'Title{lang: $lang, text: $text}';
  }
}
