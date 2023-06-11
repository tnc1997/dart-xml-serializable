import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(
  r"const $HappyPathEnumMap = { HappyPath.fooBar: 'FOO_BAR', HappyPath.fooBaz: 'fooBaz' };",
)
@XmlEnum()
enum HappyPath {
  @XmlValue('FOO_BAR')
  fooBar,
  fooBaz,
}

@ShouldGenerate(
  r"const $OverrideFieldRenameEnumMap = { OverrideFieldRename.fooBar: 'FOO_BAR', OverrideFieldRename.fooBaz: 'FooBaz' };",
)
@XmlEnum(
  fieldRename: FieldRename.pascal,
)
enum OverrideFieldRename {
  @XmlValue('FOO_BAR')
  fooBar,
  fooBaz,
}
