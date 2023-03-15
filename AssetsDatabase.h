#ifndef ASSETSDATABASE_H
#define ASSETSDATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QFile>
#include <QDir>
#include <QDebug>
#include <QSqlError>

class AssetsDatabase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool messegePopQml READ messegePopQml WRITE setMessegePopQml NOTIFY messegePopQmlChanged)

public:
    explicit AssetsDatabase(QObject *parent = nullptr);
    ~AssetsDatabase();


public:
    void createOfficeAssetsDatabase();

    bool messegePopQml() const;
    void setMessegePopQml(bool newMessegePopQml);


signals:
    void messegePopQmlChanged();

public slots:
    void storeLaptopAssetsDeatails(QString m_empid,QString m_empname,QString m_lapname,QString m_lapid,QString m_damage,QString m_appdate,QString m_duedate);
    void storeBagAssetsDeatails(QString m_empid,QString m_empname,QString m_bagname,QString m_bagid,QString m_damage);
    void otherAssetsDeatails(QString m_empid,QString m_empname,QString m_item1,QString m_item2,QString m_item3,QString m_item4,QString item5);
    void booksAssetsDeatails(QString m_empid,QString m_empname,QString m_book1,QString m_book2,QString m_book3,QString m_book4,QString m_book5);
    void updateLaptopAssetsDeatails(QString m_empid,QString m_empname,QString m_lapname,QString m_lapid,QString m_damage,QString m_appdate,QString m_duedate);
    void updateBagAssetsDeatails(QString m_empid,QString m_empname,QString m_bagname,QString m_bagid,QString m_damage);
    void updateotherAssetsDeatails(QString m_empid,QString m_empname,QString m_item1,QString m_item2,QString m_item3,QString m_item4,QString m_item5);
    void updateBooksAssetsDeatails(QString m_empid,QString m_empname,QString m_book1,QString m_book2,QString m_book3,QString m_book4,QString m_book5);

private:
    QSqlDatabase m_database;
    bool m_messegePopQml;


};

#endif // ASSETSDATABASE_H
