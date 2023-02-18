# XML Serializable

[![Pub Version](https://img.shields.io/pub/v/xml_serializable)](https://pub.dev/packages/xml_serializable)

Provides [build] builders for handling XML.

The builders generate code when they find members annotated with classes defined in [xml_annotation].

## Getting Started

1. Define the XML document that you would like to serialize.
   ```xml
   <?xml version="1.0"?>
   <bookshelf>
     <book>
       <title lang="English">XML Pocket Reference</title>
       <author>Simon St. Laurent</author>
       <author>Michael James Fitzgerald</author>
       <price></price>
     </book>
     <book>
       <title lang="English">HTML and XHTML Pocket Reference</title>
       <author>Jennifer Niederst Robbins</author>
       <price></price>
     </book>
   </bookshelf>
   ```
1. Add the necessary classes to model the XML document.
   ```dart
   class Book {
     Title? title;

     List<String>? authors;

     String? price;

     Book({
       this.title,
       this.authors,
       this.price,
     });
   }

   class Bookshelf {
     List<Book>? books;

     String? price;

     Bookshelf({
       this.books,
       this.price,
     });
   }

   enum Language {
     mandarin,
     spanish,
     english,
     hindi,
     bengali,
   }

   class Title {
     Language? language;

     String? text;

     Title({
       this.language,
       this.text,
     });
   }
   ```
1. Annotate the classes and properties with XML annotations.
   ```dart
   @annotation.XmlRootElement(name: 'book')
   @annotation.XmlSerializable()
   class Book {
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
   }

   @annotation.XmlRootElement(name: 'bookshelf')
   @annotation.XmlSerializable()
   class Bookshelf {
     @annotation.XmlElement(name: 'book')
     List<Book>? books;

     @annotation.XmlElement(name: 'price', includeIfNull: false)
     String? price;

     Bookshelf({
       this.books,
       this.price,
     });
   }

   @annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
   enum Language {
     mandarin,
     spanish,
     english,
     hindi,
     bengali,
   }

   @annotation.XmlRootElement(name: 'title')
   @annotation.XmlSerializable()
   class Title {
     @annotation.XmlAttribute(name: 'lang')
     Language? language;

     @annotation.XmlText()
     String? text;

     Title({
       this.language,
       this.text,
     });
   }
   ```
1. Add the required serialization helper methods to the classes.
   ```dart
   @annotation.XmlRootElement(name: 'book')
   @annotation.XmlSerializable()
   class Book {
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
       Map<String, String?> namespaces = const {},
     }) =>
         _$BookToXmlAttributes(
           this,
           namespaces: namespaces,
         );

     List<XmlNode> toXmlChildren({
       Map<String, String?> namespaces = const {},
     }) =>
         _$BookToXmlChildren(
           this,
           namespaces: namespaces,
         );

     XmlElement toXmlElement({
       Map<String, String?> namespaces = const {},
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
       Map<String, String?> namespaces = const {},
     }) =>
         _$BookshelfToXmlAttributes(
           this,
           namespaces: namespaces,
         );

     List<XmlNode> toXmlChildren({
       Map<String, String?> namespaces = const {},
     }) =>
         _$BookshelfToXmlChildren(
           this,
           namespaces: namespaces,
         );

     XmlElement toXmlElement({
       Map<String, String?> namespaces = const {},
     }) =>
         _$BookshelfToXmlElement(
           this,
           namespaces: namespaces,
         );
   }

   @annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
   enum Language {
     mandarin,
     spanish,
     english,
     hindi,
     bengali,
   }

   @annotation.XmlRootElement(name: 'title')
   @annotation.XmlSerializable()
   class Title {
     @annotation.XmlAttribute(name: 'lang')
     Language? language;

     @annotation.XmlText()
     String? text;

     Title({
       this.language,
       this.text,
     });

     factory Title.fromXmlElement(XmlElement element) =>
         _$TitleFromXmlElement(element);

     @override
     String toString() {
       return 'Title{language: $language, text: $text}';
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
       Map<String, String?> namespaces = const {},
     }) =>
         _$TitleToXmlAttributes(
           this,
           namespaces: namespaces,
         );

     List<XmlNode> toXmlChildren({
       Map<String, String?> namespaces = const {},
     }) =>
         _$TitleToXmlChildren(
           this,
           namespaces: namespaces,
         );

     XmlElement toXmlElement({
       Map<String, String?> namespaces = const {},
     }) =>
         _$TitleToXmlElement(
           this,
           namespaces: namespaces,
         );
   }
   ```
1. Add a part directive to the file that contains the classes.
   ```dart
   part 'example.g.dart';
   ```
1. Add the required package dependencies to your project.
   ```bash
   dart pub add xml xml_annotation dev:build_runner dev:xml_serializable
   ```
1. Run the build runner to generate the serializer code.
   ```bash
   dart run build_runner build
   ```
1. Verify that the generated serializer output is as expected.
   ```dart
   // GENERATED CODE - DO NOT MODIFY BY HAND

   part of 'example.dart';

   // **************************************************************************
   // XmlEnumGenerator
   // **************************************************************************

   const $LanguageEnumMap = {
     Language.mandarin: 'Mandarin',
     Language.spanish: 'Spanish',
     Language.english: 'English',
     Language.hindi: 'Hindi',
     Language.bengali: 'Bengali'
   };

   // **************************************************************************
   // XmlSerializableGenerator
   // **************************************************************************

   void _$BookBuildXmlChildren(Book instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     final title = instance.title;
     final titleSerialized = title;
     builder.element('title', nest: () {
       if (titleSerialized != null) {
         titleSerialized.buildXmlChildren(builder, namespaces: namespaces);
       }
     });
     final authors = instance.authors;
     final authorsSerialized = authors;
     if (authorsSerialized != null) {
       for (final value in authorsSerialized) {
         builder.element('author', nest: () {
           builder.text(value);
         });
       }
     }
     final price = instance.price;
     final priceSerialized = price;
     builder.element('price', isSelfClosing: false, nest: () {
       if (priceSerialized != null) {
         builder.text(priceSerialized);
       }
     });
   }

   void _$BookBuildXmlElement(Book instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     builder.element('book', namespaces: namespaces, nest: () {
       instance.buildXmlChildren(builder, namespaces: namespaces);
     });
   }

   Book _$BookFromXmlElement(XmlElement element) {
     final title = element.getElement('title');
     final authors = element
         .getElements('author')
         ?.map((e) => e.getText())
         .whereType<String>();
     final price = element.getElement('price')?.getText();
     return Book(
         title: title != null ? Title.fromXmlElement(title) : null,
         authors: authors?.toList(),
         price: price);
   }

   List<XmlAttribute> _$BookToXmlAttributes(Book instance,
       {Map<String, String?> namespaces = const {}}) {
     final attributes = <XmlAttribute>[];
     return attributes;
   }

   List<XmlNode> _$BookToXmlChildren(Book instance,
       {Map<String, String?> namespaces = const {}}) {
     final children = <XmlNode>[];
     final title = instance.title;
     final titleSerialized = title;
     final titleConstructed = XmlElement(
         XmlName('title'),
         titleSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
         titleSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
     children.add(titleConstructed);
     final authors = instance.authors;
     final authorsSerialized = authors;
     final authorsConstructed = authorsSerialized
         ?.map((e) => XmlElement(XmlName('author'), [], [XmlText(e)]));
     if (authorsConstructed != null) {
       children.addAll(authorsConstructed);
     }
     final price = instance.price;
     final priceSerialized = price;
     final priceConstructed = XmlElement(XmlName('price'), [],
         priceSerialized != null ? [XmlText(priceSerialized)] : [], false);
     children.add(priceConstructed);
     return children;
   }

   XmlElement _$BookToXmlElement(Book instance,
       {Map<String, String?> namespaces = const {}}) {
     return XmlElement(
         XmlName('book'),
         [
           ...namespaces.toXmlAttributes(),
           ...instance.toXmlAttributes(namespaces: namespaces)
         ],
         instance.toXmlChildren(namespaces: namespaces));
   }

   void _$BookshelfBuildXmlChildren(Bookshelf instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     final books = instance.books;
     final booksSerialized = books;
     if (booksSerialized != null) {
       for (final value in booksSerialized) {
         builder.element('book', nest: () {
           value.buildXmlChildren(builder, namespaces: namespaces);
         });
       }
     }
     final price = instance.price;
     final priceSerialized = price;
     if (priceSerialized != null) {
       builder.element('price', nest: () {
         builder.text(priceSerialized);
       });
     }
   }

   void _$BookshelfBuildXmlElement(Bookshelf instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     builder.element('bookshelf', namespaces: namespaces, nest: () {
       instance.buildXmlChildren(builder, namespaces: namespaces);
     });
   }

   Bookshelf _$BookshelfFromXmlElement(XmlElement element) {
     final books = element.getElements('book');
     final price = element.getElement('price')?.getText();
     return Bookshelf(
         books: books?.map((e) => Book.fromXmlElement(e)).toList(), price: price);
   }

   List<XmlAttribute> _$BookshelfToXmlAttributes(Bookshelf instance,
       {Map<String, String?> namespaces = const {}}) {
     final attributes = <XmlAttribute>[];
     return attributes;
   }

   List<XmlNode> _$BookshelfToXmlChildren(Bookshelf instance,
       {Map<String, String?> namespaces = const {}}) {
     final children = <XmlNode>[];
     final books = instance.books;
     final booksSerialized = books;
     final booksConstructed = booksSerialized?.map((e) => XmlElement(
         XmlName('book'),
         e.toXmlAttributes(namespaces: namespaces),
         e.toXmlChildren(namespaces: namespaces)));
     if (booksConstructed != null) {
       children.addAll(booksConstructed);
     }
     final price = instance.price;
     final priceSerialized = price;
     final priceConstructed = priceSerialized != null
         ? XmlElement(XmlName('price'), [], [XmlText(priceSerialized)])
         : null;
     if (priceConstructed != null) {
       children.add(priceConstructed);
     }
     return children;
   }

   XmlElement _$BookshelfToXmlElement(Bookshelf instance,
       {Map<String, String?> namespaces = const {}}) {
     return XmlElement(
         XmlName('bookshelf'),
         [
           ...namespaces.toXmlAttributes(),
           ...instance.toXmlAttributes(namespaces: namespaces)
         ],
         instance.toXmlChildren(namespaces: namespaces));
   }

   void _$TitleBuildXmlChildren(Title instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     final language = instance.language;
     final languageSerialized =
         language != null ? $LanguageEnumMap[language]! : null;
     if (languageSerialized != null) {
       builder.attribute('lang', languageSerialized);
     }
     final text = instance.text;
     final textSerialized = text;
     if (textSerialized != null) {
       builder.text(textSerialized);
     }
   }

   void _$TitleBuildXmlElement(Title instance, XmlBuilder builder,
       {Map<String, String> namespaces = const {}}) {
     builder.element('title', namespaces: namespaces, nest: () {
       instance.buildXmlChildren(builder, namespaces: namespaces);
     });
   }

   Title _$TitleFromXmlElement(XmlElement element) {
     final language = element.getAttribute('lang');
     final text = element.getText();
     return Title(
         language: language != null
             ? $LanguageEnumMap.entries
                 .singleWhere(
                     (languageEnumMapEntry) =>
                         languageEnumMapEntry.value == language,
                     orElse: () => throw ArgumentError(
                         '`$language` is not one of the supported values: ${$LanguageEnumMap.values.join(', ')}'))
                 .key
             : null,
         text: text);
   }

   List<XmlAttribute> _$TitleToXmlAttributes(Title instance,
       {Map<String, String?> namespaces = const {}}) {
     final attributes = <XmlAttribute>[];
     final language = instance.language;
     final languageSerialized =
         language != null ? $LanguageEnumMap[language]! : null;
     final languageConstructed = languageSerialized != null
         ? XmlAttribute(XmlName('lang'), languageSerialized)
         : null;
     if (languageConstructed != null) {
       attributes.add(languageConstructed);
     }
     return attributes;
   }

   List<XmlNode> _$TitleToXmlChildren(Title instance,
       {Map<String, String?> namespaces = const {}}) {
     final children = <XmlNode>[];
     final text = instance.text;
     final textSerialized = text;
     final textConstructed =
         textSerialized != null ? XmlText(textSerialized) : null;
     if (textConstructed != null) {
       children.add(textConstructed);
     }
     return children;
   }

   XmlElement _$TitleToXmlElement(Title instance,
       {Map<String, String?> namespaces = const {}}) {
     return XmlElement(
         XmlName('title'),
         [
           ...namespaces.toXmlAttributes(),
           ...instance.toXmlAttributes(namespaces: namespaces)
         ],
         instance.toXmlChildren(namespaces: namespaces));
   }
   ```

[build]: https://github.com/dart-lang/build
[xml_annotation]: https://pub.dev/packages/xml_annotation
