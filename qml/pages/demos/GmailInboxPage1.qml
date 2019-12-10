import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledPage {
    id: page

    Material.theme: Material.Light

    statusbar.height: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Inbox")

    toolbar.topMargin: 14
    toolbar.rightMargin: 12
    toolbar.bottomMargin: 12
    toolbar.leftMargin: 12
    Material.primary: page.Material.background
    toolbar.backgroundCtrl.radius: 10
    toolbar.backgroundCtrl.layer.enabled: true
    toolbar.backgroundCtrl.layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8
        samples: 17
        color: "#50000000"
    }

    scrollingBehavior.type: XScrollingBehavior.ScrollType.PullBack
    scrollingBehavior.flickable: mailList
    scrollingBehavior.scrollIndicator: mailItemScrollIndicator

    titlebar.menuActions: [
        XAction {
            text: qsTr("Profile")
            icon.source: "qrc:/img/avatars/avatar_1.svg"
            icon.width: 32
            icon.height: 32
            icon.color: "transparent"
            customIconColor: true
        }
    ]

    ListModel {
        id: mailModel

        ListElement {
            accent: "#ff9800"
            from: "Medium Daily Digest"
            date: "31 jul."
            subject: "Exploring the Android App Bundle published in Google Developers Experts by Joe Birch"
            body: "Stories for John Doe"
            favorite: true
            reed: true
        }
        ListElement {
            accent: "#00bcd4"
            from: "Pinterest"
            date: "30 jul."
            subject: "Frases románticas de amor, conocimiento y más pines populares en Pinterest"
            body: "En tendencia en citas célebres esta semana"
            favorite: false
            reed: false
        }
        ListElement {
            accent: "#2196f3"
            from: "Facebook"
            date: "30 jul."
            subject: "Hoy es el cumpleaños de Jane Doe"
            body: "Celebra el cumpleaños de Jane Doe"
            favorite: false
            reed: false
        }
        ListElement {
            accent: "#ff9800"
            from: "Medium Daily Digest"
            date: "30 jul."
            subject: "Android Studio 3.1.x - How to fix it. Published in AndroidPub by Vortana Say"
            body: "Stories for John Doe"
            favorite: false
            reed: false
        }
        ListElement {
            accent: "#3f51b5"
            from: "Dribble"
            date: "29 jul."
            subject: "Popular last week on Dribble"
            body: "Dribble popular shots from the week of Jul 21st - Jul 28th"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#673ab7"
            from: "Pinterest"
            date: "22 jul."
            subject: "Plantillas de currículum, conversar y otros temas que podrían gustarte"
            body: "Nuevos temas que pueden buscarte"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#00bcd4"
            from: "Pinterest"
            date: "22 jul."
            subject: "Consejos de vida, zodíaco y otros pines populares en Pinterest"
            body: "Esto es lo más buscado en Pinterest"
            favorite: false
            reed: false
        }
        ListElement {
            accent: "#ff9800"
            from: "Medium Daily Digest"
            date: "22 jul."
            subject: "HTTP explained with carrier pigneos. Publiched in freeCodeCamp.org by Andrea Zanin"
            body: "Stories for John Doe"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#9c27b0"
            from: "Instagram"
            date: "18 jul."
            subject: "janedoe34, astroboy and sweetcat have new posts"
            body: "See what you may have missed from the pass month"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#ff5722"
            from: "Jane Doe via LinkedIn"
            date: "12 jul."
            subject: "Jane Doe´s invitation is awaiting your response"
            body: "Jane Doe would like to connect on LinkedIn. How would you like to respond?"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#ff9800"
            from: "Medium Daily Digest"
            date: "30 jun."
            subject: "Memory management in Swift. Publiched in Elements blog by Kaira Diagne"
            body: "Stories for John Doe"
            favorite: true
            reed: true
        }
        ListElement {
            accent: "#ff9800"
            from: "Medium Daily Digest"
            date: "10 jul."
            subject: "SQLite in Flutter. Published by Greg Perry"
            body: "Stories for John Doe"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#4caf50"
            from: "COPSONIC"
            date: "26 jun."
            subject: "Your online test score - Kotlin quiz medium"
            body: "Hello John Doe"
            favorite: false
            reed: true
        }
        ListElement {
            accent: "#795548"
            from: "GEN, by Medium"
            date: "12 jun."
            subject: "We've got the inside information"
            body: "Welcome to GEN, a new publication we created to help you"
            favorite: false
            reed: true
        }
    }

    ListView {
        id: mailList
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {
            id: mailItemScrollIndicator
        }

        footer: Item {
            width: mailList.width
            height: 80
        }

        header: ColumnLayout {
            width: mailList.width

            XBodyLabel1 {
                Layout.fillWidth: true
                Layout.leftMargin: 18
                Layout.rightMargin: 20
                Layout.alignment: Qt.AlignLeft
                font.capitalization: Font.AllUppercase
                text: qsTr("Principal")
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.leftMargin: 18
                Layout.rightMargin: 20
                spacing: 12

                IconLabel {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.rightMargin: 6
                    icon.source: "qrc:/img/icons/autorenew.svg"
                    icon.width: 24
                    icon.height: 24
                    icon.color: Material.color(Material.Blue, Material.Shade800)
                }

                XBodyLabel1 {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    wrapMode: Label.Wrap
                    text: qsTr("Auto sync is disabled. Touch to activate it")
                }

                Button {
                    Layout.alignment: Qt.AlignVCenter
                    flat: true
                    highlighted: true
                    Material.accent: Material.color(Material.Blue, Material.Shade800)
                    text: qsTr("Close")
                }
            }

            XListSeparator {
                Layout.fillWidth: true
            }
        }

        model: mailModel
        delegate: GmailItem1 {}
    }

    XRoundButton {
        parent: page
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        Material.accent: page.Material.background
        icon.source: "qrc:/img/icons/gmail_plus_1.svg"
        icon.color: "transparent"
    }
}
