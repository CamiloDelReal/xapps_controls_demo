import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledPage {
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

    SimpleTextPane {
        id: ccc
        anchors.fill: parent
        padding: 0
        componentName: qsTr("XTitledPage")
        componentDescription: qsTr("Custom XPage with an XTitleBarNav to provide title, subtitle, primary action "
                                   + "button and actions menu. Also provide scrolling behavior for flickable content")
    }

}
