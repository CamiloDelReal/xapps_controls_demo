import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import "qrc:/qml"

XPage {
    id: splashPage
    padding: 0

    XSplashPane {
        anchors.fill: parent
        Material.background: Material.color(ApplicationSettingsObj.primaryColor, Material.Shade500)
        logo: "qrc:/img/app/logo_foreground.svg"
        logoWidth: 92
        logoHeight: 92
    }
}


