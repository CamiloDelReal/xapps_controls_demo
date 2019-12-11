import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
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
    titlebar.title: qsTr("X Delegates")
//    scrollingBehavior.flickable: scrollview

    Component {
        id: contextComponent

        Rectangle {
            color: appRoot.Material.accent
            width: parent.width
            height: parent.height
            clip: true

            XSubheadingLabel {
                text: qsTr("Context options")
                anchors.centerIn: parent
                Material.theme: (appRoot.Material.theme + 1) % 2
            }
        }
    }

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 0

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XDelegates")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                Layout.topMargin: 15
                wrapMode: Label.Wrap
                text: qsTr("Delegate controls are used as delegates in views such as ListView. It provides "
                           + "icon, text, secondary text and secondary component")
            }

            XListGroupHeader {
                text: qsTr("Only Text")
                Layout.fillWidth: true
                Layout.topMargin: 20
            }

            XItemDelegate {
                text: qsTr("Item Delegate")
                Layout.fillWidth: true
            }

            XCheckDelegate {
                text: qsTr("Check Delegate")
                Layout.fillWidth: true
            }

            XRadioDelegate {
                text: qsTr("Radio Delegate")
                Layout.fillWidth: true
            }

            XSwitchDelegate {
                text: qsTr("Switch Delegate")
                Layout.fillWidth: true
            }

            XSwipeDelegate {
                text: qsTr("Swipe Delegate")
                swipe.right: contextComponent
                Layout.fillWidth: true
            }

            XListGroupHeader {
                text: qsTr("Icon and text")
                Layout.fillWidth: true
            }

            XItemDelegate {
                icon.source: "qrc:/img/icons/martini.svg"
                text: qsTr("Item Delegate")
                Layout.fillWidth: true
            }

            XCheckDelegate {
                icon.source: "qrc:/img/icons/newspaper.svg"
                text: qsTr("Check Delegate")
                Layout.fillWidth: true
            }

            XRadioDelegate {
                icon.source: "qrc:/img/icons/puzzle.svg"
                text: qsTr("Radio Delegate")
                Layout.fillWidth: true
            }

            XSwitchDelegate {
                icon.source: "qrc:/img/icons/magnet-on.svg"
                text: qsTr("Switch Delegate")
                Layout.fillWidth: true
            }

            XSwipeDelegate {
                icon.source: "qrc:/img/icons/snowflake.svg"
                text: qsTr("Swipe Delegate")
                swipe.right: contextComponent
                Layout.fillWidth: true
            }

            XListGroupHeader {
                text: qsTr("Icon, text and secondary text")
                Layout.fillWidth: true
            }

            XItemDelegate {
                icon.source: "qrc:/img/icons/martini.svg"
                text: qsTr("Item Delegate")
                secondaryText: qsTr("Secondary text")
                Layout.fillWidth: true
            }

            XCheckDelegate {
                icon.source: "qrc:/img/icons/newspaper.svg"
                text: qsTr("Check Delegate")
                secondaryText: qsTr("Secondary text")
                Layout.fillWidth: true
            }

            XRadioDelegate {
                icon.source: "qrc:/img/icons/puzzle.svg"
                text: qsTr("Radio Delegate")
                secondaryText: qsTr("Secondary text")
                Layout.fillWidth: true
            }

            XSwitchDelegate {
                icon.source: "qrc:/img/icons/magnet-on.svg"
                text: qsTr("Switch Delegate")
                secondaryText: qsTr("Secondary text")
                Layout.fillWidth: true
            }

            XSwipeDelegate {
                icon.source: "qrc:/img/icons/snowflake.svg"
                text: qsTr("Swipe Delegate")
                secondaryText: qsTr("Secondary text")
                swipe.right: contextComponent
                Layout.fillWidth: true
            }

            XListGroupHeader {
                text: qsTr("Icon, text, secondary text and secondary component")
                Layout.fillWidth: true
            }

            XItemDelegate {
                icon.source: "qrc:/img/icons/martini.svg"
                text: qsTr("Item Delegate")
                secondaryText: qsTr("Secondary text")
                Layout.fillWidth: true
                secondaryItem: IconLabel {
                    icon.source: "qrc:/img/icons/chevron-right.svg"
                    icon.color: parent.Material.secondaryTextColor
                    icon.height: 24
                    icon.width: 24
                }
            }

            XSwipeDelegate {
                icon.source: "qrc:/img/icons/snowflake.svg"
                text: qsTr("Swipe Delegate")
                secondaryText: qsTr("Secondary text")
                swipe.right: contextComponent
                Layout.fillWidth: true
                secondaryItem: IconLabel {
                    icon.source: "qrc:/img/icons/calendar-edit.svg"
                    icon.color: parent.Material.secondaryTextColor
                    icon.height: 24
                    icon.width: 24
                }
            }

            XListGroupHeader {
                text: qsTr("Highlighted")
                Layout.fillWidth: true
            }

            XItemDelegate {
                icon.source: "qrc:/img/icons/martini.svg"
                text: qsTr("Item Delegate")
                secondaryText: qsTr("Secondary text")
                highlighted: true
                Layout.fillWidth: true
            }

            XCheckDelegate {
                icon.source: "qrc:/img/icons/newspaper.svg"
                text: qsTr("Check Delegate")
                secondaryText: qsTr("Secondary text")
                highlighted: true
                Layout.fillWidth: true
            }

            XRadioDelegate {
                icon.source: "qrc:/img/icons/puzzle.svg"
                text: qsTr("Radio Delegate")
                secondaryText: qsTr("Secondary text")
                highlighted: true
                Layout.fillWidth: true
            }

            XSwitchDelegate {
                icon.source: "qrc:/img/icons/magnet-on.svg"
                text: qsTr("Switch Delegate")
                secondaryText: qsTr("Secondary text")
                highlighted: true
                Layout.fillWidth: true
            }

            XSwipeDelegate {
                icon.source: "qrc:/img/icons/snowflake.svg"
                text: qsTr("Swipe Delegate")
                secondaryText: qsTr("Secondary text")
                highlighted: true
                swipe.right: contextComponent
                Layout.fillWidth: true
            }

        }

    }
}
