import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "qrc:/qml"

XTitledPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("X Form Text Inputs")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 12

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XFormTextField")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("XFormTextField is a single-line text editor with floating placeholder.")
            }

            XFormTextField {
                id: txfPhone
                placeholderText: qsTr("XFormTextField")
                font.pixelSize: 14
                Layout.fillWidth: true
            }

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XFormTextArea")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("XFormTextArea is a multi-line text editor with floating placeholder.")
            }

            XFormTextArea {
                id: txfAutobiography
                placeholderText: qsTr("XFormTextArea")
                wrapMode: TextArea.Wrap
                font.pixelSize: 14
                Layout.fillWidth: true
            }
        }
    }
}
