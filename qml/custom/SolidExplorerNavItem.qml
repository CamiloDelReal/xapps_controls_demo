import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"

RowLayout {
    spacing: 0

    XDelegate {
        id: navItem
        leftPadding: 5
        topPadding: 0
        rightPadding: 5
        bottomPadding: 0
        implicitHeight: navList.height

        contentItem: XBodyLabel1 {
            text: folderName
            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignVCenter
            color: index === navList.currentIndex
                   ? navItem.Material.primaryTextColor
                   : navItem.Material.secondaryTextColor
        }
    }

    Pane {
        padding: 8
        bottomPadding: 6
        visible: index < (navList.model.count - 1)
        background: Rectangle {
            color: "transparent"
        }
        IconLabel {
            anchors.centerIn: parent
            icon.width: 16
            icon.height: 16
            icon.source: "qrc:/img/icons/chevron-right.svg"
            icon.color: navItem.Material.secondaryTextColor
        }
    }
}
