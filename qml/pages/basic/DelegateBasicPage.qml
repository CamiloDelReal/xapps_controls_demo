import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

import XApps.XMaterialControls 1.0

import "qrc:/qml"

XTitledPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    contentView.padding: 12

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Delegates")
    //scrollingBehavior.flickable: scrollview

    property var delegateComponentMap: {
        "ItemDelegate": itemDelegateComponent,
        "SwipeDelegate": swipeDelegateComponent,
        "CheckDelegate": checkDelegateComponent,
        "RadioDelegate": radioDelegateComponent,
        "SwitchDelegate": switchDelegateComponent
    }

    Component {
        id: itemDelegateComponent

        ItemDelegate {
            text: labelText
            width: parent.width
        }
    }

    Component {
        id: swipeDelegateComponent

        SwipeDelegate {
            id: swipeDelegate
            text: labelText
            width: parent.width

            Component {
                id: contextComponent

                Rectangle {
                    color: page.Material.accent
                    width: parent.width
                    height: parent.height
                    clip: true

                    Label {
                        font.pixelSize: swipeDelegate.font.pixelSize
                        text: "Context Item"
                        Material.theme: XMaterialControls.isDarkColor(page.Material.accent) ? Material.Dark : Material.Light
                        anchors.centerIn: parent
                    }
                }
            }

            swipe.left: contextComponent
            swipe.right: contextComponent
        }
    }

    Component {
        id: checkDelegateComponent

        CheckDelegate {
            text: labelText
            width: parent.width
        }
    }

    ButtonGroup {
        id: radioButtonGroup
    }

    Component {
        id: radioDelegateComponent

        RadioDelegate {
            text: labelText
            ButtonGroup.group: radioButtonGroup
        }
    }

    Component {
        id: switchDelegateComponent

        SwitchDelegate {
            text: labelText
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}
        header: ColumnLayout {
            id: layout
            width: listView.width
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Delegates")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Delegate controls are used as delegates in views such as ListView.")
            }
        }
        clip: true
        model: ListModel {
            ListElement { type: "ItemDelegate"; text: "ItemDelegate" }
            ListElement { type: "ItemDelegate"; text: "ItemDelegate" }
            ListElement { type: "ItemDelegate"; text: "ItemDelegate" }
            ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
            ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
            ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
            ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
            ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
            ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
            ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
            ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
            ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
            ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
            ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
            ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
        }

        section.property: "type"
        section.delegate: Pane {
            width: listView.width
            height: sectionLabel.implicitHeight + 20

            Label {
                id: sectionLabel
                text: section
                anchors.centerIn: parent
            }
        }

        delegate: Loader {
            id: delegateLoader
            width: listView.width
            sourceComponent: delegateComponentMap[text]

            property string labelText: text
            property ListView view: listView
            property int ourIndex: index
        }
    }
}
