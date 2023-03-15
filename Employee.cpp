#include "Employee.h"
#include "qdebug.h"

Employee::Employee(QObject *parent)
    : QObject{parent}
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
}

Employee::~Employee()
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;

}

const QString &Employee::employeeid() const
{
    return m_employeeid;
}

void Employee::setEmployeeid(const QString &newEmployeeid)
{
    m_employeeid = newEmployeeid;
}

const QString &Employee::employeename() const
{
    return m_employeename;
}

void Employee::setEmployeename(const QString &newEmployeename)
{
    m_employeename = newEmployeename;
}

const QString &Employee::employeeemail() const
{
    return m_employeeemail;
}

void Employee::setEmployeeemail(const QString &newEmployeeemail)
{
    m_employeeemail = newEmployeeemail;
}

const QString &Employee::employeepassword() const
{
    return m_employeepassword;
}

void Employee::setEmployeepassword(const QString &newEmployeepassword)
{
    m_employeepassword = newEmployeepassword;
}
