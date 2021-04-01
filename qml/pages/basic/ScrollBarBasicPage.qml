import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
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
    titlebar.title: qsTr("Scroll Bar")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollBar.vertical: ScrollBar {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("ScrollBar")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("ScrollBar is an interactive bar that can be used to scroll to a specific position. "
                           + "A scroll bar can be either vertical or horizontal, and can be attached to any Flickable, "
                           + "such as ListView and GridView.")
            }

            Row {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 30
                spacing: 0

                IconLabel {
                    icon.source: "qrc:/img/icons/arrow-up-thick.svg"
                    icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                    icon.width: 60
                    icon.height: 60
                }
                IconLabel {
                    icon.source: "qrc:/img/icons/arrow-down-thick.svg"
                    icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                    icon.width: 60
                    icon.height: 60
                }
            }

            Item {
                Layout.fillWidth: true
                height: 500
                Layout.preferredHeight: scrollview.height + 100
            }
        }
    }

}
