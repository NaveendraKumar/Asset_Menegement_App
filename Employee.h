#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#include <QObject>
#include <QDebug>

class Employee : public QObject
{
    Q_OBJECT
public:
    explicit Employee(QObject *parent = nullptr);
    ~Employee();

    const QString &employeeid() const;
    void setEmployeeid(const QString &newEmployeeid);

    const QString &employeename() const;
    void setEmployeename(const QString &newEmployeename);

    const QString &employeeemail() const;
    void setEmployeeemail(const QString &newEmployeeemail);

    const QString &employeepassword() const;
    void setEmployeepassword(const QString &newEmployeepassword);

signals:


private:
    QString m_employeeid;
    QString m_employeename;
    QString m_employeeemail;
    QString m_employeepassword;


};

#endif // EMPLOYEE_H
