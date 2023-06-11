import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(
  r"const $HappyPathEnumMap = { HappyPath.fooBar: 'fooBar' };",
)
@XmlEnum()
enum HappyPath {
  fooBar,
}

@ShouldGenerate(
  r"const $KebabFieldRenameEnumMap = { KebabFieldRename.fooBar: 'foo-bar' };",
)
@XmlEnum(
  fieldRename: FieldRename.kebab,
)
enum KebabFieldRename {
  fooBar,
}

@ShouldGenerate(
  r"const $NoneFieldRenameEnumMap = { NoneFieldRename.fooBar: 'fooBar' };",
)
@XmlEnum(
  fieldRename: FieldRename.none,
)
enum NoneFieldRename {
  fooBar,
}

@ShouldGenerate(
  r"const $PascalFieldRenameEnumMap = { PascalFieldRename.fooBar: 'FooBar' };",
)
@XmlEnum(
  fieldRename: FieldRename.pascal,
)
enum PascalFieldRename {
  fooBar,
}

@ShouldGenerate(
  r"const $SnakeFieldRenameEnumMap = { SnakeFieldRename.fooBar: 'foo_bar' };",
)
@XmlEnum(
  fieldRename: FieldRename.snake,
)
enum SnakeFieldRename {
  fooBar,
}

@ShouldThrow(
  r'`@XmlEnum` can only be used on enums.',
)
@XmlEnum()
class UnsupportedElement {}
