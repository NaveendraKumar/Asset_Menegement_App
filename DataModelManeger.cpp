#include "DataModelManeger.h"
#include "qdebug.h"

DataModelManeger::DataModelManeger(QObject *parent)
    : QObject{parent}
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
    empmodel=new EmployeeModel;
    empdatabase=new EmployeeDatabase;
    init();

}

DataModelManeger::~DataModelManeger()
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
}

void DataModelManeger::init()
{

    connect(empdatabase,&EmployeeDatabase::sendemp_deatails,empmodel,&EmployeeModel::received_employee_list);
    empdatabase->readEmployeeData();
}

EmployeeModel *DataModelManeger::getEmpmodel() const
{
    return empmodel;
}

void DataModelManeger::setEmpmodel(EmployeeModel *newEmpmodel)
{
    empmodel = newEmpmodel;
}
