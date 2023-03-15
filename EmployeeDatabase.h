#ifndef EMPLOYEEDATABASE_H
#define EMPLOYEEDATABASE_H

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QFile>
#include <QObject>
#include <QDir>
#include <QDebug>

#include <QStandardPaths>


class EmployeeDatabase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool messegePopQml READ messegePopQml WRITE setMessegePopQml NOTIFY messegePopQmlChanged)
    Q_PROPERTY(QString empid READ empid WRITE setEmpid NOTIFY empidChanged)
    Q_PROPERTY(QString empname READ empname WRITE setEmpname NOTIFY empnameChanged)
    Q_PROPERTY(QString empemail READ empemail WRITE setEmpemail NOTIFY empemailChanged)

    //assets
    Q_PROPERTY(QString laptopid READ laptopid WRITE setLaptopid NOTIFY laptopidChanged)
    Q_PROPERTY(QString laptopname READ laptopname WRITE setLaptopname NOTIFY laptopnameChanged)
    Q_PROPERTY(QString lapdamage READ lapdamage WRITE setLapdamage NOTIFY lapdamageChanged)
    Q_PROPERTY(QString lapappdate READ lapappdate WRITE setLapappdate NOTIFY lapappdateChanged)
    Q_PROPERTY(QString lapduedate READ lapduedate WRITE setLapduedate NOTIFY lapduedateChanged)

    Q_PROPERTY(QString bagid READ bagid WRITE setBagid NOTIFY bagidChanged)
    Q_PROPERTY(QString bagname READ bagname WRITE setBagname NOTIFY badnameChanged)
    Q_PROPERTY(QString bagdamage READ bagdamage WRITE setBagdamage NOTIFY bagdamageChanged)
    Q_PROPERTY(QString bagappdate READ bagappdate WRITE setBagappdate NOTIFY bagappdateChanged)
    Q_PROPERTY(QString bagduedate READ bagduedate WRITE setBagduedate NOTIFY bagduedateChanged)

    Q_PROPERTY(QString item1 READ item1 WRITE setItem1 NOTIFY item1Changed)
    Q_PROPERTY(QString item2 READ item2 WRITE setItem2 NOTIFY item2Changed)
    Q_PROPERTY(QString item3 READ item3 WRITE setItem3 NOTIFY item3Changed)
    Q_PROPERTY(QString item4 READ item4 WRITE setItem4 NOTIFY item4Changed)
    Q_PROPERTY(QString item5 READ item5 WRITE setItem5 NOTIFY item5Changed)

    Q_PROPERTY(QString book1 READ book1 WRITE setBook1 NOTIFY book1Changed)
    Q_PROPERTY(QString book2 READ book2 WRITE setBook2 NOTIFY book2Changed)
    Q_PROPERTY(QString book3 READ book3 WRITE setBook3 NOTIFY book3Changed)
    Q_PROPERTY(QString book4 READ book4 WRITE setBook4 NOTIFY book4Changed)
    Q_PROPERTY(QString book5 READ book5 WRITE setBook5 NOTIFY book5Changed)




public:
    explicit EmployeeDatabase(QObject *parent = nullptr);
    ~EmployeeDatabase();


public:
    void createEmpDatabase();
    void readEmployeeData();
    void loadAssets(QString m_id,QString m_name);





    bool messegePopQml() const;
    void setMessegePopQml(bool newMessegePopQml);


    const QString &empid() const;
    void setEmpid(const QString &newEmpid);

    const QString &empname() const;
    void setEmpname(const QString &newEmpname);


    const QString &empemail() const;
    void setEmpemail(const QString &newEmpemail);


    //assets
    const QString &laptopid() const;
    void setLaptopid(const QString &newLaptopid);

    const QString &laptopname() const;
    void setLaptopname(const QString &newLaptopname);

    const QString &lapdamage() const;
    void setLapdamage(const QString &newLapdamage);

    const QString &bagid() const;
    void setBagid(const QString &newBagid);

    const QString &bagname() const;
    void setBagname(const QString &newBagname);

    const QString &bagdamage() const;
    void setBagdamage(const QString &newBagdamage);

    const QString &item1() const;
    void setItem1(const QString &newItem1);

    const QString &item2() const;
    void setItem2(const QString &newItem2);

    const QString &item3() const;
    void setItem3(const QString &newItem3);

    const QString &item4() const;
    void setItem4(const QString &newItem4);

    const QString &lapappdate() const;
    void setLapappdate(const QString &newLapappdate);

    const QString &lapduedate() const;
    void setLapduedate(const QString &newLapduedate);

    const QString &bagappdate() const;
    void setBagappdate(const QString &newBagappdate);

    const QString &bagduedate() const;
    void setBagduedate(const QString &newBagduedate);

    const QString &item5() const;
    void setItem5(const QString &newItem5);


    const QString &book1() const;
    void setBook1(const QString &newBook1);

    const QString &book2() const;
    void setBook2(const QString &newBook2);

    const QString &book3() const;
    void setBook3(const QString &newBook3);

    const QString &book4() const;
    void setBook4(const QString &newBook4);

    const QString &book5() const;
    void setBook5(const QString &newBook5);

signals:
    void messegePopQmlChanged();
    void empidChanged();
    void empnameChanged();
    void empemailChanged();

    void sendemp_deatails(QString name,QString id,QString email);

    //assets
    void laptopidChanged();
    void laptopnameChanged();
    void lapdamageChanged();
    void lapappdateChanged();
    void lapduedateChanged();

    void bagidChanged();
    void badnameChanged();
    void bagdamageChanged();
    void bagappdateChanged();
    void bagduedateChanged();

    void item1Changed();
    void item2Changed();
    void item3Changed();
    void item4Changed();
    void item5Changed();

    void book1Changed();
    void book2Changed();
    void book3Changed();
    void book4Changed();
    void book5Changed();

public slots:

    void storeEmployeeDeatails(QString m_name,QString m_id,QString m_email,QString m_password,QString m_confirmpassword);

    void authorityVerifyEmployee(QString m_id,QString m_name);
    void updateEmployeeDeatails(QString m_id,QString m_name,QString m_empid,QString m_empname,QString m_empemail);
    void removeEmoployee(QString m_id,QString m_name);


private:
    QSqlDatabase m_database;

    bool m_messegePopQml;


    QString m_empid;
    QString m_empname;
    QString m_empemail;

    //assets
    QString m_laptopid;
    QString m_laptopname;
    QString m_lapdamage;
    QString m_lapappdate;
    QString m_lapduedate;
    QString m_bagid;
    QString m_bagname;
    QString m_bagdamage;
    QString m_bagappdate;
    QString m_bagduedate;
    QString m_item1;
    QString m_item2;
    QString m_item3;
    QString m_item4;
    QString m_item5;

    QString m_book1;
    QString m_book2;
    QString m_book3;
    QString m_book4;
    QString m_book5;


};

#endif // EMPLOYEEDATABASE_H
