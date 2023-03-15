#ifndef EMPLOYEEMODEL_H
#define EMPLOYEEMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QDebug>
#include <Employee.h>
#include <QAbstractListModel>
class EmployeeModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit EmployeeModel(QObject *parent = nullptr);
    ~EmployeeModel();

public:
    void init();

    // QAbstractItemModel interface

public:

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

public slots:

    void received_employee_list(QString name,QString id,QString email);

private:

    QList<Employee*> m_employeelist;
    Employee *employee;
};

#endif // EMPLOYEEMODEL_H
