import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledPage {
    id: page
    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("X Scrolling Behavior")
    titlebar.overflowIcon: "qrc:/img/icons/dots-vertical.svg"
    titlebar.menuActions: [
        XAction {
            text: qsTr("Search")
            icon.source: "qrc:/img/icons/magnify.svg"
        },
        XAction {
            text: qsTr("Options")
            icon.source: "qrc:/img/icons/tune.svg"
        },
        XAction {
            text: qsTr("About")
            icon.source: "qrc:/img/icons/information.svg"
        }
    ]

    scrollingBehavior.flickable: scrollview
    scrollingBehavior.scrollIndicator: scrollIndicator

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {
            id: scrollIndicator
        }

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth
            spacing: 15

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XScrollingBehavior")
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                text: qsTr("Single Toolbar")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("XScrollingBehavior provides scrolling binding to hide/show panes in the page toolbar.")
            }

            GridLayout {
                columns: 2
                columnSpacing: 20

                XBodyLabel2 {
                    text: qsTr("Hide")
                }
                CheckBox {
                    id: chxTitleBar
                    text: qsTr("TitleBar")
                    checked: true
                    onCheckedChanged: page.changeHiddenTopBars()
                }

                XBodyLabel2 {
                    text: qsTr("Type")
                }
                ComboBox {
                    id: cbxType
                    model: ["PullBack", "Inline"]
                    flat: true
                    Layout.preferredWidth: 200
                    onCurrentTextChanged: changeScrollType()
                }

                XBodyLabel2 {
                    text: qsTr("Order")
                }
                ComboBox {
                    id: cbxOrder
                    model: ["BottomToTop", "TopToBottom"]
                    flat: true
                    Layout.preferredWidth: 200
                    onCurrentTextChanged: changeScrollOrder()
                }
            }

            Row {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 30
                spacing: 0

                IconLabel {
                    icon.source: "qrc:/img/icons/arrow-up-thick.svg"
                    icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                    icon.width: 60
                    icon.height: 60
                }
                IconLabel {
                    icon.source: "qrc:/img/icons/arrow-down-thick.svg"
                    icon.color: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade300)
                    icon.width: 60
                    icon.height: 60
                }
            }

            Item {
                Layout.fillWidth: true
                height: 300
                Layout.preferredHeight: scrollview.height + 100
            }
        }
    }

    function changeHiddenTopBars() {
        if(chxTitleBar.checked) {
            page.scrollingBehavior.hiddenTopBars = [page.titlebar]
        } else {
            page.scrollingBehavior.hiddenTopBars = []
        }
    }

    function changeScrollType() {
        if(cbxType.currentText == "PullBack") {
            page.scrollingBehavior.type = XScrollingBehavior.ScrollType.PullBack
        } else if(cbxType.currentText == "Inline") {
            page.scrollingBehavior.type = XScrollingBehavior.ScrollType.Inline
        }
    }

    function changeScrollOrder() {
        if(cbxOrder.currentText == "BottomToTop") {
            page.scrollingBehavior.order = XScrollingBehavior.ScrollOrder.BottomToTop
        } else if(cbxOrder.currentText == "TopToBottom") {
            page.scrollingBehavior.order = XScrollingBehavior.ScrollOrder.TopToBottom
        }
    }

}
