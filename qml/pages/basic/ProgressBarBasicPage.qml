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
    titlebar.title: qsTr("Progress Bar")
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
                text: qsTr("ProgressBar")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("ScrollBar is an interactive bar that can be used to scroll to a specific position. "
                           + "A scroll bar can be either vertical or horizontal, and can be attached to any Flickable, "
                           + "such as ListView and GridView.")
            }

            ProgressBar {
                id: bar
                value: 0.5
                Layout.alignment: Qt.AlignHCenter
            }

            ProgressBar {
                indeterminate: true
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

}
