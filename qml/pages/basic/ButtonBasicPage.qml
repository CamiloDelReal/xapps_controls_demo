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
    titlebar.title: qsTr("Button")
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
                text: qsTr("Button")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Button presents a push-button that can be pushed or clicked by the user. "
                           + "Buttons are normally used to perform an action, or to answer a question.")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Button")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                enabled: false
                text: qsTr("Button Disabled")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                highlighted: true
                text: qsTr("Button Accent Colored")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                highlighted: true
                enabled: false
                text: qsTr("Button Disabled Accent Colored")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                flat: true
                text: qsTr("Button Flat")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                flat: true
                enabled: false
                text: qsTr("Button Flat Disabled")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                flat: true
                highlighted: true
                text: qsTr("Button Flat Accent Colored")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                highlighted: true
                Material.accent: (ApplicationSettingsObj.accentColor + 1) % 19
                text: qsTr("Button Custom Colored")
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                flat: true
                highlighted: true
                Material.accent: (ApplicationSettingsObj.accentColor + 1) % 19
                text: qsTr("Button Flat Custom Colored")
            }
        }
    }

}
