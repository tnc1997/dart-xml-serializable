import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeEnumClassElement extends Fake implements EnumElement {
  FakeEnumClassElement(this._name, [this._fields]);

  final String _name;
  final List<FieldElement>? _fields;

  @override
  String get name => _name;

  @override
  final metadata = [];

  @override
  ElementKind get kind => ElementKind.CLASS;

  @override
  List<FieldElement> get fields => _fields ?? [];
}

class FakeConstFieldElement extends Fake implements FieldElement {
  FakeConstFieldElement(this._name, [this._metadata]);

  final String _name;
  final List<ElementAnnotation>? _metadata;

  @override
  bool get isEnumConstant => true;

  @override
  String get name => _name;

  @override
  List<ElementAnnotation> get metadata => _metadata ?? [];
}
