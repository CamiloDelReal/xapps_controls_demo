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
    titlebar.title: qsTr("Check Box")
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
                text: qsTr("CheckBox")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("CheckBox presents an option button that can be toggled on or off. Check boxes are "
                           + "typically used to select one or more options from a set of options.")
            }

            Column {
                spacing: 20
                Layout.alignment: Qt.AlignHCenter

                CheckBox {
                    text: "CheckBox"
                    checked: true
                }
                CheckBox {
                    text: "CheckBox disabled"
                    enabled: false
                }
                CheckBox {
                    text: "CheckBox checked disabled"
                    enabled: false
                    checked: true
                }
                CheckBox {
                    text: "CheckBox with different color"
                    Material.accent: (ApplicationSettingsObj.accentColor + 1) % 19
                    checked: true
                }
            }

        }
    }

}
