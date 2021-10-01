// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local-file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalFile _$LocalFileFromJson(Map<String, dynamic> json) {
  return LocalFile()
    ..filename = json['filename'] as String?
    ..fileType = json['fileType'] as String?
    ..fileSize = json['fileSize'] as String?
    ..file = json['file'] as String?;
}

Map<String, dynamic> _$LocalFileToJson(LocalFile instance) => <String, dynamic>{
      'filename': instance.filename,
      'fileType': instance.fileType,
      'fileSize': instance.fileSize,
      'file': instance.file,
    };
