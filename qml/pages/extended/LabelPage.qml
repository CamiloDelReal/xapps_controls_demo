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
    titlebar.title: qsTr("X Labels")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        contentWidth: contentView.implicitWidth
        ScrollIndicator.vertical: ScrollIndicator {}
        ScrollIndicator.horizontal: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XDisplayLabel4 {
                text: "XDisplayLabel4"
            }

            XDisplayLabel3 {
                text: "XDisplayLabel3"
            }

            XDisplayLabel2 {
                text: "XDisplayLabel2"
            }

            XDisplayLabel1 {
                text: "XDisplayLabel1"
            }

            XHeadlineLabel {
                text: "XHeadlineLabel"
            }

            XTitleLabel {
                text: "XTitleLabel"
            }

            XSubheadingLabel {
                text: "XSubheadingLabel"
            }

            XBodyLabel1 {
                text: "XBodyLabel1"
            }

            XBodyLabel2 {
                text: "XBodyLabel2"
            }

            XCaptionLabel {
                text: "XCaptionLabel"
            }
        }
    }

}
