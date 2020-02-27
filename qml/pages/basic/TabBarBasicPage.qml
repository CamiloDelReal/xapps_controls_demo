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
    titlebar.title: qsTr("Tab Bar")
    //scrollingBehavior.flickable: scrollview

    Page {
        anchors.fill: parent

        header: TabBar {
            TabButton {
                text: qsTr("First")
            }
            TabButton {
                text: qsTr("Second")
            }
            TabButton {
                text: qsTr("Third")
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
                    text: qsTr("TabBar")
                }

                XBodyLabel1 {
                    Layout.fillWidth: true
                    wrapMode: Label.Wrap
                    text: qsTr("TabBar is a bar with icons or text which allows the user"
                               + "to switch between different subtasks, views, or modes.")
                }
            }
        }

        footer: TabBar {
            TabButton {
                text: qsTr("First")
            }
            TabButton {
                text: qsTr("Second")
            }
            TabButton {
                text: qsTr("Third")
            }
        }
    }

}
