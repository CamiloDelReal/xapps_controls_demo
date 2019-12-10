import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"

XTitledPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Tool Tip")
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
                text: qsTr("ToolTip")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("A tool tip is a short piece of text that informs the user of a control's function.")
            }

            Button {
                text: qsTr("Press Me")
                Layout.alignment: Qt.AlignHCenter
                highlighted: true

                ToolTip.timeout: 5000
                ToolTip.visible: pressed
                ToolTip.text: qsTr("This is a tool tip.")
            }
        }
    }

}
