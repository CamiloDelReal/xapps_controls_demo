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
    titlebar.title: qsTr("Dialog")
    //scrollingBehavior.flickable: scrollview

    Dialog {
        id: messageDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        title: qsTr("Message")

        Label {
            text: "Lorem ipsum dolor sit amet..."
        }
    }

    Dialog {
        id: confirmationDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: Overlay.overlay

        modal: true
        title: qsTr("Confirmation")
        standardButtons: Dialog.Yes | Dialog.No

        Column {
            spacing: 20
            anchors.fill: parent
            Label {
                text: qsTr("The document has been modified.\nDo you want to save your changes?")
            }
            CheckBox {
                text: qsTr("Do not ask again")
                anchors.right: parent.right
            }
        }
    }

    Dialog {
        id: contentDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: Math.min(page.width, page.height) * 0.6
        contentHeight: logo.sourceSize.height * 2.5
        parent: Overlay.overlay

        modal: true
        title: qsTr("Content")
        standardButtons: Dialog.Close

        Flickable {
            id: flickable
            clip: true
            anchors.fill: parent
            contentHeight: column.height

            Column {
                id: column
                spacing: 20
                width: parent.width

                Image {
                    id: logo
                    sourceSize.width: 70
                    sourceSize.height: 70
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/img/app/qt_logo_2016.svg"
                }

                Label {
                    width: parent.width
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc finibus "
                        + "in est quis laoreet. Interdum et malesuada fames ac ante ipsum primis "
                        + "in faucibus. Curabitur eget justo sollicitudin enim faucibus bibendum. "
                        + "Suspendisse potenti. Vestibulum cursus consequat mauris id sollicitudin. "
                        + "Duis facilisis hendrerit consectetur. Curabitur sapien tortor, efficitur "
                        + "id auctor nec, efficitur et nisl. Ut venenatis eros in nunc placerat, "
                        + "eu aliquam enim suscipit."
                    wrapMode: Label.Wrap
                }
            }

            ScrollIndicator.vertical: ScrollIndicator {
                parent: contentDialog.contentItem
                anchors.top: flickable.top
                anchors.bottom: flickable.bottom
                anchors.right: parent.right
                anchors.rightMargin: -contentDialog.rightPadding + 1
            }
        }
    }

    Dialog {
        id: inputDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: Overlay.overlay

        focus: true
        modal: true
        title: qsTr("Input")
        standardButtons: Dialog.Ok | Dialog.Cancel

        ColumnLayout {
            spacing: 20
            anchors.fill: parent
            Label {
                elide: Label.ElideRight
                text: qsTr("Please enter the credentials:")
                Layout.fillWidth: true
            }
            TextField {
                focus: true
                placeholderText: qsTr("Username")
                Layout.fillWidth: true
            }
            TextField {
                placeholderText: qsTr("Password")
                echoMode: TextField.PasswordEchoOnEdit
                Layout.fillWidth: true
            }
        }
    }

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
                text: qsTr("Dialog")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Dialog is a popup that is mostly used for short-term tasks "
                           + "and brief communications with the user.")
            }

            Button {
                text: qsTr("Message")
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 20
                onClicked: messageDialog.open()
            }

            Button {
                text: qsTr("Confirmation")
                Layout.alignment: Qt.AlignHCenter
                onClicked: confirmationDialog.open()
            }

            Button {
                text: qsTr("Content")
                Layout.alignment: Qt.AlignHCenter
                onClicked: contentDialog.open()
            }

            Button {
                text: qsTr("Input")
                Layout.alignment: Qt.AlignHCenter
                onClicked: inputDialog.open()
            }
        }
    }

}
