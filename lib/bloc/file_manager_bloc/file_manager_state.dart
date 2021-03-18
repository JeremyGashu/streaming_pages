//deletingFile
//fileDeleted
//fileDeleteError
//initialState

import 'package:equatable/equatable.dart';

class FileManagerState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialFileState extends FileManagerState {
  @override
  List<Object> get props => [];
}

class DeletingFileState extends FileManagerState {
  @override
  List<Object> get props => [];
}

class DeleteFileState extends FileManagerState {
  final String fileName;
  DeleteFileState({this.fileName});
  @override
  List<Object> get props => [this.fileName];
}

class FileDeletedState extends FileManagerState {
  @override
  List<Object> get props => [];
}

class FileDeleteErrorState extends FileManagerState {
  final String message;
  FileDeleteErrorState({this.message}) : assert(message != null);
  @override
  List<Object> get props => [this.message];
}
