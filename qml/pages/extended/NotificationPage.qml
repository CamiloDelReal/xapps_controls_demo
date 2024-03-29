import QtQuick
import QtQuick.Controls
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
    titlebar.title: qsTr("X Notifications")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            width: scrollview.contentView.availableWidth

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XToast")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom Popup with icon and text")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Toast")
                onClicked: toastCtrl.showText(qsTr("This is a toast"))
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Toast with icon")
                onClicked: toastCtrl.showIconWithText("qrc:/img/icons/radioactive.svg", qsTr("This is a toast with icon"))
            }

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XMessage")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom Popup with icon, text and action button")
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Message")
                XAction {
                    id: simpleMessage
                    tooltip: qsTr("This is a message")
                }
                onClicked: messageCtrl.show(simpleMessage)
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Message with icon")
                XAction {
                    id: messageIcon
                    icon.source: "qrc:/img/icons/tag.svg"
                    tooltip: qsTr("This is a message with icon")
                }
                onClicked: messageCtrl.show(messageIcon)
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Message with icon and action")
                XAction {
                    id: messageIconAction
                    icon.source: "qrc:/img/icons/puzzle.svg"
                    tooltip: qsTr("This is a message with icon")
                    text: qsTr("Ok")
                }
                onClicked: messageCtrl.show(messageIconAction)
            }

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XNotification")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("ToDo")
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Notification (ToDo)")
            }
        }
    }

    XToast {
        id: toastCtrl
    }

    XMessage {
        id: messageCtrl
    }
}
