#ifndef OFFICEAUTHORITYDATABASE_H
#define OFFICEAUTHORITYDATABASE_H

#include <QDebug>
#include <QObject>
#include<QSqlDatabase>
#include <QSqlQuery>
#include <QFile>
#include <QDir>

class OfficeAuthorityDatabase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool messegePopQml READ messegePopQml WRITE setMessegePopQml NOTIFY messegePopQmlChanged)
    Q_PROPERTY(QString authId READ authId WRITE setAuthId NOTIFY authIdChanged)
    Q_PROPERTY(QString authName READ authName WRITE setAuthName NOTIFY authNameChanged)


public:
    explicit OfficeAuthorityDatabase(QObject *parent = nullptr);
    ~OfficeAuthorityDatabase();


public:
    void createOfficeAuthDatabase();


    bool messegePopQml() const;
    void setMessegePopQml(bool newMessegePopQml);

    const QString &authName() const;
    void setAuthName(const QString &newAuthName);

    const QString &authId() const;
    void setAuthId(const QString &newAuthId);

signals:
    void messegePopQmlChanged();
    void authIdChanged();
    void authNameChanged();


public slots:
    void authorityLoginVerify(QString m_id,QString m_password);
    void insertAuthorityEmployee(QString m_name,QString m_id,QString m_password);

private:
    QSqlDatabase m_authDatabase;

    bool m_messegePopQml;
    QString m_authName;
    QString m_authId;

};

#endif // OFFICEAUTHORITYDATABASE_H
