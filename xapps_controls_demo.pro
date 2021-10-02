#************  Qt Configurations  *****************************************************************
QT += qml quick quickcontrols2 svg xml core5compat
CONFIG += c++11 #qtquickcompiler
DEFINES += QT_DEPRECATED_WARNINGS
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000


#************  X 3rd Party Libs  ******************************************************************


#************  X Modules  *************************************************************************
include($$PWD/../x_material_controls/x_material_controls.pri)
include($$PWD/../x_utils/x_utils.pri)


#************  QML Configurations  ****************************************************************
QML_IMPORT_PATH += $$PWD/qml
QML_DESIGNER_IMPORT_PATH =


#************  App Sources  ***********************************************************************
HEADERS += \
    $$PWD/src/app/applicationmanager.hpp \
    $$PWD/src/app/applicationsettings.hpp

SOURCES += \
    $$PWD/src/app/applicationmanager.cpp \
    $$PWD/src/app/applicationsettings.cpp \
    $$PWD/src/app/main.cpp

INCLUDEPATH += \
    $$PWD/src/app


#************  Resources  *************************************************************************
RESOURCES += \
    $$PWD/resources.qrc


#************  Images Files  **********************************************************************
DISTFILES += \
    $$PWD/img/app/icon_launcher.svg \
    $$PWD/img/app/logo.svg \
    $$PWD/img/app/logo_foreground.svg \
    $$PWD/img/app/qt_logo_2016.svg \
    $$PWD/img/app/flaticon_logo.svg \
    $$PWD/img/app/drawer_header.png \
    $$PWD/img/app/drawer_header@2x.png \
    $$PWD/img/app/drawer_header@3x.png \
    $$PWD/img/app/drawer_header@4x.png \
    $$PWD/img/icons/arrow-down-thick.svg \
    $$PWD/img/icons/arrow-left.svg \
    $$PWD/img/icons/arrow-left-thick.svg \
    $$PWD/img/icons/arrow-right-thick.svg \
    $$PWD/img/icons/arrow-up-thick.svg \
    $$PWD/img/icons/autorenew.svg \
    $$PWD/img/icons/calendar-edit.svg \
    $$PWD/img/icons/check.svg \
    $$PWD/img/icons/chevron-right.svg \
    $$PWD/img/icons/gmail_plus_1.svg \
    $$PWD/img/icons/dots-vertical.svg \
    $$PWD/img/icons/file.svg \
    $$PWD/img/icons/folder.svg \
    $$PWD/img/icons/heart.svg \
    $$PWD/img/icons/heart-outline.svg \
    $$PWD/img/icons/comment-outline.svg \
    $$PWD/img/icons/hexagon-slice-2.svg \
    $$PWD/img/icons/home.svg \
    $$PWD/img/icons/image-size-select-actual.svg \
    $$PWD/img/icons/information.svg \
    $$PWD/img/icons/magnet-on.svg \
    $$PWD/img/icons/magnify.svg \
    $$PWD/img/icons/martini.svg \
    $$PWD/img/icons/menu.svg \
    $$PWD/img/icons/movie.svg \
    $$PWD/img/icons/music.svg \
    $$PWD/img/icons/newspaper.svg \
    $$PWD/img/icons/package.svg \
    $$PWD/img/icons/plus.svg \
    $$PWD/img/icons/puzzle.svg \
    $$PWD/img/icons/radioactive.svg \
    $$PWD/img/icons/reload.svg \
    $$PWD/img/icons/settings.svg \
    $$PWD/img/icons/snowflake.svg \
    $$PWD/img/icons/star.svg \
    $$PWD/img/icons/star-outline.svg \
    $$PWD/img/icons/store.svg \
    $$PWD/img/icons/tag.svg \
    $$PWD/img/icons/truck.svg \
    $$PWD/img/icons/tune.svg \
    $$PWD/img/avatars/avatar_1.svg \
    $$PWD/img/avatars/avatar_1.png \
    $$PWD/img/avatars/avatar_1@2x.png \
    $$PWD/img/avatars/avatar_1@3x.png \
    $$PWD/img/avatars/avatar_1@4x.png \
    $$PWD/img/avatars/avatar_2.svg \
    $$PWD/img/avatars/avatar_2.png \
    $$PWD/img/avatars/avatar_2@2x.png \
    $$PWD/img/avatars/avatar_2@3x.png \
    $$PWD/img/avatars/avatar_2@4x.png \
    $$PWD/img/avatars/avatar_3.svg \
    $$PWD/img/avatars/avatar_3.png \
    $$PWD/img/avatars/avatar_3@2x.png \
    $$PWD/img/avatars/avatar_3@3x.png \
    $$PWD/img/avatars/avatar_3@4x.png \
    $$PWD/img/avatars/avatar_4.svg \
    $$PWD/img/avatars/avatar_4.png \
    $$PWD/img/avatars/avatar_4@2x.png \
    $$PWD/img/avatars/avatar_4@3x.png \
    $$PWD/img/avatars/avatar_4@4x.png \
    $$PWD/img/avatars/avatar_5.svg \
    $$PWD/img/avatars/avatar_5.png \
    $$PWD/img/avatars/avatar_5@2x.png \
    $$PWD/img/avatars/avatar_5@3x.png \
    $$PWD/img/avatars/avatar_5@4x.png \
    $$PWD/img/avatars/avatar_6.svg \
    $$PWD/img/avatars/avatar_6.png \
    $$PWD/img/avatars/avatar_6@2x.png \
    $$PWD/img/avatars/avatar_6@3x.png \
    $$PWD/img/avatars/avatar_6@4x.png \
    $$PWD/img/avatars/avatar_7.svg \
    $$PWD/img/avatars/avatar_7.png \
    $$PWD/img/avatars/avatar_7@2x.png \
    $$PWD/img/avatars/avatar_7@3x.png \
    $$PWD/img/avatars/avatar_7@4x.png \
    $$PWD/img/avatars/avatar_8.svg \
    $$PWD/img/avatars/avatar_8.png \
    $$PWD/img/avatars/avatar_8@2x.png \
    $$PWD/img/avatars/avatar_8@3x.png \
    $$PWD/img/avatars/avatar_8@4x.png \
    $$PWD/img/avatars/avatar_9.svg \
    $$PWD/img/avatars/avatar_9.png \
    $$PWD/img/avatars/avatar_9@2x.png \
    $$PWD/img/avatars/avatar_9@3x.png \
    $$PWD/img/avatars/avatar_9@4x.png \
    $$PWD/img/banners/banner_1.jpg \
    $$PWD/img/banners/banner_2.jpg \
    $$PWD/img/banners/banner_3.jpg \
    $$PWD/img/animals_pictures/landscape_picture_1.jpg \
    $$PWD/img/animals_pictures/portrait_picture_1.jpg \
    $$PWD/img/animals_pictures/square_picture_1.jpg \
    $$PWD/img/animals_pictures/square_picture_2.jpg \
    $$PWD/img/animals_pictures/square_picture_3.jpg \
    $$PWD/img/animals_pictures/square_picture_4.jpg \
    $$PWD/img/animals_pictures/square_picture_5.jpg \
    $$PWD/img/animals_pictures/square_picture_6.jpg \
    $$PWD/img/animals_pictures/square_picture_7.jpg \
    $$PWD/img/on_boarding/rocket.svg \
    $$PWD/img/on_boarding/design.svg \
    $$PWD/img/on_boarding/idea.svg


#************  QML Files  *************************************************************************
DISTFILES += \
    $$PWD/qml/Main.qml \
    $$PWD/qml/pages/SplashPage.qml \
    $$PWD/qml/pages/OnBoardingPage.qml \
    $$PWD/qml/pages/SettingsPage.qml \
    $$PWD/qml/pages/AboutPage.qml \
    $$PWD/qml/pages/basic/BusyIndicatorBasicPage.qml \
    $$PWD/qml/pages/basic/ButtonBasicPage.qml \
    $$PWD/qml/pages/basic/CheckBoxBasicPage.qml \
    $$PWD/qml/pages/basic/ComboBoxBasicPage.qml \
    $$PWD/qml/pages/basic/DelayButtonBasicPage.qml \
    $$PWD/qml/pages/basic/DelegateBasicPage.qml \
    $$PWD/qml/pages/basic/DialBasicPage.qml \
    $$PWD/qml/pages/basic/DialogBasicPage.qml \
    $$PWD/qml/pages/basic/FrameBasicPage.qml \
    $$PWD/qml/pages/basic/GroupBoxBasicPage.qml \
    $$PWD/qml/pages/basic/PageIndicatorBasicPage.qml \
    $$PWD/qml/pages/basic/ProgressBarBasicPage.qml \
    $$PWD/qml/pages/basic/RadioButtonBasicPage.qml \
    $$PWD/qml/pages/basic/RangeSliderBasicPage.qml \
    $$PWD/qml/pages/basic/ScrollBarBasicPage.qml \
    $$PWD/qml/pages/basic/ScrollIndicatorBasicPage.qml \
    $$PWD/qml/pages/basic/SliderBasicPage.qml \
    $$PWD/qml/pages/basic/SpinBoxBasicPage.qml \
    $$PWD/qml/pages/basic/SwipeViewBasicPage.qml \
    $$PWD/qml/pages/basic/SwitchBasicPage.qml \
    $$PWD/qml/pages/basic/TabBarBasicPage.qml \
    $$PWD/qml/pages/basic/TextAreaBasicPage.qml \
    $$PWD/qml/pages/basic/TextFieldBasicPage.qml \
    $$PWD/qml/pages/basic/ToolTipBasicPage.qml \
    $$PWD/qml/pages/basic/TumblerBasicPage.qml \
    $$PWD/qml/pages/extended/ButtonedPage.qml \
    $$PWD/qml/pages/extended/CarouselPage.qml \
    $$PWD/qml/pages/extended/ChipPage.qml \
    $$PWD/qml/pages/extended/DelegatePage.qml \
    $$PWD/qml/pages/extended/DialogPage.qml \
    $$PWD/qml/pages/extended/FormTextInputPage.qml \
    $$PWD/qml/pages/extended/ImageViewPage.qml \
    $$PWD/qml/pages/extended/LabelPage.qml \
    $$PWD/qml/pages/extended/NotificationPage.qml \
    $$PWD/qml/pages/extended/ParallaxPage.qml \
    $$PWD/qml/pages/extended/ScrollingBehaviorSingleToolbarPage.qml \
    $$PWD/qml/pages/extended/ScrollingBehaviorMultipleToolbarPage.qml \
    $$PWD/qml/pages/extended/TabbedPage.qml \
    $$PWD/qml/pages/extended/TitledButtonedPage.qml \
    $$PWD/qml/pages/extended/TitledPage.qml \
    $$PWD/qml/pages/extended/TitledTabbedPage.qml \
    $$PWD/qml/pages/demos/ImageDashboardPage1.qml \
    $$PWD/qml/pages/demos/GmailInboxPage1.qml \
    $$PWD/qml/pages/demos/SolidExplorerFileViewerPage.qml \
    $$PWD/qml/custom/PictureFooter1.qml \
    $$PWD/qml/custom/SimpleTextPane.qml \
    $$PWD/qml/custom/GmailItem1.qml \
    $$PWD/qml/custom/SolidExplorerFileItem.qml \
    $$PWD/qml/custom/SolidExplorerNavItem.qml


##************  Android Configurations  ************************************************************
android {
    DISTFILES += \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/gradle/wrapper/gradle-wrapper.jar \
        $$PWD/android/gradle/wrapper/gradle-wrapper.properties \
        $$PWD/android/gradlew \
        $$PWD/android/gradlew.bat \
        $$PWD/android/build.gradle \
        $$PWD/android/res/values/libs.xml \
        $$PWD/android/res/drawable/splashscreen.xml \
        $$PWD/android/res/mipmap-ldpi/icon_launcher.png \
        $$PWD/android/res/mipmap-mdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-hdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xhdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xxhdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xxxhdpi/icon_launcher.png

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

#contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
#    QT += androidextras
#    ANDROID_PACKAGE_SOURCE_DIR = \
#        $$PWD/android
#}
