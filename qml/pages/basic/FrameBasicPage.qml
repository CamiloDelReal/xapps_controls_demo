import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"

XTitledPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Frame")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Frame")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Frame is used to layout a logical group of controls together, within a visual frame.")
            }

            Frame {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.width / 2
                Layout.topMargin: 15

                Column {
                    spacing: 20
                    width: parent.width

                    RadioButton {
                        text: "First"
                        checked: true
                        width: parent.width
                    }
                    RadioButton {
                        id: button
                        text: "Second"
                        width: parent.width
                    }
                    RadioButton {
                        text: "Third"
                        width: parent.width
                    }
                }
            }

        }
    }

}
