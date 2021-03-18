import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_event.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_state.dart';
import 'package:streaming_pages/utils.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc() : super(InitialFileState());

  @override
  Stream<FileManagerState> mapEventToState(FileManagerEvent event) async* {
    yield InitialFileState();

    if (event is DeleteFileEvent) {
      yield DeletingFileState();

      String localPath = await localFilePath();
      File fileToBeDeleted = File('$localPath/${event.fileName}');
      if (fileToBeDeleted.existsSync()) {
        fileToBeDeleted.deleteSync();
        yield FileDeletedState();
      } else {
        yield FileDeleteErrorState(message: 'File does not exist!');
      }
    }
  }
}
