import 'dart:io';

import 'package:mineral/framework.dart';

class Handler with Console {
  Future<void> Commands () async {
    List<FileSystemEntity> commands = [];
    _fetchFiles(Directory dir) {
      dir.list().forEach((element) {
        RegExp regExp = new RegExp("\.(dart)", caseSensitive: false);
        if(regExp.hasMatch('$element')) {
          commands.add(element);
          console.success("Commands : ${element} loaded.");
        }
      });
    } 
  }

  Future<void> Events () async {
    List<FileSystemEntity> events = [];
    _fetchFiles(Directory dir) {
      dir.list().forEach((element) {
        RegExp regExp = new RegExp("\.(dart)", caseSensitive: false);
        if(regExp.hasMatch('$element')) {
          events.add(element);
          console.success("Events : ${element} loaded.");
        }
      });
    }
  }
  
}