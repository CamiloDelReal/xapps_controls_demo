#ifndef APPLICATIONSETTINGS_H
#define APPLICATIONSETTINGS_H

#include <QObject>
#include <QVariant>

class ApplicationSettings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString version READ version WRITE setVersion NOTIFY versionChanged)

    Q_PROPERTY(quint32 primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(quint32 accentColor READ accentColor WRITE setAccentColor NOTIFY accentColorChanged)
    Q_PROPERTY(quint32 theme READ theme WRITE setTheme NOTIFY themeChanged)

    Q_PROPERTY(bool firstExecution READ firstExecution WRITE setFirstExecution NOTIFY firstExecutionChanged)

    Q_PROPERTY(QString currentLanguage READ currentLanguage WRITE setCurrentLanguage NOTIFY currentLanguageChanged)

public:
    explicit ApplicationSettings(QObject *parent = nullptr);

    Q_INVOKABLE void resetSettings();

    void saveSettings();

    QString version() const;
    quint32 primaryColor() const;
    quint32 accentColor() const;
    quint32 theme() const;
    bool firstExecution() const;
    QString currentLanguage() const;

public slots:
    void setVersion(const QString &version);
    void setPrimaryColor(const quint32 &primaryColor);
    void setAccentColor(const quint32 &accentColor);
    void setTheme(const quint32 &theme);
    void setFirstExecution(const bool &firstExecution);
    void setCurrentLanguage(const QString &currentLanguage);

signals:
    void settingsChanged();

    void versionChanged(const QString &version);
    void primaryColorChanged(const quint32 &primaryColor);
    void accentColorChanged(const quint32 &accentColor);
    void themeChanged(const quint32 &theme);
    void firstExecutionChanged(const bool &firstExecution);
    void currentLanguageChanged(const QString &currentLanguage);

private:
    QString m_version;
    quint32 m_primaryColor;
    quint32 m_accentColor;
    quint32 m_theme;
    bool m_firstExecution;
    QString m_currentLanguage;

    QString m_settingsFilePath;

    QVariantMap toVariantMap();
    void fillFromVariantMap(const QVariantMap &map);

    void defaultSettings();
    void loadSettings();
};

#endif // APPLICATIONSETTINGS_H
