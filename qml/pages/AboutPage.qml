import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl
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
    titlebar.title: qsTr("About")

    function back() {
        appNavController.returnFromView(appRoot.aboutPageIndex)
        return true
    }

    XAboutPane {
        id: aboutPane
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        appLogo: "qrc:/img/app/logo.svg"
        appLogoLayer.enabled: page.Material.theme === Material.Light
        appLogoLayer.effect: ElevationEffect {
            elevation: 12
        }
        appName: qsTr("XApps Controls Demo")
        appVersion: ApplicationSettingsObj.version
        appSlogan: qsTr("A simple demo application for testing and document \"X Libraries\"")

        sections: [
            XListSection {
                title: qsTr("Libraries")
                actions: [
                    XAction {
                        text: qsTr("Qt Framework OpenSource")
                        tooltip: qsTr("https://www.qt.io")
                        onTriggered: Qt.openUrlExternally("https://www.qt.io")
                        secondaryItem: Image {
                            source: "qrc:/img/app/qt_logo_2016.svg"
                            sourceSize.width: 38
                            sourceSize.height: 28
                        }
                    },
                    XAction {
                        text: qsTr("X Material Controls")
                        tooltip: "https://github.com/CamiloDelReal/x_material_controls"
                        onTriggered: Qt.openUrlExternally("https://github.com/CamiloDelReal/x_material_controls")
                        secondaryItem: Image {
                            source: "qrc:/img/app/logo.svg"
                            sourceSize.width: 38
                            sourceSize.height: 38
                            layer.enabled: page.Material.theme === Material.Light
                            layer.effect: ElevationEffect {
                                elevation: 12
                            }
                        }
                    }
                ]
            },
            XListSection {
                title: qsTr("Resources")
                actions: [
                    XAction {
                        text: qsTr("Templarian Material Icons")
                        tooltip: "https://github.com/Templarian/MaterialDesign"
                        onTriggered: Qt.openUrlExternally("https://github.com/Templarian/MaterialDesign")
                        secondaryItem: Grid {
                            columns: 2
                            rows: 2
                            IconLabel { icon.width: 16; icon.height: 16; display: IconLabel.IconOnly;
                                icon.source: "qrc:/img/icons/heart.svg"
                                icon.color: page.Material.primaryTextColor }
                            IconLabel { icon.width: 16; icon.height: 16; display: IconLabel.IconOnly;
                                icon.source: "qrc:/img/icons/hexagon-slice-2.svg"
                                icon.color: page.Material.primaryTextColor  }
                            IconLabel { icon.width: 16; icon.height: 16; display: IconLabel.IconOnly;
                                icon.source: "qrc:/img/icons/music.svg"
                                icon.color: page.Material.primaryTextColor  }
                            IconLabel { icon.width: 16; icon.height: 16; display: IconLabel.IconOnly;
                                icon.source: "qrc:/img/icons/radioactive.svg"
                                icon.color: page.Material.primaryTextColor  }
                        }
                    },
                    XAction {
                        text: qsTr("OnBoarding Images from FlatIcon")
                        tooltip: "https://www.flaticon.com"
                        onTriggered: Qt.openUrlExternally("https://www.flaticon.com")
                        secondaryItem: Image {
                            source: "qrc:/img/app/flaticon_logo.svg"
                            sourceSize.width: 38
                            sourceSize.height: 38
                        }
                    }
                ]
            }
        ]
    }

}
