#include "EmployeeModel.h"
#include "qdebug.h"

EmployeeModel::EmployeeModel(QObject *parent)
    : QAbstractListModel{parent}
{
    qInfo()<<Q_FUNC_INFO;
    qInfo()<<"Employee Model Constructor";
}

EmployeeModel::~EmployeeModel()
{
    qInfo()<<Q_FUNC_INFO;
    qInfo()<<"Employee Model Distructor";
}

void EmployeeModel::init()
{

}

int EmployeeModel::rowCount(const QModelIndex &parent) const
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
    return m_employeelist.size();
}

QVariant EmployeeModel::data(const QModelIndex &index, int role) const
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
    int row=index.row();
    Employee *emp=m_employeelist.at(row);
    switch (role) {
    case 1:return emp->employeeid();

        break;
    case 2:return emp->employeename();

        break;
    case 3:return emp->employeeemail();

        break;
    default:
        break;
    }
}

QHash<int, QByteArray> EmployeeModel::roleNames() const
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
    QHash<int,QByteArray> roles;
    roles[1]="EMPID";
    roles[2]="EMPNAME";
    roles[3]="EMPEmail";
    return roles;
}
void EmployeeModel::received_employee_list(QString name, QString id, QString email)
{
    qInfo()<<Q_FUNC_INFO;
//    qInfo()<<id<<Qt::endl;
//    qInfo()<<name<<Qt::endl;
//    qInfo()<<email<<Qt::endl;
    employee = new Employee;
    employee->setEmployeeid(id);
    employee->setEmployeename(name);
    employee->setEmployeeemail(email);
    m_employeelist.append(employee);
}
