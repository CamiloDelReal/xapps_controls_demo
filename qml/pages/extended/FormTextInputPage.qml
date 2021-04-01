import QtQuick
import QtQuick.Controls
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
    titlebar.title: qsTr("X Form Text Inputs")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 12

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XFormTextField")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("XFormTextField is a single-line text editor with floating placeholder.")
            }

            XFormTextField {
                id: txfPhone
                placeholderText: qsTr("XFormTextField")
                font.pixelSize: 14
                Layout.fillWidth: true
            }

            XFormTextFieldFilled {
                id: txfFilled1
                placeholderText: qsTr("XFormTextFieldFilled")
                font.pixelSize: 14
                Layout.fillWidth: true
            }

            XFormTextFieldFilled {
                id: txfFilledLeftItem
                placeholderText: qsTr("XFormTextFieldFilled")
                font.pixelSize: 14
                Layout.fillWidth: true
                leftItem: IconLabel {
                    icon.source: "qrc:/img/icons/puzzle.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfFilledLeftItem.activeFocus
                                ? txfFilledLeftItem.Material.accentColor
                                : (txfFilledLeftItem.text.length == 0
                                   ? txfFilledLeftItem.Material.hintTextColor
                                   : txfFilledLeftItem.Material.foreground)
                }
            }

            XFormTextFieldFilled {
                id: txfFilledRightIcon
                placeholderText: qsTr("XFormTextFieldFilled")
                font.pixelSize: 14
                Layout.fillWidth: true
                rightItem: IconLabel {
                    icon.source: "qrc:/img/icons/plus.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfFilledRightIcon.activeFocus
                                ? txfFilledRightIcon.Material.accentColor
                                : (txfFilledRightIcon.text.length == 0
                                   ? txfFilledRightIcon.Material.hintTextColor
                                   : txfFilledRightIcon.Material.foreground)
                }
            }

            XFormTextFieldFilled {
                id: txfFilledBothIcons
                placeholderText: qsTr("XFormTextFieldFilled")
                font.pixelSize: 14
                Layout.fillWidth: true
                leftItem: IconLabel {
                    icon.source: "qrc:/img/icons/puzzle.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfFilledBothIcons.activeFocus
                                ? txfFilledBothIcons.Material.accentColor
                                : (txfFilledBothIcons.text.length == 0
                                   ? txfFilledBothIcons.Material.hintTextColor
                                   : txfFilledBothIcons.Material.foreground)
                }
                rightItem: IconLabel {
                    icon.source: "qrc:/img/icons/plus.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfFilledBothIcons.activeFocus
                                ? txfFilledBothIcons.Material.accentColor
                                : (txfFilledBothIcons.text.length == 0
                                   ? txfFilledBothIcons.Material.hintTextColor
                                   : txfFilledBothIcons.Material.foreground)
                }
            }

            XFormTextFieldOutlined {
                id: txfOutline1
                placeholderText: qsTr("XFormTextFieldOutlined")
                font.pixelSize: 14
                Layout.fillWidth: true
            }

            XFormTextFieldOutlined {
                id: txfOutlineLeftIcon
                placeholderText: qsTr("XFormTextFieldOutlined")
                font.pixelSize: 14
                Layout.fillWidth: true
                leftItem: IconLabel {
                    icon.source: "qrc:/img/icons/puzzle.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfOutlineLeftIcon.activeFocus
                                ? txfOutlineLeftIcon.Material.accentColor
                                : (txfOutlineLeftIcon.text.length == 0
                                   ? txfOutlineLeftIcon.Material.hintTextColor
                                   : txfOutlineLeftIcon.Material.foreground)
                }
            }

            XFormTextFieldOutlined {
                id: txfOutlineWithRightIcon
                placeholderText: qsTr("XFormTextFieldOutlined")
                font.pixelSize: 14
                Layout.fillWidth: true
                rightItem: IconLabel {
                    icon.source: "qrc:/img/icons/plus.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfOutlineWithRightIcon.activeFocus
                                ? txfOutlineWithRightIcon.Material.accentColor
                                : (txfOutlineWithRightIcon.text.length == 0
                                   ? txfOutlineWithRightIcon.Material.hintTextColor
                                   : txfOutlineWithRightIcon.Material.foreground)
                }
            }

            XFormTextFieldOutlined {
                id: txfOutlineWithBothIcon
                placeholderText: qsTr("XFormTextFieldOutlined")
                font.pixelSize: 14
                Layout.fillWidth: true
                leftItem: IconLabel {
                    icon.source: "qrc:/img/icons/puzzle.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfOutlineWithBothIcon.activeFocus
                                ? txfOutlineWithBothIcon.Material.accentColor
                                : (txfOutlineWithBothIcon.text.length == 0
                                   ? txfOutlineWithBothIcon.Material.hintTextColor
                                   : txfOutlineWithBothIcon.Material.foreground)
                }
                rightItem: IconLabel {
                    icon.source: "qrc:/img/icons/plus.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: txfOutlineWithBothIcon.activeFocus
                                ? txfOutlineWithBothIcon.Material.accentColor
                                : (txfOutlineWithBothIcon.text.length == 0
                                   ? txfOutlineWithBothIcon.Material.hintTextColor
                                   : txfOutlineWithBothIcon.Material.foreground)
                }
            }

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XFormTextArea")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("XFormTextArea is a multi-line text editor with floating placeholder.")
            }

            XFormTextArea {
                id: txfAutobiography
                placeholderText: qsTr("XFormTextArea")
                wrapMode: TextArea.Wrap
                font.pixelSize: 14
                Layout.fillWidth: true
            }

            Item {
                Layout.fillWidth: true
                height: 48
            }
        }
    }
}
