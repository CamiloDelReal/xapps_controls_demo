import QtQuick 2.14
import QtQuick.Controls 2.14

import "qrc:/qml"

XTitledButtonedPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

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

    buttonbar.buttonActions: [
        XAction {
            text: qsTr("Home")
            icon.source: "qrc:/img/icons/home.svg"
            checked: true
            onTriggered: viewNavController.gotoView(viewNavController.homePageIndex, {
                                                        "componentName": qsTr("XTitledButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action button "
                                                                                     + "and actions menu; and an XButtonBarNav to provide button action navigation. "
                                                                                     + "The XButtonBarNav also provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)")
                                                    })
        },
        XAction {
            text: qsTr("Store")
            icon.source: "qrc:/img/icons/store.svg"
            onTriggered: viewNavController.gotoView(viewNavController.storePageIndex, {
                                                        "componentName": qsTr("XTitledButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action button "
                                                                                     + "and actions menu; and an XButtonBarNav to provide button action navigation. "
                                                                                     + "The XButtonBarNav also provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)")
                                                    })
        },
        XAction {
            text: qsTr("Offers")
            icon.source: "qrc:/img/icons/tag.svg"
            onTriggered: viewNavController.gotoView(viewNavController.offersPageIndex, {
                                                        "componentName": qsTr("XTitledButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action button "
                                                                                     + "and actions menu;and  an XButtonBarNav to provide button action navigation. "
                                                                                     + "The XButtonBarNav also provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)")
                                                    })
        },
        XAction {
            text: qsTr("Shippings")
            icon.source: "qrc:/img/icons/truck.svg"
            onTriggered: viewNavController.gotoView(viewNavController.shippingsPageIndex, {
                                                        "componentName": qsTr("XTitledButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action button "
                                                                                     + "and actions menu; and an XButtonBarNav to provide button action navigation. "
                                                                                     + "The XButtonBarNav also provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)")
                                                    })
        }
    ]

    XViewNavController {
        id: viewNavController
        anchors.fill: parent

        property int homePageIndex:         0
        property int storePageIndex:        1
        property int offersPageIndex:       2
        property int shippingsPageIndex:    3
        viewNavigationModel: [
            { view: "custom/SimpleTextPane.qml", stacked: false },
            { view: "custom/SimpleTextPane.qml", stacked: false },
            { view: "custom/SimpleTextPane.qml", stacked: false },
            { view: "custom/SimpleTextPane.qml", stacked: false }
        ]
        Component.onCompleted: {
            gotoView(homePageIndex, {
                         "componentName": qsTr("XTitledButtonedPage"),
                         "componentDescription": qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action button "
                                                      + "and actions menu; and an XButtonBarNav to provide button action navigation. "
                                                      + "The XButtonBarNav also provide title, subtitle, primary action button and actions menu; "
                                                      + "and scrolling behavior for flickable content (need improvement for "
                                                      + "flickables in each tab content)")
                     })
        }
    }
}
