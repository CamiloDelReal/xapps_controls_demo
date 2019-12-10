import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"

XTitledPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Busy Indicator")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}
        ScrollIndicator.horizontal: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("BusyIndicator")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Busy indicator is used to indicate activity while content is being "
                           + "loaded, or when the UI is blocked waiting for a resource to become available.")
            }

            BusyIndicator {
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

}
