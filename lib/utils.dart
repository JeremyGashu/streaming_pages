import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

final httpClient = new HttpClient();
bool check = false;

Future<File> downloadFile(
    String url, String filename, BuildContext context) async {
  print('DOWNLOAD STARTED...');
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (Theme.of(context).platform == TargetPlatform.android
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory())
      .path;
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);
  print('DOWNLOAD FINISHED!');
  return file;
}

Future<String> localFilePath() async {
  String dir = (Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory())
      .path;
  return dir;
}

Future<List<FileSystemEntity>> getDownloadedFiles(BuildContext context) async {
  final directory = Theme.of(context).platform == TargetPlatform.android
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();
  var files = directory.listSync();
  return files;
}

String getFileNameFromPath(String path) {
  return path.split('/').last;
}

Future<bool> allFilesDownloaded(List<String> fileNames) async {
  String localPath = await localFilePath();
  fileNames.forEach((fileName) {
    File file = File('$localPath/$fileName');
    if (!file.existsSync()) {
      return false;
    }
  });
  return true;
}

void writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  return new File(path).writeAsBytesSync(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
