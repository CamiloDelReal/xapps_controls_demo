import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

import "qrc:/qml"

XTitledPage {
    id: page

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("X Carousel")

    ListModel {
        id: devModel

        ListElement {
            avatar: "qrc:/img/avatars/avatar_1.svg"
            name: "Steven MacGarret"
            job: "Developer Chief"
        }

        ListElement {
            avatar: "qrc:/img/avatars/avatar_2.svg"
            name: "Marilyn Montalbano"
            job: "Designer"
        }

        ListElement {
            avatar: "qrc:/img/avatars/avatar_3.svg"
            name: "Elizabeth O'Connor"
            job: "Developer"
        }

        ListElement {
            avatar: "qrc:/img/avatars/avatar_4.svg"
            name: "Mario Rodríguez"
            job: "3D Modeler"
        }
    }

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        ColumnLayout {
            id: layout
            width: scrollview.contentView.availableWidth

            XTitleLabel {
                Layout.fillWidth: true
                Layout.topMargin: 15
                text: qsTr("XCarousel")
            }

            XBodyLabel1 {
                Layout.fillWidth: true
                wrapMode: Label.Wrap
                text: qsTr("Custom circular list item based on PathView")
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 20
                text: qsTr("Image array model")
            }

            XCarousel {
                id: carousel1
                Layout.preferredWidth: layout.width
                Layout.preferredHeight: width * 0.55
                model: [
                    "qrc:/img/banners/banner_1.jpg",
                    "qrc:/img/banners/banner_2.jpg",
                    "qrc:/img/banners/banner_3.jpg"
                ]
                delegate: Image {
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectCrop
                    source: modelData
                }

                XPageIndicator {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    count: carousel1.model.length
                    currentIndex: carousel1.currentIndex
                    z: 10
                    Material.theme: Material.Dark
                }
            }

            XSubheadingLabel {
                Layout.fillWidth: true
                Layout.topMargin: 20
                text: qsTr("List model")
            }

            XCarousel {
                id: carousel2
                Layout.preferredWidth: layout.width
                Layout.preferredHeight: width * 0.55
                model: devModel
                delegate: XDelegate {
                    id: workerCard
                    width: carousel2.width
                    height: carousel2.height
                    padding: 16
                    horizontalPadding: 16
                    verticalPadding: 16
                    contentItem: RowLayout {
                        spacing: 20
                        Image {
                            Layout.alignment: Qt.AlignVCenter
                            sourceSize.height: workerCard.height * 0.5
                            sourceSize.width: workerCard.height * 0.5
                            source: avatar
                        }
                        ColumnLayout {
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            spacing: 10

                            XTitleLabel {
                                Layout.fillWidth: true
                                Layout.topMargin: 15
                                text: name
                            }
                            XBodyLabel1 {
                                Layout.fillWidth: true
                                text: job
                            }
                        }
                    }
                }

                XPageIndicator {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    count: carousel2.model.count
                    currentIndex: carousel2.currentIndex
                    z: 10
                }
            }
        }
    }

}
