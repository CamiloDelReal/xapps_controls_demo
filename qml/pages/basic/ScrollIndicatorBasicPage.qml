import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.impl 2.14
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
    titlebar.title: qsTr("Scroll Indicator")
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
                text: qsTr("ScrollIndicator")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("ScrollIndicator is a non-interactive indicator that indicates the current scroll position. "
                           + "A scroll indicator can be either vertical or horizontal, and can be attached to any Flickable, "
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
