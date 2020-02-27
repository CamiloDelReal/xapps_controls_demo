import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "qrc:/qml"

XPane {
    id: pane

    property alias componentName: lblTitleCtrl.text
    property alias componentDescription: lblDescriptionCtrl.text
    property alias componentIndication: lblExtraIndicationCtrl.text
    property alias paneId: lblPaneIdCtrl.text
    property alias scrollview: scrollviewCtrl
    property alias spacer: spacerCtrl.height

    XScrollView {
        id: scrollviewCtrl
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                id: lblTitleCtrl
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: "Sample"
            }

            XBodyLabel1 {
                id: lblDescriptionCtrl
                Layout.fillWidth: true
                width: parent.width
                wrapMode: Label.WordWrap
                horizontalAlignment: Label.AlignJustify
            }

            XCaptionLabel {
                id: lblExtraIndicationCtrl
                Layout.fillWidth: true
                wrapMode: Label.WordWrap
                horizontalAlignment: Label.AlignJustify
                visible: text.length > 0
            }

            XHeadlineLabel {
                id: lblPaneIdCtrl
                Layout.fillWidth: true
                horizontalAlignment: Label.AlignHCenter
                visible: text.length > 0
            }

            Item {
                id: spacerCtrl
                Layout.fillWidth: true
            }
        }
    }

}
