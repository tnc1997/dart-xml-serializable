// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml_serializable_example.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$BookBuildXmlChildren(
  Book instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'price',
    nest: () {
      instance.price?.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
  builder.element(
    'title',
    nest: () {
      instance.title?.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

void _$BookBuildXmlElement(
  Book instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'book',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Book _$BookFromXmlElement(XmlElement element) {
  final price = element.getElement(
    'price',
  );
  final title = element.getElement(
    'title',
  );

  return Book(
    price: price != null ? Price.fromXmlElement(price) : null,
    title: title != null ? Title.fromXmlElement(title) : null,
  );
}

List<XmlAttribute> _$BookToXmlAttributes(
  Book instance, {
  Map<String, String> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$BookToXmlChildren(
  Book instance, {
  Map<String, String> namespaces = const {},
}) {
  return [
    XmlElement(
      XmlName(
        'price',
      ),
      instance.price?.toXmlAttributes(
            namespaces: namespaces,
          ) ??
          [],
      instance.price?.toXmlChildren(
            namespaces: namespaces,
          ) ??
          [],
    ),
    XmlElement(
      XmlName(
        'title',
      ),
      instance.title?.toXmlAttributes(
            namespaces: namespaces,
          ) ??
          [],
      instance.title?.toXmlChildren(
            namespaces: namespaces,
          ) ??
          [],
    ),
  ];
}

XmlElement _$BookToXmlElement(
  Book instance, {
  Map<String, String> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'book',
    ),
    [
      for (final entry in namespaces.entries)
        XmlAttribute(
          entry.value != null
              ? XmlName(
                  entry.value,
                  'xmlns',
                )
              : XmlName(
                  'xmlns',
                ),
          entry.key,
        ),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
  );
}

void _$BookshelfBuildXmlChildren(
  Bookshelf instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  if (instance.books != null) {
    for (final value in instance.books) {
      builder.element(
        'book',
        nest: () {
          value.buildXmlChildren(
            builder,
            namespaces: namespaces,
          );
        },
      );
    }
  }
  builder.element(
    'price',
    nest: () {
      instance.price?.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

void _$BookshelfBuildXmlElement(
  Bookshelf instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'bookshelf',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Bookshelf _$BookshelfFromXmlElement(XmlElement element) {
  final books = element.findElements(
    'book',
  );
  final price = element.getElement(
    'price',
  );

  return Bookshelf(
    books: books != null
        ? books.map((element) => Book.fromXmlElement(element)).toList()
        : null,
    price: price != null ? Price.fromXmlElement(price) : null,
  );
}

List<XmlAttribute> _$BookshelfToXmlAttributes(
  Bookshelf instance, {
  Map<String, String> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$BookshelfToXmlChildren(
  Bookshelf instance, {
  Map<String, String> namespaces = const {},
}) {
  return [
    if (instance.books != null)
      for (final value in instance.books)
        XmlElement(
          XmlName(
            'book',
          ),
          value.toXmlAttributes(
            namespaces: namespaces,
          ),
          value.toXmlChildren(
            namespaces: namespaces,
          ),
        ),
    XmlElement(
      XmlName(
        'price',
      ),
      instance.price?.toXmlAttributes(
            namespaces: namespaces,
          ) ??
          [],
      instance.price?.toXmlChildren(
            namespaces: namespaces,
          ) ??
          [],
    ),
  ];
}

XmlElement _$BookshelfToXmlElement(
  Bookshelf instance, {
  Map<String, String> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'bookshelf',
    ),
    [
      for (final entry in namespaces.entries)
        XmlAttribute(
          entry.value != null
              ? XmlName(
                  entry.value,
                  'xmlns',
                )
              : XmlName(
                  'xmlns',
                ),
          entry.key,
        ),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
  );
}

void _$PriceBuildXmlChildren(
  Price instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  if (instance.text != null) {
    builder.text(
      instance.text,
    );
  }
}

void _$PriceBuildXmlElement(
  Price instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'price',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Price _$PriceFromXmlElement(XmlElement element) {
  final text = element.text;

  return Price(
    text: text,
  );
}

List<XmlAttribute> _$PriceToXmlAttributes(
  Price instance, {
  Map<String, String> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$PriceToXmlChildren(
  Price instance, {
  Map<String, String> namespaces = const {},
}) {
  return [
    if (instance.text != null)
      XmlText(
        instance.text,
      ),
  ];
}

XmlElement _$PriceToXmlElement(
  Price instance, {
  Map<String, String> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'price',
    ),
    [
      for (final entry in namespaces.entries)
        XmlAttribute(
          entry.value != null
              ? XmlName(
                  entry.value,
                  'xmlns',
                )
              : XmlName(
                  'xmlns',
                ),
          entry.key,
        ),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
  );
}

void _$TitleBuildXmlChildren(
  Title instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  if (instance.lang != null) {
    builder.attribute(
      'lang',
      instance.lang,
    );
  }
  if (instance.text != null) {
    builder.text(
      instance.text,
    );
  }
}

void _$TitleBuildXmlElement(
  Title instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'title',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Title _$TitleFromXmlElement(XmlElement element) {
  final lang = element.getAttribute(
    'lang',
  );
  final text = element.text;

  return Title(
    lang: lang,
    text: text,
  );
}

List<XmlAttribute> _$TitleToXmlAttributes(
  Title instance, {
  Map<String, String> namespaces = const {},
}) {
  return [
    if (instance.lang != null)
      XmlAttribute(
        XmlName(
          'lang',
        ),
        instance.lang,
      ),
  ];
}

List<XmlNode> _$TitleToXmlChildren(
  Title instance, {
  Map<String, String> namespaces = const {},
}) {
  return [
    if (instance.text != null)
      XmlText(
        instance.text,
      ),
  ];
}

XmlElement _$TitleToXmlElement(
  Title instance, {
  Map<String, String> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'title',
    ),
    [
      for (final entry in namespaces.entries)
        XmlAttribute(
          entry.value != null
              ? XmlName(
                  entry.value,
                  'xmlns',
                )
              : XmlName(
                  'xmlns',
                ),
          entry.key,
        ),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
  );
}
