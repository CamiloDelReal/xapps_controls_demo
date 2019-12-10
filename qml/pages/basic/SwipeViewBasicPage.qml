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
    titlebar.title: qsTr("Swipe View")
    //scrollingBehavior.flickable: scrollview

    SwipeView {
        id: swipeview
        currentIndex: 1
        anchors.fill: parent

        Repeater {
            model: 3

            XScrollView {
                id: scrollview
                width: swipeview.width
                height: swipeview.height
                ScrollIndicator.vertical: ScrollIndicator {}

                ColumnLayout {
                    id: layout
                    width: scrollview.contentView.availableWidth
                    spacing: 15

                    XTitleLabel {
                        Layout.fillWidth: true
                        Layout.topMargin: 15
                        text: qsTr("SwipeView")
                    }

                    XBodyLabel1 {
                        Layout.fillWidth: true
                        wrapMode: Label.Wrap
                        text: qsTr("SwipeView provides a navigation model that simplifies horizontal paged scrolling. "
                                   + "The page indicator on the bottom shows which is the presently active page.")
                    }

                    Row {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 30
                        spacing: 0

                        IconLabel {
                            icon.source: "qrc:/img/icons/arrow-left-thick.svg"
                            icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                            icon.width: 60
                            icon.height: 60
                        }
                        IconLabel {
                            icon.source: "qrc:/img/icons/arrow-right-thick.svg"
                            icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                            icon.width: 60
                            icon.height: 60
                        }
                    }
                }
            }
        }
    }

    PageIndicator {
        count: swipeview.count
        currentIndex: swipeview.currentIndex
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
