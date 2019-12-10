import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import XApps.XMaterialControls 1.0

import "qrc:/qml"

ItemDelegate {
    id: fileItem
    width: fileList.width
    topPadding: 7
    leftPadding: 16
    rightPadding: 4
    bottomPadding: 7

    Component.onCompleted: {
        // If don't change here, then the ItemDelegate throw Binding loop detected for property "implicitHeight"
        lblFileNameCtrl.wrapMode = Label.WrapAtWordBoundaryOrAnywhere
    }

    contentItem: RowLayout {
        height: implicitHeight
        spacing: 10

        Rectangle {
            id: iconViewContainer
            Layout.alignment: Qt.AlignTop
            width: 36
            height: 36
            radius: 7
            color: fileTypeDesign[type].color

            IconLabel {
                id: iconCtrl
                anchors.centerIn: parent
                Material.theme: XMaterialControls.isDarkColor(iconViewContainer.color) ? Material.Dark : Material.Light
                icon.width: 20
                icon.height: 20
                icon.source: fileTypeDesign[type].icon
                icon.color: iconCtrl.Material.primaryTextColor
            }
        }

        ColumnLayout {
            id: contentItemCol
            Layout.alignment: Qt.AlignVCenter
            spacing: 6

            XBodyLabel1 {
                id: lblFileNameCtrl
                text: fileName
                Layout.fillWidth: true
                horizontalAlignment: Label.AlignLeft
                verticalAlignment: Label.AlignBottom
                elide: Label.ElideRight
                maximumLineCount: 2
//                wrapMode: Label.WrapAtWordBoundaryOrAnywhere
                rightPadding: 10
            }

            RowLayout {
                id: subDataLayout
                Layout.fillWidth: true
                XCaptionLabel {
                    text: isFolder
                          ? qsTr("Folder")
                          : size
                    color: fileItem.Material.secondaryTextColor
                    Layout.fillWidth: true
                    elide: Label.ElideRight
                    maximumLineCount: 1
                }
                XCaptionLabel {
                    text: lastModifiedDate
                    color: fileItem.Material.secondaryTextColor
                    Layout.fillWidth: true
                    horizontalAlignment: Label.AlignRight
                    rightPadding: 8
                    elide: Label.ElideLeft
                    maximumLineCount: 1
                }
            }
        }
    }

    XListSeparator {
        childMode: true
        leftPadding: 60
        visible: index < (fileList.model.count - 1)
    }
}
