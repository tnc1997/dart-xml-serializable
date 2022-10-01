import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeEnumElement extends Fake implements EnumElement {
  FakeEnumElement(this._name, [this._fields]);

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
