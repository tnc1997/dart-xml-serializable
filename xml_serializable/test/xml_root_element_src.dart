import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(r'''
void _$HappyPathBuildXmlChildren(HappyPath instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

void _$HappyPathBuildXmlElement(HappyPath instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('HappyPath', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
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
}

XmlElement _$HappyPathToXmlElement(HappyPath instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('HappyPath'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}''')
@XmlRootElement()
@XmlSerializable()
class HappyPath {}

@ShouldGenerate(r'''
void _$NonDefaultNameBuildXmlChildren(NonDefaultName instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

void _$NonDefaultNameBuildXmlElement(NonDefaultName instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('name', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

NonDefaultName _$NonDefaultNameFromXmlElement(XmlElement element) {
return NonDefaultName();
}

List<XmlAttribute> _$NonDefaultNameToXmlAttributes(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNameToXmlChildren(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}

XmlElement _$NonDefaultNameToXmlElement(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('name'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}''')
@XmlRootElement(
  name: 'name',
)
@XmlSerializable()
class NonDefaultName {}

@ShouldGenerate(r'''
void _$NonDefaultNamespaceBuildXmlChildren(NonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

void _$NonDefaultNamespaceBuildXmlElement(NonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('NonDefaultNamespace', namespace: 'https://www.example.com', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

NonDefaultNamespace _$NonDefaultNamespaceFromXmlElement(XmlElement element) {
return NonDefaultNamespace();
}

List<XmlAttribute> _$NonDefaultNamespaceToXmlAttributes(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNamespaceToXmlChildren(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}

XmlElement _$NonDefaultNamespaceToXmlElement(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('NonDefaultNamespace', namespaces['https://www.example.com']), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}''')
@XmlRootElement(
  namespace: 'https://www.example.com',
)
@XmlSerializable()
class NonDefaultNamespace {}

@ShouldGenerate(r'''
void _$NonDefaultNameAndNonDefaultNamespaceBuildXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

void _$NonDefaultNameAndNonDefaultNamespaceBuildXmlElement(NonDefaultNameAndNonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('name', namespace: 'https://www.example.com', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

NonDefaultNameAndNonDefaultNamespace _$NonDefaultNameAndNonDefaultNamespaceFromXmlElement(XmlElement element) {
return NonDefaultNameAndNonDefaultNamespace();
}

List<XmlAttribute> _$NonDefaultNameAndNonDefaultNamespaceToXmlAttributes(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNameAndNonDefaultNamespaceToXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}

XmlElement _$NonDefaultNameAndNonDefaultNamespaceToXmlElement(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('name', namespaces['https://www.example.com']), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}''')
@XmlRootElement(
  name: 'name',
  namespace: 'https://www.example.com',
)
@XmlSerializable()
class NonDefaultNameAndNonDefaultNamespace {}

@ShouldGenerate(r'''
void _$CreateMixinBuildXmlChildren(CreateMixin instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
}

void _$CreateMixinBuildXmlElement(CreateMixin instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('CreateMixin', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
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

XmlElement _$CreateMixinToXmlElement(CreateMixin instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('CreateMixin'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CreateMixinXmlSerializableMixin {
void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _$CreateMixinBuildXmlChildren(this as CreateMixin, builder, namespaces: namespaces);

void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _$CreateMixinBuildXmlElement(this as CreateMixin, builder, namespaces: namespaces);

List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) => _$CreateMixinToXmlAttributes(this as CreateMixin, namespaces: namespaces);

List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) => _$CreateMixinToXmlChildren(this as CreateMixin, namespaces: namespaces);

XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) => _$CreateMixinToXmlElement(this as CreateMixin, namespaces: namespaces);
}''')
@XmlRootElement()
@XmlSerializable(
  createMixin: true,
)
class CreateMixin {}
