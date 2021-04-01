import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"

XTitledPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("X Chip")
    titlebar.menuActions: [
        XAction {
            text: qsTr("Reset")
            icon.source: "qrc:/img/icons/reload.svg"
            onTriggered: reset()
        }
    ]

    Component.onCompleted: {
       reset()
    }

    ListModel {
        id: simpleModel
    }

    ListModel {
        id: deletableModel
    }

    ListModel {
        id: selectableModel
    }

    ListModel {
        id: deletableAndSelectableModel
    }

    function reset() {
        simpleModel.clear()
        simpleModel.append([
                               { value: qsTr("Pictures") },
                               { value: qsTr("Music") },
                               { value: qsTr("Videos") }
                           ])

        deletableModel.clear()
        deletableModel.append([
                                  {
                                      value: qsTr("User 1"),
                                      picture: "qrc:/img/avatars/avatar_1.png"
                                  },
                                  {
                                      value: qsTr("User 2"),
                                      picture: "qrc:/img/avatars/avatar_5.png"
                                  },
                                  {
                                      value: qsTr("User 3"),
                                      picture: "qrc:/img/avatars/avatar_3.png"
                                  },
                                  {
                                      value: qsTr("User 4"),
                                      picture: "qrc:/img/avatars/avatar_8.png"
                                  },
                                  {
                                      value: qsTr("User 5"),
                                      picture: "qrc:/img/avatars/avatar_6.png"
                                  },
                                  {
                                      value: qsTr("User 6"),
                                      picture: "qrc:/img/avatars/avatar_9.png"
                                  },
                              ])

        selectableModel.clear()
        selectableModel.append([
                                   { value: qsTr("Pictures"), selected: true },
                                   { value: qsTr("Music"), selected: false },
                                   { value: qsTr("Videos"), selected: false }
                               ])

        deletableAndSelectableModel.clear()
        deletableAndSelectableModel.append([
                                               {
                                                   value: qsTr("User 1"),
                                                   picture: "qrc:/img/avatars/avatar_6.png",
                                                   selected: false
                                               },
                                               {
                                                   value: qsTr("User 2"),
                                                   picture: "qrc:/img/avatars/avatar_2.png",
                                                   selected: true
                                               },
                                               {
                                                   value: qsTr("User 3"),
                                                   picture: "qrc:/img/avatars/avatar_3.png",
                                                   selected: false
                                               },
                                               {
                                                   value: qsTr("User 4"),
                                                   picture: "qrc:/img/avatars/avatar_4.png",
                                                   selected: false
                                               },
                                               {
                                                   value: qsTr("User 5"),
                                                   picture: "qrc:/img/avatars/avatar_6.png",
                                                   selected: true
                                               },
                                               {
                                                   value: qsTr("User 6"),
                                                   picture: "qrc:/img/avatars/avatar_7.png",
                                                   selected: false
                                               },
                                           ])
    }

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XChip")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom button with avatar, check icon and delete button")
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Simple chips")
            }

            Flow {
                Layout.fillWidth: true
                spacing: 15
                Repeater {
                    model: simpleModel
                    XChip {
                        text: value
                    }
                }
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Deletable chips")
            }

            Flow {
                Layout.fillWidth: true
                spacing: 15

                Repeater {
                    model: deletableModel
                    XChip {
                        text: value
                        image: picture
                        deletable: true
                        onDeleted: deletableModel.remove(index)
                    }
                }
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Selectable chips")
            }

            Flow {
                Layout.fillWidth: true
                spacing: 15

                Repeater {
                    model: selectableModel
                    XChip {
                        text: value
                        checkable: true
                        Component.onCompleted: {
                            checked = selected
                        }
                    }
                }
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("Selectable and deletable chips")
            }

            Flow {
                Layout.fillWidth: true
                spacing: 15

                Repeater {
                    model: deletableAndSelectableModel
                    XChip {
                        text: value
                        image: picture
                        checkable: true
                        deletable: true
                        onDeleted: deletableAndSelectableModel.remove(index)
                        Component.onCompleted: {
                            checked = selected
                        }
                    }
                }
            }
        }
    }

}
