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
