import 'package:json_annotation/json_annotation.dart';
import 'dart:typed_data';

part 'local-file.g.dart';

@JsonSerializable()
class LocalFile{

  String? _filename;
  String? _fileType;
  String? _fileSize;
  String? _file;

  String? get filename => _filename;

  set filename(String? value) {
    _filename = value;
  }

  String? get fileType => _fileType;

  set fileType(String? value) {
    _fileType = value;
  }

  String? get fileSize => _fileSize;

  set fileSize(String? value) {
    _fileSize = value;
  }

  String? get file => _file;

  set file(String? value) {
    _file = value;
  }

  LocalFile();

  factory LocalFile.fromJson(Map<String, dynamic> json) => _$LocalFileFromJson(json);
}