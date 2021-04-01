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
    titlebar.title: qsTr("X Dialogs")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            width: scrollview.contentView.availableWidth

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XPrimaryColorDialog")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom XDialog with Material primary color chooser")
            }

            Button {
                id: btnPrimaryColor
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Primary Color Chooser")
                highlighted: true
                Material.accent: page.Material.primary
                onClicked: showPrimaryColorDialog()
            }

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XAccentColorDialog")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom XDialog with Material accent color chooser")
            }

            Button {
                id: btnAccentColor
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Accent Color Chooser")
                highlighted: true
                Material.accent: page.Material.accent
                onClicked: showAccentColorDialog()
            }
        }
    }

    Loader {
        id: primaryColorDialogLoader
        active: false
        visible: false
        sourceComponent: XPrimaryColorDialog {
            checkIcon: "qrc:/img/icons/check.svg"
            Material.primary: btnPrimaryColor.Material.primary
            onSelectedColorChanged: {
                btnPrimaryColor.Material.accent = Material.color(selectedColor)
            }
            onClosed: {
                primaryColorDialogLoader.active = false
            }
        }
        onLoaded: {
            item.open()
        }
    }

    function showPrimaryColorDialog() {
        primaryColorDialogLoader.active = true
    }

    Loader {
        id: accentColorDialogLoader
        active: false
        visible: false
        sourceComponent: XAccentColorDialog {
            checkIcon: "qrc:/img/icons/check.svg"
            Material.accent: btnAccentColor.Material.accent
            onSelectedColorChanged: {
                btnAccentColor.Material.accent = (page.Material.theme === Material.Light
                                                  ? Material.color(selectedColor)
                                                  : Material.color(selectedColor, Material.Shade200))
            }
            onClosed: {
                accentColorDialogLoader.active = false
            }
        }
        onLoaded: {
            item.open()
        }
    }

    function showAccentColorDialog() {
        accentColorDialogLoader.active = true
    }
}
