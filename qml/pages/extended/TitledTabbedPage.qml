import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledTabbedPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Title")
    titlebar.subtitle: qsTr("Subtitle")
    titlebar.overflowIcon: "qrc:/img/icons/dots-vertical.svg"
    titlebar.menuActions: [
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

    tabbar.tabActions: [
        XAction {
            text: qsTr("Home")
            icon.source: "qrc:/img/icons/home.svg"
            checked: true
        },
        XAction {
            text: qsTr("Store")
            icon.source: "qrc:/img/icons/store.svg"
        },
        XAction {
            text: qsTr("Offers")
            icon.source: "qrc:/img/icons/tag.svg"
        }
    ]
    tabbar.currentIndex: swipeContainer.currentIndex

    XSwipeView {
        id: swipeContainer
        anchors.fill: parent
        currentIndex: tabbar.currentIndex

        Repeater {
            model: tabbar.tabActions

            SimpleTextPane {
                padding: 0
                componentName: qsTr("XTitledTabbedPage")
                componentDescription: qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action "
                                           + "button and actions menu; and an XTabBarNav to provide tab action navigation. "
                                           + "The XTabBarNav also provide title, subtitle, primary action button and actions "
                                           + " menu; and scrolling behavior for flickable content (need improvement for "
                                           + "flickables in each tab content)")
            }
        }
    }
}
