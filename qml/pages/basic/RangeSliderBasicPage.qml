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
    titlebar.title: qsTr("Range Slider")
    //scrollingBehavior.flickable: scrollview

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("RangeSlider")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("RangeSlider is used to select a range specified by two values, by sliding each handle along a track.")
            }

            RangeSlider {
                id: slider
                first.value: 0.25
                second.value: 0.75
                Layout.alignment: Qt.AlignHCenter
            }

            RangeSlider {
                orientation: Qt.Vertical
                first.value: 0.25
                second.value: 0.75
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

}
