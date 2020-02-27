import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.impl 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

import "qrc:/qml"
import "qrc:/qml/custom"

XParallaxPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    overflowIcon: "qrc:/img/icons/dots-vertical.svg"
    menuActions: [
        XAction {
            text: qsTr("Search")
            icon.source: "qrc:/img/icons/magnify.svg"
        },
        XAction {
            text: qsTr("Options")
            icon.source: "qrc:/img/icons/tune.svg"
        },
        XAction {
            text: qsTr("About")
            icon.source: "qrc:/img/icons/information.svg"
        }
    ]

    floatingTitle: qsTr("Parallax Page copying Google Material Design")
    floatingSubtitle: qsTr("Subtitle")
    parallaxItem: Image {
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/img/banners/banner_2.jpg"
    }
    flickable: scrollview
    scrollIndicator: viewScrollIndicator

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {
            id: viewScrollIndicator
        }

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XParallaxPage")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom XPage with a title bar providing title, subtitle, primary action "
                           + "button, actions menu and background with parallax effect. Also provide "
                           + "inline scrolling behavior for flickable content")
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
