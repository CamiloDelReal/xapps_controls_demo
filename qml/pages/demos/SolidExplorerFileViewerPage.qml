import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

import "qrc:/qml"
import "qrc:/qml/custom"

XTitledPage {
    id: page

    Material.primary: Material.Blue
    Material.accent: Material.Amber
    Material.theme: Material.Light

    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.primaryAction: XAction {
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/menu.svg"
        onTriggered: appGlobalSideBar.open()
    }
    titlebar.title: qsTr("Explorer")
    titlebar.subtitle: qsTr("11 folders, 8 archives")
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

    scrollingBehavior.type: XScrollingBehavior.ScrollType.PullBack
    scrollingBehavior.order: XScrollingBehavior.ScrollOrder.BottomToTop
    scrollingBehavior.topbar: page.toolbar
    scrollingBehavior.flickable: fileList
    scrollingBehavior.scrollIndicator: fileListScrollIndicator

    ListModel {
        id: navModel

        ListElement {
            folderName: qsTr("Internal Storage")
        }
        ListElement {
            folderName: qsTr("Downloads")
        }
        ListElement {
            folderName: qsTr("Movies")
        }
    }

    ListModel {
        id: fileModel

        ListElement {
            fileName: qsTr("Android Stuff")
            type: "folder"
            isFolder: true
            lastModifiedDate: "07/23/2019 17:08:10"
            size: ""
        }
        ListElement {
            fileName: qsTr("Bastion with OST")
            type: "folder"
            isFolder: true
            lastModifiedDate: "12/28/2018 23:41:03"
            size: ""
        }
        ListElement {
            fileName: qsTr("Flutter BLoC pattern and examples")
            type: "folder"
            isFolder: true
            lastModifiedDate: "03/25/2019 11:29:46"
            size: ""
        }
        ListElement {
            fileName: qsTr("Linux distro isos")
            type: "folder"
            isFolder: true
            lastModifiedDate: "14/01/2019 07:44:50"
            size: ""
        }
        ListElement {
            fileName: qsTr("Material icons for demos")
            type: "folder"
            isFolder: true
            lastModifiedDate: "18/04/2019 13:28:00"
            size: ""
        }
        ListElement {
            fileName: qsTr("Mozart L'Opera Rock playlist")
            type: "folder"
            isFolder: true
            lastModifiedDate: "14/01/2019 23:07:18"
            size: ""
        }
        ListElement {
            fileName: qsTr("Movies")
            type: "folder"
            isFolder: true
            lastModifiedDate: "08/06/2019 11:22:37"
            size: ""
        }
        ListElement {
            fileName: qsTr("Templarian Icons (Material Community Icons)")
            type: "folder"
            isFolder: true
            lastModifiedDate: "10/04/2019 15:48:00"
            size: ""
        }
        ListElement {
            fileName: qsTr("The Swords of Ditto Mormos Curse 1.14.01-202rel")
            type: "folder"
            isFolder: true
            lastModifiedDate: "10/04/2019 07:51:40"
            size: ""
        }
        ListElement {
            fileName: qsTr("Udemy mobile videotutorials")
            type: "folder"
            isFolder: true
            lastModifiedDate: "19/02/2019 01:03:14"
            size: ""
        }
        ListElement {
            fileName: qsTr("Wallpapers for demos")
            type: "folder"
            isFolder: true
            lastModifiedDate: "04/22/2019 09:52:29"
            size: ""
        }
        ListElement {
            fileName: qsTr("build-tools-28rev1.zip")
            type: "packed"
            isFolder: false
            lastModifiedDate: "14/02/2019 23:02:48"
            size: "67.8 MB"
        }
        ListElement {
            fileName: qsTr("ARCore example with Unity3D.mp4")
            type: "video"
            isFolder: false
            lastModifiedDate: "23/07/2019 20:45:12"
            size: "239.62 MB"
        }
        ListElement {
            fileName: qsTr("Difference between Kotlin and Swift.mhtml")
            type: "unknown"
            isFolder: false
            lastModifiedDate: "04/16/2019 10:41:19"
            size: "1.5 MB"
        }
        ListElement {
            fileName: qsTr("gmail-plus-button-icon.svg")
            type: "image"
            isFolder: false
            lastModifiedDate: "08/07/2019 12:48:03"
            size: "4.8 KB"
        }
        ListElement {
            fileName: qsTr("Qt logo 2016.svg")
            type: "image"
            isFolder: false
            lastModifiedDate: "01/13/2019 15:55:32"
            size: "3.6 KB"
        }
        ListElement {
            fileName: qsTr("quazip-master.zip")
            type: "packed"
            isFolder: false
            lastModifiedDate: "21/11/2018 12:35:09"
            size: "544 KB"
        }
        ListElement {
            fileName: qsTr("Skyfall Adele (live in London).mp3")
            type: "audio"
            isFolder: false
            lastModifiedDate: "12/05/2018 23:02:48"
            size: "5.13 MB"
        }
        ListElement {
            fileName: qsTr("Workspace backup")
            type: "unknown"
            isFolder: false
            lastModifiedDate: "26/04/2019 04:18:59"
            size: "2.09 GB"
        }
    }

    property var fileTypeDesign: {
        "unknown": {
            icon: "qrc:/img/icons/file.svg",
            color: Material.color(Material.BlueGrey),
        },
        "folder": {
            icon: "qrc:/img/icons/folder.svg",
            color: page.Material.primary,
        },
        "image": {
            icon: "qrc:/img/icons/image-size-select-actual.svg",
            color: Material.color(Material.Green),
        },
        "video": {
            icon: "qrc:/img/icons/movie.svg",
            color: Material.color(Material.Purple),
        },
        "audio": {
            icon: "qrc:/img/icons/music.svg",
            color: Material.color(Material.Red),
        },
        "packed": {
            icon: "qrc:/img/icons/package.svg",
            color: Material.color(Material.Brown),
        }
    }

    Pane {
        id: navPane
        Material.background: page.Material.primary
        parent: toolbar
        anchors.left: parent.left
        anchors.right: parent.right
        padding: 0
        implicitHeight: 48
        clip: true

        Component.onCompleted: {
            toolbar.contentChildren.push(navPane)
            scrollingBehavior.hiddenTopBars = [navPane]
        }

        ListView {
            id: navList
            anchors.fill: parent
            anchors.leftMargin: 24
            anchors.rightMargin: 6
            clip: true
            orientation: ListView.Horizontal
            displayMarginBeginning: 200
            snapMode: ListView.NoSnap
            highlightFollowsCurrentItem: true
            highlightMoveDuration: 250
            boundsBehavior: ListView.StopAtBounds
            model: navModel
            currentIndex: 1
            delegate: SolidExplorerNavItem {}
        }
    }

    ListView {
        id: fileList
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {
            id: fileListScrollIndicator
//            topPadding: toolbar.height + toolbar.y
        }
        model: fileModel
        // This header is for a little space between item and page toolbar
        header: Item {
            width: fileList.width
            height: 10
        }
        // This footer is until ScrollingBeharior has support for footer items
        footer: Item {
            width: fileList.width
            height: 80
        }
        delegate: SolidExplorerFileItem {}
    }

    XRoundButton {
        parent: page
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        icon.source: "qrc:/img/icons/plus.svg"
    }
}
