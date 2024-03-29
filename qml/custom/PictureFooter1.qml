import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"

Rectangle {
    width: parent.width
    height: footerLayout.implicitHeight + 20
    Material.theme: Material.Dark
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#001e1e1e";
        }
        GradientStop {
            position: 1.00;
            color: "#a01e1e1e";
        }
    }

    property alias title: lblTitleCtrl.text
    property alias description: lblDescriptionCtrl.text
    property alias likeCount: lblLikeCountCtrl.text
    property alias commentCount: lblCommentCountCtrl.text

    RowLayout {
        id: footerLayout
        anchors.fill: parent
        anchors.margins: 10

        ColumnLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom

            XTitleLabel {
                id: lblTitleCtrl
                Layout.fillWidth: true
                visible: text.length
            }
            XCaptionLabel {
                id: lblDescriptionCtrl
                Layout.fillWidth: true
                visible: text.length
            }
        }

        IconLabel {
            Layout.alignment: Qt.AlignBottom
            icon.source: "qrc:/img/icons/heart-outline.svg"
            icon.color: Material.color(Material.Pink)
            icon.width: 20
            icon.height: 20
        }
        XBodyLabel1 {
            id: lblLikeCountCtrl
            Layout.alignment: Qt.AlignBottom
        }

        IconLabel {
            Layout.alignment: Qt.AlignBottom
            icon.source: "qrc:/img/icons/comment-outline.svg"
            icon.color: Material.color(Material.Yellow)
            icon.width: 20
            icon.height: 20
        }
        XBodyLabel1 {
            id: lblCommentCountCtrl
            Layout.alignment: Qt.AlignBottom
        }
    }
}
