import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/qml"
import "qrc:/qml/custom"

XTabbedPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    XAction {
        id: primaryAction
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    tabbar.primaryAction: appRoot.isPortrait ? null : primaryAction

    tabbar.title: appRoot.isPortrait ? "" : qsTr("Title")
    tabbar.subtitle: appRoot.isPortrait ? "" : qsTr("Subtitle")

    tabbar.tabsLeftMargin: 30

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

    tabbar.overflowIcon: "qrc:/img/icons/dots-vertical.svg"
    property list<XAction> menuActions: [
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
    tabbar.menuActions: appRoot.isPortrait ? [] : menuActions

    XSwipeView {
        id: swipeContainer
        anchors.fill: parent
        currentIndex: tabbar.currentIndex

        Repeater {
            model: tabbar.tabActions

            SimpleTextPane {
                padding: 0
                componentName: qsTr("XTabbedPage")
                componentDescription: qsTr("Custom XPage with an XTabBarNav to provide tab action navigation. Also "
                                           + "it provide title, subtitle, primary action button and actions menu; and "
                                           + "scrolling behavior for flickable content (need improvement for flickables "
                                           + "in each tab content)")
                componentIndication: appRoot.isPortrait
                                     ? qsTr("Put the device in landscape to see the full option working.")
                                     : qsTr("Put the device in portrait to show only tabs.")
            }
        }
    }
}
