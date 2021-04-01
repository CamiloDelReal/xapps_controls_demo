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
    titlebar.title: qsTr("Combo Box")
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
                text: qsTr("ComboBox")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("ComboBox is a combined button and popup list. It presents a list of options "
                           + "to the user that occupies minimal screen space.")
            }

            ComboBox {
                model: ["First", "Second", "Third"]
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.width / 2
            }

            ComboBox {
                editable: true
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.width / 2
                model: ListModel {
                    id: model
                    ListElement { text: "Banana" }
                    ListElement { text: "Apple" }
                    ListElement { text: "Coconut" }
                }
                onAccepted: {
                    if (find(editText) === -1)
                        model.append({text: editText})
                }
            }

        }
    }

}
