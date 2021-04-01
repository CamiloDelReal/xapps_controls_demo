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
    titlebar.title: qsTr("Switch")
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
                text: qsTr("Switch")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Switch is an option button that can be dragged or toggled on or off. "
                           + "Switches are typically used to select between two states.")
            }

            Column {
                Layout.alignment: Qt.AlignHCenter
                spacing: 15

                Switch {
                    text: "Switch"
                }
                Switch {
                    text: "Switch disabled"
                    enabled: false
                }
                Switch {
                    text: "Switch checked disabled"
                    checked: true
                    enabled: false
                }
                Switch {
                    text: "Switch with different color"
                    checked: true
                    Material.accent: (ApplicationSettingsObj.accentColor + 1) % 19
                }
            }
        }
    }

}
