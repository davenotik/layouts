// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

Element header = querySelector('.header');
Element sidePanel = querySelector('.side-panel');
Element closeSidePanel = querySelector('.side-panel .close');
Element toggle = querySelector('.header .toggle');

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
  });

  toggle.onClick.listen((e) {
    sidePanel.classes.remove('hide');
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