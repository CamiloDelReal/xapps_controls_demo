import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import XApps.XMaterialControls 1.0

import "qrc:/qml"

XDelegate {
    id: delegate
    padding: 18
    verticalPadding: 12
    horizontalPadding: 12
    width: mailList.width

    contentItem: RowLayout {
        spacing: 12

        Rectangle {
            id: avatarBackground
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.topMargin: 6
            width: 36
            height: width
            radius: width / 2
            color: accent

            XTitleLabel {
                anchors.centerIn: parent
                text: from.substring(0, 1).toUpperCase()
                Material.theme: XMaterialControls.isDarkColor(avatarBackground.color)
                                ? Material.Dark : Material.Light
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 1

            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                XSubheadingLabel {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    text: from
                    font.weight: reed ? Font.Normal : Font.Bold
                    maximumLineCount: 1
                    elide: Label.ElideRight
                }

                XCaptionLabel {
                    Layout.alignment: Qt.AlignVCenter
                    text: date
                    font.weight: reed ? Font.Normal : Font.Bold
                }
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                text: subject
                font.weight: reed ? Font.Normal : Font.Bold
                maximumLineCount: 1
                elide: Label.ElideRight
            }

            RowLayout {
                Layout.fillWidth: true

                XBodyLabel1 {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    font.bold: true
                    text: body
                    maximumLineCount: 1
                    elide: Label.ElideRight
                }

                IconLabel {
                    Layout.alignment: Qt.AlignVCenter
                    icon.source: favorite
                                 ? "qrc:/img/icons/star.svg"
                                 : "qrc:/img/icons/star-outline.svg"
                    icon.width: 20
                    icon.height: 20
                    icon.color: favorite
                                ? Material.color(Material.Amber)
                                : Material.primaryTextColor
                }
            }
        }

    }
}
