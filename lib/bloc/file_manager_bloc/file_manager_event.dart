import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FileManagerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteFileEvent extends FileManagerEvent {
  final String fileName;
  DeleteFileEvent({@required this.fileName}) : assert(fileName != null);
  @override
  List<Object> get props => [fileName];
}
