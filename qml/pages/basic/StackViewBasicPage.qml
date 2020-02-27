import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
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
    titlebar.title: qsTr("Stack View")
    //scrollingBehavior.flickable: scrollview

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pageDelegate

        Component {
            id: pageDelegate

            XScrollView {
                id: scrollview
                ScrollIndicator.vertical: ScrollIndicator {}

                ColumnLayout {
                    id: layout
                    width: scrollview.contentView.availableWidth
                    spacing: 15

                    XTitleLabel {
                        Layout.fillWidth: true
                        Layout.topMargin: 15
                        text: qsTr("StackView")
                    }

                    XBodyLabel1 {
                        Layout.fillWidth: true
                        wrapMode: Label.Wrap
                        text: qsTr("StackView provides a stack-based navigation model which can be used with a set of interlinked pages. "
                                   + "Items are pushed onto the stack as the user navigates deeper into the material, and popped off again "
                                   + "when he chooses to go back.")
                    }

                    Button {
                        id: btnPush
                        text: qsTr("Push")
                        Layout.alignment: Qt.AlignHCenter
                        Material.accent: Material.Green
                        highlighted: true
                        onClicked: stackView.push(pageDelegate)
                    }

                    Button {
                        text: qsTr("Pop")
                        enabled: stackView.depth > 1
                        Layout.alignment: Qt.AlignHCenter
                        Material.accent: Material.Red
                        highlighted: true
                        onClicked: stackView.pop()
                    }
                }
            }
        }
    }

}
