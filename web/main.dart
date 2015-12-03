// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

final header = querySelector('.header');

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
}

hide() {
  header.classes.add('hide');
}

show() {
  header.classes.remove('hide');
}