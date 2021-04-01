import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window

import "qrc:/qml"
import "qrc:/qml/pages"


XApplication {
    id: appRoot
    visible: true
    width: 420
    height: 600
    title: qsTr("XApps Controls Demo")

    Material.theme: ApplicationSettingsObj.theme
    Material.primary: ApplicationSettingsObj.primaryColor
    Material.accent: ApplicationSettingsObj.accentColor

    property bool onBoardingVisible: true   // The demo always show de OnBoarding
    property bool sideBarNavEnabled: !onBoardingVisible && appNavController.depth === 1

    onAppNavControllerCreated: {
        if(Qt.platform.os === "android" || Qt.platform.os === "ios") {
            ApplicationManagerObj.setUiReady(true)
        }
    }

    function initialization() {
        // Aqui se puede gestionar si es la primera vez o no que se ejecuta la app
        appNavController.gotoView(appRoot.onBoardingPageIndex)
    }

    splashViewSourceComponent: SplashPage {}

    appGlobalSideBarSourceComponent: XSideBarNav {
        interactive: sideBarNavEnabled
        header: XSideBarHeader {
            title: appRoot.title
            statusbarHeight: ApplicationManagerObj.systemStatusBarSize
            backgroundImage: "qrc:/img/app/drawer_header.png"
            overflowIcon: "qrc:/img/icons/dots-vertical.svg"
            Material.theme: Material.Dark
            menuActions: [
                XAction {
                    text: qsTr("Settings")
                    icon.source: "qrc:/img/icons/settings.svg"
                    onTriggered: {
                        appNavController.gotoView(appRoot.settingsPageIndex)
                        appGlobalSideBar.close()
                    }
                },
                XAction {
                    text: qsTr("About")
                    icon.source: "qrc:/img/icons/information.svg"
                    onTriggered: {
                        appNavController.gotoView(appRoot.aboutPageIndex)
                        appGlobalSideBar.close()
                    }
                }
            ]
        }

        linkActions: [
            // Extended Controls
            XAction {
                text: qsTr("Carousel")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.carouselPageIndex)
            },
            XAction {
                text: qsTr("Chips")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.chipsPageIndex)
            },
            XAction {
                text: qsTr("Delegates")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.delegatePageIndex)
            },
            XAction {
                text: qsTr("Dialogs")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.dialogPageIndex)
            },
            XAction {
                text: qsTr("Form Text Inputs")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.formTextInputPageIndex)
            },
            XAction {
                text: qsTr("Image View")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.imageViewPageIndex)
            },
            XAction {
                text: qsTr("Labels")
                category: qsTr("Extended Controls")
                checkable: true
                checked: true
                onTriggered: appNavController.gotoView(appRoot.labelPageIndex)
            },
            XAction {
                text: qsTr("Notifications")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.notificationPageIndex)
            },
            // Pages
            XAction {
                text: qsTr("Titled Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.titledPageIndex)
            },
            XAction {
                text: qsTr("Tabbed Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.tabbedPageIndex)
            },
            XAction {
                text: qsTr("Titled Tabbed Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.titledTabbedPageIndex)
            },
            XAction {
                text: qsTr("Buttoned Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.buttonedPageIndex)
            },
            XAction {
                text: qsTr("Titled Buttoned Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.titledButtonedPageIndex)
            },
            XAction {
                text: qsTr("Parallax Page")
                category: qsTr("Pages")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.parallaxPageIndex)
            },
            // Scrolling Behavior
            XAction {
                text: qsTr("Single Toolbar")
                category: qsTr("Scrolling Behavior")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.scrollingBehaviorSingleToolbar)
            },
            XAction {
                text: qsTr("Multiples Toolbars")
                category: qsTr("Scrolling Behavior")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.scrollingBehaviorMultipleToolbar)
            },
            // Demos
            XAction {
                text: qsTr("Image Dashboard 1")
                category: qsTr("Demos")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.imageDashboardPage1Index)
            },
            XAction {
                text: qsTr("Gmail Inbox 1")
                category: qsTr("App Like Demos")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.gmailInboxPage1Index)
            },
            XAction {
                text: qsTr("Solid Explorer File List")
                category: qsTr("App Like Demos")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.solidExplorerFileViewerPageIndex)
            },
            // Basic Controls
            XAction {
                text: qsTr("Busy Indicator")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.busyIndicatorBasicPageIndex)
            },
            XAction {
                text: qsTr("Button")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.buttonBasicPageIndex)
            },
            XAction {
                text: qsTr("CheckBox")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.checkBoxBasicPageIndex)
            },
            XAction {
                text: qsTr("ComboBox")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.comboBoxBasicPageIndex)
            },
            XAction {
                text: qsTr("DelayButton")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.delayButtonBasicPageIndex)
            },
            XAction {
                text: qsTr("Dial")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.dialBasicPageIndex)
            },
            XAction {
                text: qsTr("Dialogs")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.dialogBasicPageIndex)
            },
            XAction {
                text: qsTr("Delegates")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.delegateBasicPageIndex)
            },
            XAction {
                text: qsTr("Frame")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.frameBasicPageIndex)
            },
            XAction {
                text: qsTr("GroupBox")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.groupBoxBasicPageIndex)
            },
            XAction {
                text: qsTr("PageIndicator")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.pageIndicatorBasicPageIndex)
            },
            XAction {
                text: qsTr("ProgressBar")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.progressBarBasicPageIndex)
            },
            XAction {
                text: qsTr("RadioButton")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.radioButtonBasicPageIndex)
            },
            XAction {
                text: qsTr("RangeSlider")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.rangeSliderBasicPageIndex)
            },
            XAction {
                text: qsTr("ScrollBar")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.scrollBarBasicPageIndex)
            },
            XAction {
                text: qsTr("ScrollIndicator")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.scrollIndicatorBasicPageIndex)
            },
            XAction {
                text: qsTr("Slider")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.sliderBasicPageIndex)
            },
            XAction {
                text: qsTr("SpinBox")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.spinBoxBasicPageIndex)
            },
            XAction {
                text: qsTr("StackView")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.stackViewBasicPageIndex)
            },
            XAction {
                text: qsTr("SwipeView")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.swipeViewBasicPageIndex)
            },
            XAction {
                text: qsTr("Switch")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.switchBasicPageIndex)
            },
            XAction {
                text: qsTr("TabBar")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.tabBarBasicPageIndex)
            },
            XAction {
                text: qsTr("TextArea")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.textAreaBasicPageIndex)
            },
            XAction {
                text: qsTr("TextField")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.textFieldBasicPageIndex)
            },
            XAction {
                text: qsTr("ToolTip")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.toolTipBasicPageIndex)
            },
            XAction {
                text: qsTr("Tumbler")
                category: qsTr("Basic Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.tumblerBasicPageIndex)
            }
            /*,


            XAction {
                text: qsTr("Cards")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.cardsPageIndex)
            },
            XAction {
                text: qsTr("Chips")
                category: qsTr("Extended Controls")
                checkable: true
                onTriggered: appNavController.gotoView(appRoot.chipsPageIndex)
            },*/
        ]
    }

    property int onBoardingPageIndex:               0
    property int settingsPageIndex:                 1
    property int aboutPageIndex:                    2
    property int busyIndicatorBasicPageIndex:       3
    property int buttonBasicPageIndex:              4
    property int checkBoxBasicPageIndex:            5
    property int radioButtonBasicPageIndex:         6
    property int comboBoxBasicPageIndex:            7
    property int delayButtonBasicPageIndex:         8
    property int dialBasicPageIndex:                9
    property int delegateBasicPageIndex:            10
    property int frameBasicPageIndex:               11
    property int groupBoxBasicPageIndex:            12
    property int pageIndicatorBasicPageIndex:       13
    property int progressBarBasicPageIndex:         14
    property int scrollBarBasicPageIndex:           15
    property int scrollIndicatorBasicPageIndex:     16
    property int rangeSliderBasicPageIndex:         17
    property int sliderBasicPageIndex:              18
    property int spinBoxBasicPageIndex:             19
    property int swipeViewBasicPageIndex:           20
    property int switchBasicPageIndex:              21
    property int tabBarBasicPageIndex:              22
    property int textAreaBasicPageIndex:            23
    property int textFieldBasicPageIndex:           24
    property int toolTipBasicPageIndex:             25
    property int tumblerBasicPageIndex:             26
    property int stackViewBasicPageIndex:           27
    property int dialogBasicPageIndex:              28
    property int titledPageIndex:                   29
    property int tabbedPageIndex:                   30
    property int titledTabbedPageIndex:             31
    property int buttonedPageIndex:                 32
    property int titledButtonedPageIndex:           33
    property int labelPageIndex:                    34
    property int delegatePageIndex:                 35
    property int dialogPageIndex:                   36
    property int notificationPageIndex:             37
    property int imageDashboardPage1Index:          38
    property int formTextInputPageIndex:            39
    property int carouselPageIndex:                 40
    property int gmailInboxPage1Index:              41
    property int solidExplorerFileViewerPageIndex:  42
    property int parallaxPageIndex:                 43
    property int imageViewPageIndex:                44
    property int scrollingBehaviorSingleToolbar:    45
    property int scrollingBehaviorMultipleToolbar:  46
    property int chipsPageIndex:                    47
    //    property int cardsPageIndex:            13
    viewNavigationModel: [
        { view: "pages/OnBoardingPage.qml",                                 stacked: false },
        { view: "pages/SettingsPage.qml",                                   stacked: true },
        { view: "pages/AboutPage.qml",                                      stacked: true },
        { view: "pages/basic/BusyIndicatorBasicPage.qml",                   stacked: false },
        { view: "pages/basic/ButtonBasicPage.qml",                          stacked: false },
        { view: "pages/basic/CheckBoxBasicPage.qml",                        stacked: false },
        { view: "pages/basic/RadioButtonBasicPage.qml",                     stacked: false },
        { view: "pages/basic/ComboBoxBasicPage.qml",                        stacked: false },
        { view: "pages/basic/DelayButtonBasicPage.qml",                     stacked: false },
        { view: "pages/basic/DialBasicPage.qml",                            stacked: false },
        { view: "pages/basic/DelegateBasicPage.qml",                        stacked: false },
        { view: "pages/basic/FrameBasicPage.qml",                           stacked: false },
        { view: "pages/basic/GroupBoxBasicPage.qml",                        stacked: false },
        { view: "pages/basic/PageIndicatorBasicPage.qml",                   stacked: false },
        { view: "pages/basic/ProgressBarBasicPage.qml",                     stacked: false },
        { view: "pages/basic/ScrollBarBasicPage.qml",                       stacked: false },
        { view: "pages/basic/ScrollIndicatorBasicPage.qml",                 stacked: false },
        { view: "pages/basic/RangeSliderBasicPage.qml",                     stacked: false },
        { view: "pages/basic/SliderBasicPage.qml",                          stacked: false },
        { view: "pages/basic/SpinBoxBasicPage.qml",                         stacked: false },
        { view: "pages/basic/SwipeViewBasicPage.qml",                       stacked: false },
        { view: "pages/basic/SwitchBasicPage.qml",                          stacked: false },
        { view: "pages/basic/TabBarBasicPage.qml",                          stacked: false },
        { view: "pages/basic/TextAreaBasicPage.qml",                        stacked: false },
        { view: "pages/basic/TextFieldBasicPage.qml",                       stacked: false },
        { view: "pages/basic/ToolTipBasicPage.qml",                         stacked: false },
        { view: "pages/basic/TumblerBasicPage.qml",                         stacked: false },
        { view: "pages/basic/StackViewBasicPage.qml",                       stacked: false },
        { view: "pages/basic/DialogBasicPage.qml",                          stacked: false },
        { view: "pages/extended/TitledPage.qml",                            stacked: false },
        { view: "pages/extended/TabbedPage.qml",                            stacked: false },
        { view: "pages/extended/TitledTabbedPage.qml",                      stacked: false },
        { view: "pages/extended/ButtonedPage.qml",                          stacked: false },
        { view: "pages/extended/TitledButtonedPage.qml",                    stacked: false },
        { view: "pages/extended/LabelPage.qml",                             stacked: false },
        { view: "pages/extended/DelegatePage.qml",                          stacked: false },
        { view: "pages/extended/DialogPage.qml",                            stacked: false },
        { view: "pages/extended/NotificationPage.qml",                      stacked: false },
        { view: "pages/demos/ImageDashboardPage1.qml",                      stacked: false },
        { view: "pages/extended/FormTextInputPage.qml",                     stacked: false },
        { view: "pages/extended/CarouselPage.qml",                          stacked: false },
        { view: "pages/demos/GmailInboxPage1.qml",                          stacked: false },
        { view: "pages/demos/SolidExplorerFileViewerPage.qml",              stacked: false },
        { view: "pages/extended/ParallaxPage.qml",                          stacked: false },
        { view: "pages/extended/ImageViewPage.qml",                         stacked: false },
        { view: "pages/extended/ScrollingBehaviorSingleToolbarPage.qml",    stacked: false },
        { view: "pages/extended/ScrollingBehaviorMultipleToolbarPage.qml",  stacked: false },
        { view: "pages/extended/ChipPage.qml",                              stacked: false }
        //        { view: "pages/CardsPage.qml",          stacked: false }
    ]
}
