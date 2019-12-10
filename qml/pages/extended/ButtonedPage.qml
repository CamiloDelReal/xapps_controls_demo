import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"
import "qrc:/qml/custom"

XButtonedPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize
    statusbarElevation: ApplicationManagerObj.systemStatusBarAvailable
                        ? 4 : 0

    XAction {
        id: primaryAction
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    buttonbar.primaryAction: appRoot.isPortrait ? null : primaryAction

    buttonbar.title: appRoot.isPortrait ? "" : qsTr("Title")
    buttonbar.subtitle: appRoot.isPortrait ? "" : qsTr("Subtitle")

    buttonbar.buttonsLeftMargin: 30

    buttonbar.buttonActions: [
        XAction {
            text: qsTr("Home")
            icon.source: "qrc:/img/icons/home.svg"
            checked: true
            onTriggered: viewNavController.gotoView(viewNavController.homePageIndex, {
                                                        "componentName": qsTr("XButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XButtonBarNav to provide button action navigation. "
                                                                                     + "Also it provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)"),
                                                        "componentIndication": qsTr("Put the device in landscape to see the full option working, "
                                                                                    + "or in portrait to show only buttons.")
                                                    })
        },
        XAction {
            text: qsTr("Store")
            icon.source: "qrc:/img/icons/store.svg"
            onTriggered: viewNavController.gotoView(viewNavController.storePageIndex, {
                                                        "componentName": qsTr("XButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XButtonBarNav to provide button action navigation. "
                                                                                     + "Also it provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)"),
                                                        "componentIndication": qsTr("Put the device in landscape to see the full option working, "
                                                                                    + "or in portrait to show only buttons.")
                                                    })
        },
        XAction {
            text: qsTr("Offers")
            icon.source: "qrc:/img/icons/tag.svg"
            onTriggered: viewNavController.gotoView(viewNavController.offersPageIndex, {
                                                        "componentName": qsTr("XButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XButtonBarNav to provide button action navigation. "
                                                                                     + "Also it provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)"),
                                                        "componentIndication": qsTr("Put the device in landscape to see the full option working, "
                                                                                    + "or in portrait to show only buttons.")
                                                    })
        },
        XAction {
            text: qsTr("Shippings")
            icon.source: "qrc:/img/icons/truck.svg"
            onTriggered: viewNavController.gotoView(viewNavController.shippingsPageIndex, {
                                                        "componentName": qsTr("XButtonedPage"),
                                                        "componentDescription": qsTr("Custom XPage with an XButtonBarNav to provide button action navigation. "
                                                                                     + "Also it provide title, subtitle, primary action button and actions menu; "
                                                                                     + "and scrolling behavior for flickable content (need improvement for "
                                                                                     + "flickables in each tab content)"),
                                                        "componentIndication": qsTr("Put the device in landscape to see the full option working, "
                                                                                    + "or in portrait to show only buttons.")
                                                    })
        }
    ]

    buttonbar.overflowIcon: "qrc:/img/icons/dots-vertical.svg"
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
    buttonbar.menuActions: appRoot.isPortrait ? [] : menuActions

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
                         "componentName": qsTr("XButtonedPage"),
                         "componentDescription": qsTr("Custom XPage with an XButtonBarNav to provide button action navigation. "
                                                      + "Also it provide title, subtitle, primary action button and actions menu; "
                                                      + "and scrolling behavior for flickable content (need improvement for "
                                                      + "flickables in each tab content)"),
                         "componentIndication": qsTr("Put the device in landscape to see the full option working, "
                                                     + "or in portrait to show only buttons.")
                     })
        }
    }

}
