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
