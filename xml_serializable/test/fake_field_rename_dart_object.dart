import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_dart_object.dart';
import 'fake_field_rename_enum_element.dart';
import 'fake_interface_type.dart';

class FakeFieldRenameDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element: FakeFieldRenameEnumElement(),
  );

  final int? _index;

  final String? _name;

  FakeFieldRenameDartObject({
    int? index,
    String? name,
  })  : _index = index,
        _name = name;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'index':
        return FakeDartObject(value: _index);
      case 'name':
        return FakeDartObject(value: _name);
      default:
        return null;
    }
  }
}
