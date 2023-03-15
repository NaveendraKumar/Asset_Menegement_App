#ifndef DATAMODELMANEGER_H
#define DATAMODELMANEGER_H
#include <EmployeeModel.h>
#include <EmployeeDatabase.h>
#include <QObject>
#include <QDebug>

class DataModelManeger : public QObject
{
    Q_OBJECT
    Q_PROPERTY(EmployeeModel* empmodel READ getEmpmodel WRITE setEmpmodel NOTIFY empmodelChanged)
public:
    explicit DataModelManeger(QObject *parent = nullptr);
    ~DataModelManeger();


public:
   void init();

   EmployeeModel *getEmpmodel() const;
   void setEmpmodel(EmployeeModel *newEmpmodel);

signals:
   void empmodelChanged();

private:
    EmployeeModel *empmodel;
    EmployeeDatabase *empdatabase;

};

#endif // DATAMODELMANEGER_H
