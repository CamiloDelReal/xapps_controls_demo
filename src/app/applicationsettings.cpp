#include <QStandardPaths>
#include <QJsonDocument>
#include <QFile>
#include <QFileInfo>

#include "applicationsettings.hpp"
#include "pathutils.hpp"


static const QString APP_VERSION = QStringLiteral("1.0.0");

static const QString SETTINGS_FILE_NAME = QStringLiteral("settingsdata.json");

static const QString SETTINGS_VERSION_STR_KEY = QStringLiteral("version");
static const QString SETTINGS_PRIMARY_COLOR_STR_KEY = QStringLiteral("primaryColor");
static const QString SETTINGS_ACCENT_COLOR_STR_KEY = QStringLiteral("accentColor");
static const QString SETTINGS_THEME_STR_KEY = QStringLiteral("theme");
static const QString SETTINGS_FIRST_EXECUTION_STR_KEY = QStringLiteral("firstExecution");
static const QString SETTINGS_CURRENT_LANGUAGE_STR_KEY = QStringLiteral("currentLanguage");


ApplicationSettings::ApplicationSettings(QObject *parent)
    : QObject(parent)
{
    m_settingsFilePath = QStandardPaths::standardLocations(QStandardPaths::AppDataLocation).value(0)
            + PathUtils::SEPARATOR + SETTINGS_FILE_NAME;

    m_version = APP_VERSION;

    QFileInfo settingsFileInfo(m_settingsFilePath);

    if(settingsFileInfo.exists() || settingsFileInfo.size() != 0)
    {
        loadSettings();
        //Maybe some work when the version were different
    }
    else
    {
        defaultSettings();
    }
}

void ApplicationSettings::resetSettings()
{    
    defaultSettings();

    emit settingsChanged();
}

void ApplicationSettings::saveSettings()
{
    PathUtils::makeParentPath(m_settingsFilePath);
    QFile settingsFile(m_settingsFilePath);
    if(settingsFile.open(QIODevice::WriteOnly))
    {
        QJsonDocument settingsJsonDoc = QJsonDocument::fromVariant(toVariantMap());
        settingsFile.write(settingsJsonDoc.toJson());
        settingsFile.close();
    }
}

QString ApplicationSettings::version() const
{
    return m_version;
}

quint32 ApplicationSettings::primaryColor() const
{
    return m_primaryColor;
}

quint32 ApplicationSettings::accentColor() const
{
    return m_accentColor;
}

quint32 ApplicationSettings::theme() const
{
    return m_theme;
}

bool ApplicationSettings::firstExecution() const
{
    return m_firstExecution;
}

QString ApplicationSettings::currentLanguage() const
{
    return m_currentLanguage;
}

void ApplicationSettings::setVersion(const QString &version)
{
    if (m_version != version)
    {
        m_version = version;
        emit versionChanged(m_version);
    }
}

void ApplicationSettings::setPrimaryColor(const quint32 &primaryColor)
{
    if (m_primaryColor != primaryColor)
    {
        m_primaryColor = primaryColor;
        emit primaryColorChanged(m_primaryColor);
    }
}

void ApplicationSettings::setAccentColor(const quint32 &accentColor)
{
    if (m_accentColor != accentColor)
    {
        m_accentColor = accentColor;
        emit accentColorChanged(m_accentColor);
    }
}

void ApplicationSettings::setTheme(const quint32 &theme)
{
    if (m_theme != theme)
    {
        m_theme = theme;
        emit themeChanged(m_theme);
    }
}

void ApplicationSettings::setFirstExecution(const bool &firstExecution)
{
    if (m_firstExecution != firstExecution)
    {
        m_firstExecution = firstExecution;
        emit firstExecutionChanged(m_firstExecution);
    }
}

void ApplicationSettings::setCurrentLanguage(const QString &currentLanguage)
{
    if (m_currentLanguage != currentLanguage)
    {
        m_currentLanguage = currentLanguage;
        emit currentLanguageChanged(m_currentLanguage);
    }
}

QVariantMap ApplicationSettings::toVariantMap()
{
    QVariantMap map;

    map.insert(SETTINGS_VERSION_STR_KEY, m_version);
    map.insert(SETTINGS_PRIMARY_COLOR_STR_KEY, m_primaryColor);
    map.insert(SETTINGS_ACCENT_COLOR_STR_KEY, m_accentColor);
    map.insert(SETTINGS_THEME_STR_KEY, m_theme);
    map.insert(SETTINGS_FIRST_EXECUTION_STR_KEY, m_firstExecution);
    map.insert(SETTINGS_CURRENT_LANGUAGE_STR_KEY, m_currentLanguage);

    return map;
}

void ApplicationSettings::fillFromVariantMap(const QVariantMap &map)
{
    m_primaryColor = map.value(SETTINGS_PRIMARY_COLOR_STR_KEY).value<quint32>();
    m_accentColor = map.value(SETTINGS_ACCENT_COLOR_STR_KEY).value<quint32>();
    m_theme = map.value(SETTINGS_THEME_STR_KEY).value<quint32>();
    m_firstExecution = map.value(SETTINGS_FIRST_EXECUTION_STR_KEY).value<bool>();
    m_currentLanguage = map.value(SETTINGS_CURRENT_LANGUAGE_STR_KEY).value<QString>();
}

void ApplicationSettings::defaultSettings()
{
    setPrimaryColor(5);     //Blue
    setAccentColor(0);      //Red
    setTheme(0);            //Light
    setFirstExecution(true);
    setCurrentLanguage(""); //ToDo

    saveSettings();
}

void ApplicationSettings::loadSettings()
{
    QFile settingsFile(m_settingsFilePath);

    if(settingsFile.open(QIODevice::ReadOnly))
    {
        QJsonDocument settingsJsonDoc = QJsonDocument::fromJson(settingsFile.readAll());
        settingsFile.close();

        if(settingsJsonDoc.isObject())
        {
            fillFromVariantMap(settingsJsonDoc.toVariant().toMap());
        }
    }
}
