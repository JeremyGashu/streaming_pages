import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_bloc.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_event.dart';
import 'package:streaming_pages/bloc/file_manager_bloc/file_manager_state.dart';
import 'package:streaming_pages/utils.dart';

class DeleteFilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<FileManagerBloc>(context)
                  .add(DeleteFileEvent(fileName: 'sampleTextFile.txt'));
            },
            child: Text('Delete File'),
          ),
          TextButton(
            onPressed: () async {
              String path = await localFilePath();
              File file = File('$path/sampleTextFile.txt');
              file.writeAsStringSync(
                  'This is sample content written from file');

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('File Created!'),
                  duration: Duration(milliseconds: 300),
                ),
              );
            },
            child: Text('Create File'),
          ),
          BlocListener<FileManagerBloc, FileManagerState>(
            listener: (ctx, state) {
              if (state is FileDeletedState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('File Deleted!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
              if (state is FileDeleteErrorState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.message}'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }
}
