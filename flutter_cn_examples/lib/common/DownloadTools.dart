

import 'dart:io';

import 'package:dio/dio.dart';

Future downloadWithChuncks(String url, String savePath, {ProgressCallback onReceiveProgress}) async {
  const int firstChunkSize = 102;
  const int maxChunkCount = 3;

  int total  = 0;
  Dio dio = new Dio();
  List<int> progressList = <int>[];

  ProgressCallback createCallback(int chunkIndex) {
    return (int received, int callbackTotal) {
      progressList[chunkIndex] = received;

      if (onReceiveProgress != null && total > 0) {
        onReceiveProgress(progressList.reduce((a, b) => a + b), total);
      }
    };
  }

  Future<Response> downloadChunk(String url, start, end, int chunkIndex) async {
    progressList.add(0);
    end--;

    return dio.download(
      url, 
      savePath + "temp$chunkIndex",
      onReceiveProgress: createCallback(chunkIndex), 
      options: Options(
        headers: {"range": "bytes=$start-$end"}, 
      ), 
    );
  }

  Future mergeFutureTempFiles(int totalChunkCount) async {
    File f = new File(savePath + "temp0");
    IOSink ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
    for (var i = 1; i < totalChunkCount; i++) {
      File _f = new File(savePath + "temp$i");
      await ioSink.addStream(_f.openRead());
      await _f.delete();
    }

    await ioSink.close();
    await f.rename(savePath);
  }

  // 先下载一段，试试是不是返回206（可分块传输）
  Response response = await downloadChunk(url, 0, firstChunkSize, 0);

  print("response.statusCode--->${response.statusCode}");
  print("contentRange--->${response.headers.value(HttpHeaders.contentRangeHeader)}");
  print("contentLength--->${response.headers.value(HttpHeaders.contentLengthHeader)}");
  if (response.statusCode == 206) {
    total = int.parse(response.headers.value(HttpHeaders.contentRangeHeader).split("/").last);
    // 剩余的字节数
    int reserved = total - int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
    // 总共分成totalChunkCount块，所以是剩余的字节数除以每一块的大小，再加上刚刚试验下载的第一块
    int totalChunkCount = (reserved / firstChunkSize).ceil() + 1;
    if (totalChunkCount > 1) {
      int chunkSize = firstChunkSize;
      // 调整每一块的块大小
      if (totalChunkCount > maxChunkCount + 1) {
        totalChunkCount = maxChunkCount + 1;
        chunkSize = (reserved / maxChunkCount).ceil();
      }

      List<Future<Response>> futures = <Future<Response>>[];

      for (var i = 0; i < maxChunkCount; i++) {
        int start = firstChunkSize + i * chunkSize;
        futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
      }
      await Future.wait<Response>(futures);
    }
    await mergeFutureTempFiles(totalChunkCount);
  }


  return null;
}