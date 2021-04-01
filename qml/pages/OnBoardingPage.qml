import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import "qrc:/qml"

XPage {
    id: onBoardingPage
    padding: 0

    XOnBoardingPane {
        anchors.fill: parent
        anchors.topMargin: 12

        presentationModel: [
            {
                "title": qsTr("XApps Controls Demo"),
                "image": "qrc:/img/app/logo_foreground.svg",
                "imageBackground": onBoardingPage.Material.primary,
                "imageBackgroundRadius": 12,
                "imageMargins": 18,
                "description": qsTr("Thank for install our controls demo app. Please continue with the onboarding if you want to see this component's flow.")                
            },
            {
                "title": qsTr("Ready to use"),
                "image": "qrc:/img/on_boarding/rocket.svg",
                "description": qsTr("Complex pages in one single component to build quickly complex interfaces. Of course, if you want really complex interface yuo will need your own.")
            },
            {
                "title": qsTr("Easy to edit"),
                "image": "qrc:/img/on_boarding/design.svg",
                "description": qsTr("Large list of properties for customize components. If you do change anything, there will be a property for it.")
            },
            {
                "title": qsTr("Material to imagine"),
                "image": "qrc:/img/on_boarding/idea.svg",
                "description": qsTr("Custom material components for make your day happy. A set of extended components based on Material Design guideline.")
            }
        ]

        onFinish: {
            appRoot.onBoardingVisible = false
            appNavController.gotoView(appRoot.labelPageIndex)
        }
    }
}


