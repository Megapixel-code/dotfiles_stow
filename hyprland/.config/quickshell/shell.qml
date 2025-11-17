import Quickshell // for PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text

Variants {
   model:Quickshell.screens;

   delegate: Component {
      PanelWindow {
         required property var modelData
         screen: modelData

         anchors {
            bottom: true
            left: true
            right: true
         }

         implicitHeight: 30

         Text {
            id: clock
            anchors.centerIn: parent // center the bar in its parent component (the window)

            Process {
               id: dateProcess
               command: ["date", "+%a %d/%m/%Y %H:%M:%S"] // cmd being run, every argument is its own string
               running: true

               stdout: StdioCollector {
                  onStreamFinished: clock.text = this.text
               }
            }

            Timer {
               interval: 1000 // in ms
               running: true // start the timer imediatly
               repeat: true
               onTriggered: dateProcess.running = true
            }
         }
      }
   }
}
