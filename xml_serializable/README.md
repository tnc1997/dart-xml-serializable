# XML Serializable

[![Pub Version](https://img.shields.io/pub/v/xml_serializable)](https://pub.dev/packages/xml_serializable)

Provides [build] builders for handling XML.

The builders generate code when they find members annotated with classes defined in [xml_annotation].

## Usage

Given a library `example.dart` with a `Person` class annotated with `@XmlSerializable()`:

```dart
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'example.g.dart';

@annotation.XmlRootElement(name: 'person')
@annotation.XmlSerializable()
class Person {
  @annotation.XmlElement(name: 'firstname')
  final String? firstName;

  @annotation.XmlElement(name: 'lastname')
  final String? lastName;

  Person({this.firstName, this.lastName});

  factory Person.fromXmlElement(XmlElement element) =>
      _$PersonFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PersonBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$PersonBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PersonToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PersonToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$PersonToXmlElement(
        this,
        namespaces: namespaces,
      );
}
```

Building creates the corresponding part `example.g.dart`:

```dart
part of 'example.dart';

void _$PersonBuildXmlChildren(
  Person instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  final firstName = instance.firstName;
  final lastName = instance.lastName;

  builder.element(
    'firstname',
    isSelfClosing: true,
    nest: () {
      if (firstName != null) {
        builder.text(
          firstName,
        );
      }
    },
  );
  builder.element(
    'lastname',
    isSelfClosing: true,
    nest: () {
      if (lastName != null) {
        builder.text(
          lastName,
        );
      }
    },
  );
}

void _$PersonBuildXmlElement(
  Person instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'person',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Person _$PersonFromXmlElement(XmlElement element) {
  final firstName = element.getElementText(
    'firstname',
  );
  final lastName = element.getElementText(
    'lastname',
  );

  return Person(
    firstName: firstName,
    lastName: lastName,
  );
}

List<XmlAttribute> _$PersonToXmlAttributes(
  Person instance, {
  Map<String, String?> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$PersonToXmlChildren(
  Person instance, {
  Map<String, String?> namespaces = const {},
}) {
  final firstName = instance.firstName;
  final lastName = instance.lastName;

  return [
    XmlElement(
      XmlName(
        'firstname',
      ),
      [],
      [
        if (firstName != null)
          XmlText(
            firstName,
          ),
      ],
      true,
    ),
    XmlElement(
      XmlName(
        'lastname',
      ),
      [],
      [
        if (lastName != null)
          XmlText(
            lastName,
          ),
      ],
      true,
    ),
  ];
}

XmlElement _$PersonToXmlElement(
  Person instance, {
  Map<String, String?> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'person',
    ),
    [
      ...namespaces.toXmlAttributes(),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
    true,
  );
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[build]: https://github.com/dart-lang/build
[tracker]: https://github.com/tnc1997/dart-xml-serializable/issues
[xml_annotation]: https://pub.dev/packages/xml_annotation
