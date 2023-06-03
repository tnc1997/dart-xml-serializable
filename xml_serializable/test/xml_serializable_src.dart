import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(r'''
void _$HappyPathBuildXmlChildren(HappyPath instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

HappyPath _$HappyPathFromXmlElement(XmlElement element) {
return HappyPath();
}

List<XmlAttribute> _$HappyPathToXmlAttributes(HappyPath instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$HappyPathToXmlChildren(HappyPath instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class HappyPath {}

@ShouldGenerate(r'''
void _$CreateMixinBuildXmlChildren(CreateMixin instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

CreateMixin _$CreateMixinFromXmlElement(XmlElement element) {
return CreateMixin();
}

List<XmlAttribute> _$CreateMixinToXmlAttributes(CreateMixin instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$CreateMixinToXmlChildren(CreateMixin instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}

mixin _$CreateMixinXmlSerializableMixin {
void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _$CreateMixinBuildXmlChildren(this as CreateMixin, builder, namespaces: namespaces);

List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) => _$CreateMixinToXmlAttributes(this as CreateMixin, namespaces: namespaces);

List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) => _$CreateMixinToXmlChildren(this as CreateMixin, namespaces: namespaces);
}''')
@XmlSerializable(
  createMixin: true,
)
class CreateMixin {}

@ShouldGenerate(r'''
void _$KebabFieldRenameBuildXmlChildren(KebabFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
if (fooBarSerialized != null) { builder.attribute('foo-bar', fooBarSerialized); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
builder.element('foo-baz', nest: () { if (fooBazSerialized != null) { builder.text(fooBazSerialized); } });
}

KebabFieldRename _$KebabFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getAttribute('foo-bar');
final fooBaz = element.getElement('foo-baz')?.getText();
return KebabFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$KebabFieldRenameToXmlAttributes(KebabFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = fooBarSerialized != null ? XmlAttribute(XmlName('foo-bar'), fooBarSerialized) : null;
if (fooBarConstructed != null) { attributes.add(fooBarConstructed); }
return attributes;
}

List<XmlNode> _$KebabFieldRenameToXmlChildren(KebabFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = XmlElement(XmlName('foo-baz'), [], fooBazSerialized != null ? [XmlText(fooBazSerialized)] : []);
children.add(fooBazConstructed);
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.kebab,
)
class KebabFieldRename {
  @XmlAttribute()
  String? fooBar;

  @XmlElement()
  String? fooBaz;

  KebabFieldRename({this.fooBar, this.fooBaz});
}

@ShouldGenerate(r'''
void _$NoneFieldRenameBuildXmlChildren(NoneFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
if (fooBarSerialized != null) { builder.attribute('fooBar', fooBarSerialized); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
builder.element('fooBaz', nest: () { if (fooBazSerialized != null) { builder.text(fooBazSerialized); } });
}

NoneFieldRename _$NoneFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getAttribute('fooBar');
final fooBaz = element.getElement('fooBaz')?.getText();
return NoneFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$NoneFieldRenameToXmlAttributes(NoneFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = fooBarSerialized != null ? XmlAttribute(XmlName('fooBar'), fooBarSerialized) : null;
if (fooBarConstructed != null) { attributes.add(fooBarConstructed); }
return attributes;
}

List<XmlNode> _$NoneFieldRenameToXmlChildren(NoneFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = XmlElement(XmlName('fooBaz'), [], fooBazSerialized != null ? [XmlText(fooBazSerialized)] : []);
children.add(fooBazConstructed);
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.none,
)
class NoneFieldRename {
  @XmlAttribute()
  String? fooBar;

  @XmlElement()
  String? fooBaz;

  NoneFieldRename({this.fooBar, this.fooBaz});
}

@ShouldGenerate(r'''
void _$PascalFieldRenameBuildXmlChildren(PascalFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
if (fooBarSerialized != null) { builder.attribute('FooBar', fooBarSerialized); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
builder.element('FooBaz', nest: () { if (fooBazSerialized != null) { builder.text(fooBazSerialized); } });
}

PascalFieldRename _$PascalFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getAttribute('FooBar');
final fooBaz = element.getElement('FooBaz')?.getText();
return PascalFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$PascalFieldRenameToXmlAttributes(PascalFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = fooBarSerialized != null ? XmlAttribute(XmlName('FooBar'), fooBarSerialized) : null;
if (fooBarConstructed != null) { attributes.add(fooBarConstructed); }
return attributes;
}

List<XmlNode> _$PascalFieldRenameToXmlChildren(PascalFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = XmlElement(XmlName('FooBaz'), [], fooBazSerialized != null ? [XmlText(fooBazSerialized)] : []);
children.add(fooBazConstructed);
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.pascal,
)
class PascalFieldRename {
  @XmlAttribute()
  String? fooBar;

  @XmlElement()
  String? fooBaz;

  PascalFieldRename({this.fooBar, this.fooBaz});
}

@ShouldGenerate(r'''
void _$SnakeFieldRenameBuildXmlChildren(SnakeFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
if (fooBarSerialized != null) { builder.attribute('foo_bar', fooBarSerialized); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
builder.element('foo_baz', nest: () { if (fooBazSerialized != null) { builder.text(fooBazSerialized); } });
}

SnakeFieldRename _$SnakeFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getAttribute('foo_bar');
final fooBaz = element.getElement('foo_baz')?.getText();
return SnakeFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$SnakeFieldRenameToXmlAttributes(SnakeFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = fooBarSerialized != null ? XmlAttribute(XmlName('foo_bar'), fooBarSerialized) : null;
if (fooBarConstructed != null) { attributes.add(fooBarConstructed); }
return attributes;
}

List<XmlNode> _$SnakeFieldRenameToXmlChildren(SnakeFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = XmlElement(XmlName('foo_baz'), [], fooBazSerialized != null ? [XmlText(fooBazSerialized)] : []);
children.add(fooBazConstructed);
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.snake,
)
class SnakeFieldRename {
  @XmlAttribute()
  String? fooBar;

  @XmlElement()
  String? fooBaz;

  SnakeFieldRename({this.fooBar, this.fooBaz});
}

@ShouldThrow(
  r'`@XmlSerializable()` can only be used on classes.',
)
@XmlSerializable()
typedef UnsupportedElement = void;
