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
    titlebar.title: qsTr("Radio Button")
    //scrollingBehavior.flickable: scrollview

    ButtonGroup {
        id: radioGroup
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
                text: qsTr("RadioButton")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("RadioButton presents an option button that can be toggled on or off. "
                           + "Radio buttons are typically used to select one option from a set of options.")
            }

            Column {
                spacing: 20
                Layout.alignment: Qt.AlignHCenter

                RadioButton {
                    text: "RadioButton"
                    ButtonGroup.group: radioGroup
                }
                RadioButton {
                    text: "RadioButton disabled"
                    enabled: false
                }
                RadioButton {
                    text: "RadioButton checked disabled"
                    enabled: false
                    checked: true
                }
                RadioButton {
                    text: "RadioButton with different color"
                    Material.accent: (ApplicationSettingsObj.accentColor + 1) % 19
                    checked: true
                    ButtonGroup.group: radioGroup
                }
            }

        }
    }

}
