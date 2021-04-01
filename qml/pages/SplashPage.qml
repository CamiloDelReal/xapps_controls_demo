import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import "qrc:/qml"

XPage {
    id: splashPage
    padding: 0

    XSplashPane {
        anchors.fill: parent
        Material.background: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade500)
        logo.source: "qrc:/img/app/logo_foreground.svg"
        logo.sourceSize: Qt.size(92, 92)
    }
}


