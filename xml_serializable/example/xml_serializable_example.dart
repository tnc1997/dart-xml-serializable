import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'xml_serializable_example.g.dart';

void main() {
  final document = XmlDocument.parse(
    '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">Growing a Language</title>
        <price>29.99</price>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
      <price>132.00</price>
    </bookshelf>''',
  );

  final bookshelf = Bookshelf.fromXmlElement(document.rootElement);
  print(bookshelf);

  final element = bookshelf.toXmlElement();
  print(element);
}

@annotation.XmlRootElement(name: 'book')
@annotation.XmlSerializable()
class Book {
  @annotation.XmlElement(name: 'price')
  Price price;

  @annotation.XmlElement(name: 'title')
  Title title;

  Book({
    this.price,
    this.title,
  });

  factory Book.fromXmlElement(XmlElement element) =>
      _$BookFromXmlElement(element);

  @override
  String toString() {
    return 'Book{price: $price, title: $title}';
  }

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'bookshelf')
@annotation.XmlSerializable()
class Bookshelf {
  @annotation.XmlElement(name: 'book')
  List<Book> books;

  @annotation.XmlElement(name: 'price')
  Price price;

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

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'price')
@annotation.XmlSerializable()
class Price {
  @annotation.XmlText()
  String text;

  Price({
    this.text,
  });

  factory Price.fromXmlElement(XmlElement element) =>
      _$PriceFromXmlElement(element);

  @override
  String toString() {
    return 'Price{text: $text}';
  }

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PriceBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PriceBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String> namespaces = const {},
  }) =>
      _$PriceToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String> namespaces = const {},
  }) =>
      _$PriceToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String> namespaces = const {},
  }) =>
      _$PriceToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'title')
@annotation.XmlSerializable()
class Title {
  @annotation.XmlAttribute(name: 'lang')
  String lang;

  @annotation.XmlText()
  String text;

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

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleToXmlElement(
        this,
        namespaces: namespaces,
      );
}
