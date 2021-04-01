import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"

XTitledPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Go back")
        icon.source: "qrc:/img/icons/arrow-left.svg"
        onTriggered: page.back()
    }
    titlebar.title: qsTr("Settings")
    //scrollingBehavior.flickable: settingsPane

    function back() {
        appNavController.returnFromView(appRoot.settingsPageIndex)
        return true
    }

    Loader {
        id: primaryColorDialogLoader
        active: false
        visible: false
        sourceComponent: XPrimaryColorDialog {
            checkIcon: "qrc:/img/icons/check.svg"
            onSelectedColorChanged: {
                ApplicationSettingsObj.primaryColor = selectedColor
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
            onSelectedColorChanged: {
                ApplicationSettingsObj.accentColor = selectedColor
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

    XSettingsPane {
        id: settingsPane
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        sections: [
            XListSection {
                title: qsTr("Appearance")
                actions: [
                    XAction {
                        text: qsTr("Theme")
                        tooltip: ApplicationSettingsObj.theme === Material.Dark
                                 ? qsTr("Dark")
                                 : qsTr("Light")
                        checkable: true
                        checked: ApplicationSettingsObj.theme === Material.Dark
                        onTriggered: {
                            if(checked)
                                ApplicationSettingsObj.theme = Material.Dark
                            else
                                ApplicationSettingsObj.theme = Material.Light
                        }
                    },
                    XAction {
                        text: qsTr("Primary color")
                        tooltip: qsTr("Main color of the UI")
                        secondaryItem: Rectangle {
                            color: settingsPane.Material.primary
                            height: 38
                            width: 38
                            radius: 19
                        }
                        onTriggered: {
                            showPrimaryColorDialog()
                        }
                    },
                    XAction {
                        text: qsTr("Accent color")
                        tooltip: qsTr("Color used to tint elements in UI")
                        secondaryItem: Rectangle {
                            color: settingsPane.Material.accent
                            height: 38
                            width: 38
                            radius: 19
                        }
                        onTriggered: {
                            showAccentColorDialog()
                        }
                    }
                ]
            }
        ]
    }
}
