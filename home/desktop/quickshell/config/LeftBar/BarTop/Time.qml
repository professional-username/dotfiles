pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // an expression can be broken across multiple lines using {}
  readonly property string hours: {
    Qt.formatDateTime(clock.date, "hh")
  }
  readonly property string minutes: {
    Qt.formatDateTime(clock.date, "mm")
  }

  readonly property string seconds: {
    Qt.formatDateTime(clock.date, "ss")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
