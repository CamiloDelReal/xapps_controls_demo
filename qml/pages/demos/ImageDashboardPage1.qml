import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledPage {
    id: page

    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Image Dashboard 1")
    //scrollingBehavior.flickable: scrollview

    property int cardElevation: 6
    property int cardRadius: 10

    XScrollView {
        id: scrollview
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}

        GridLayout {
            id: grid
            width: scrollview.contentView.availableWidth
            columnSpacing: 12
            rowSpacing: 12
            columns: appRoot.isPortrait ? 2 : 4

            XCard {
                Layout.columnSpan: 2
                Layout.fillWidth: true
                Layout.preferredHeight: width / 2
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/landscape_picture_1.jpg"
                padding: 10
                footer: PictureFooter1 {
                    title: qsTr("Picture 1")
                    description: qsTr("Description ...")
                    likeCount: "355"
                    commentCount: "78"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_1.jpg"
                footer: PictureFooter1 {
                    likeCount: "143"
                    commentCount: "67"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_2.jpg"
                footer: PictureFooter1 {
                    likeCount: "99"
                    commentCount: "23"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.rowSpan: 2
                Layout.preferredHeight: width * 2 + grid.rowSpacing
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/portrait_picture_1.jpg"
                footer: PictureFooter1 {
                    likeCount: "45"
                    commentCount: "29"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_3.jpg"
                footer: PictureFooter1 {
                    likeCount: "672"
                    commentCount: "1274"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_4.jpg"
                footer: PictureFooter1 {
                    likeCount: "341"
                    commentCount: "99"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_5.jpg"
                footer: PictureFooter1 {
                    likeCount: "684"
                    commentCount: "450"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_6.jpg"
                footer: PictureFooter1 {
                    likeCount: "56"
                    commentCount: "32"
                }
            }

            XCard {
                Layout.fillWidth: true
                Layout.preferredHeight: width
                Material.elevation: page.cardElevation
                radius: page.cardRadius
                image.source: "qrc:/img/animals_pictures/square_picture_7.jpg"
                footer: PictureFooter1 {
                    likeCount: "226"
                    commentCount: "348"
                }
            }
        }
    }
}
