// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

final Element header = querySelector('.header');
final Element sidePanel = querySelector('.side-panel');
final Element closeSidePanel = querySelector('.side-panel .close');
final Element toggle = querySelector('.header .toggle');
final Element scrim = querySelector('.scrim');
final Element mainDiv = querySelector('.main');

void main() {
  querySelector('.main').text = 'Your Dart app is running.';

  var oldY = 0;

  document.onScroll.listen((_) {
    var newY = document.body.scrollTop;
    if ((oldY - newY).abs() > 30) {
      if (oldY < newY) {
        hide();
      } else {
        show();
      }
    }
    oldY = newY;
  });

  // TODO: Is adding class on every listen slow? Maybe hold a local var?
  closeSidePanel.onClick.listen((e) {
    sidePanel.classes.add('hide');
    scrim.classes.removeAll(['show']);
    mainDiv.classes.remove('noscroll');
  });

  toggle.onClick.listen((e) {
    sidePanel.classes.remove('hide');
//    scrim.classes.addAll(['show']);
    mainDiv.classes.add('noscroll');
  });
}

hide() {
  if (sidePanel.classes.contains('hide')) {
    header.classes.add('hide');
  }
}

show() {
  header.classes.remove('hide');
}