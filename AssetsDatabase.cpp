#include "AssetsDatabase.h"
#include "qdebug.h"

AssetsDatabase::AssetsDatabase(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Assets Database Constructor"<<Qt::endl;
    createOfficeAssetsDatabase();
}

AssetsDatabase::~AssetsDatabase()
{
    qDebug()<<"Assets Database Distructor"<<Qt::endl;
}

void AssetsDatabase::createOfficeAssetsDatabase()
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QFile file;

    //Connection to the SQL Database
    qDebug()<<"Connect the Database"<<Qt::endl;
    m_database=QSqlDatabase::addDatabase("QSQLITE");
    QString currentpath=QDir::currentPath()+"/Database.db";
    qDebug()<<"CurrentPath="<<currentpath<<Qt::endl;


    file.setFileName(currentpath);
    file.open(QIODevice::ReadWrite);

    QSqlQuery m_query(m_database);
    m_database.setDatabaseName(currentpath);
    m_database.open();
    if(m_database.isOpen()){
        qDebug()<<"Assets Database is Open"<<Qt::endl;
    }else{
        qDebug()<<"Assets Database is not open"<<Qt::endl;
    }

    QString laptop("CREATE TABLE LaptopAssets(empId VARCHAR(20),empName VARCHAR(20),laptopName VARCHAR(20) NOT NULL,laptopId VARCHAR(20) NOT NULL,damage VARCHAR(50),approvalDate VARCHAR(10) NOT NULL,dueDate VARCHAR(20) NOT NULL,Primary KEY(empId));");
    if(m_query.exec(laptop)){
        qDebug()<<"Laptop Assets Table Created Successfully"<<Qt::endl;
    }else{
        qDebug()<<"Laptop Assets Table Not Created"<<Qt::endl;
    }

    QString bag("CREATE TABLE BagAssets(empId VARCHAR(20),empName VARCHAR(20),bagName VARCHAR(20) NOT NULL,bagId VARCHAR(20) NOT NULL,damage VARCHAR(50),Primary KEY(empId));");
    if(m_query.exec(bag)){
        qDebug()<<"Bag Assets Table Created Successfully"<<Qt::endl;
    }else{
        qDebug()<<"Bag Assets Table Not Created"<<Qt::endl;
    }

    QString otherAssets("CREATE TABLE OtherAssets(empId VARCHAR(20),empName VARCHAR(20),Item1 VARCHAR(20) NOT NULL,Item2 VARCHAR(20) NOT NULL,Item3 VARCHAR(20)NOT NULL,Item4 VARCHAR(20),Item5 VARCHAR(20),Primary KEY(empId));");
    if(m_query.exec(otherAssets)){
        qDebug()<<"Other Assets Table Created Successfully"<<Qt::endl;
    }else{
        qDebug()<<"Other Assets Table Not Created"<<Qt::endl;
    }

    QString booksAssets("CREATE TABLE BooksAssets(empId VARCHAR(20),empName VARCHAR(20),Book1 VARCHAR(20) NOT NULL,Book2 VARCHAR(20) NOT NULL,Book3 VARCHAR(20)NOT NULL,Book4 VARCHAR(20),Book5 VARCHAR(20),Primary KEY(empId));");
    if(m_query.exec(booksAssets)){
        qDebug()<<"Books Assets Table Created Successfully"<<Qt::endl;
    }else{
        qDebug()<<"Books Assets Table Not Created"<<Qt::endl;
    }
}
void AssetsDatabase::storeLaptopAssetsDeatails(QString m_empid, QString m_empname, QString m_lapname, QString m_lapid,QString m_damage, QString m_appdate, QString m_duedate)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;

    QSqlQuery qry(m_database);
    if(m_lapname != "" && m_lapid != "")
    {
        qry.prepare("INSERT INTO LaptopAssets(empId,empName,laptopName,laptopId,damage,approvalDate,dueDate)"
                    "VALUES (?,?,?,?,?,?,?)");
        qry.addBindValue(m_empid);
        qry.addBindValue(m_empname);
        qry.addBindValue(m_lapname);
        qry.addBindValue(m_lapid);
        qry.addBindValue(m_damage);
        qry.addBindValue(m_appdate);
        qry.addBindValue(m_duedate);
        bool success=qry.exec();
        if(success){
            qDebug()<<"Laptop Assets Successfully add to Employee"<<Qt::endl;
            setMessegePopQml(true);
            return;
        }
        else{
            qDebug()<<"This Laptop id Issued some Already"<<Qt::endl;
            qDebug()<<"Please Check the Laptop Deatails"<<Qt::endl;
            qDebug()<<"Existing Employee Already Assets Have"<<endl;
            setMessegePopQml(false);
            return;
        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"Laptop Name and Laptop Id Mandatory"<<Qt::endl;
        qDebug()<<"Laptop Asset Database Error"<<Qt::endl;
        qDebug()<<Q_FUNC_INFO<<Qt::endl;
    }
}

void AssetsDatabase::storeBagAssetsDeatails(QString m_empid, QString m_empname, QString m_bagname, QString m_bagid, QString m_damage)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;

    QSqlQuery qry(m_database);
    if(m_empid != "" && m_empname != "" && m_bagname != "" && m_bagid != "")
    {
        qry.prepare("INSERT INTO BagAssets(empId,empName,bagName,bagId,damage)"
                    "VALUES (?,?,?,?,?)");
        qry.addBindValue(m_empid);
        qry.addBindValue(m_empname);
        qry.addBindValue(m_bagname);
        qry.addBindValue(m_bagid);
        qry.addBindValue(m_damage);

        bool success=qry.exec();
        if(success){
            qDebug()<<"Bag Assets Successfully add to Employee"<<Qt::endl;
            setMessegePopQml(true);
            return;
        }
        else{
            qDebug()<<"This Bag id Issued some Already"<<Qt::endl;
            qDebug()<<"Please Check the Bag Deatails"<<Qt::endl;
            setMessegePopQml(false);
            return;
        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"Bag Name and Bag Id Mandatory"<<Qt::endl;
        qDebug()<<"Bag Asset Database Error"<<Qt::endl;
        qDebug()<<Q_FUNC_INFO<<Qt::endl;
    }
}

void AssetsDatabase::otherAssetsDeatails(QString m_empid, QString m_empname, QString m_item1, QString m_item2, QString m_item3, QString m_item4,QString m_item5)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;

    QSqlQuery qry(m_database);
    if(m_empid != "" && m_empname != ""&&m_item1!="" &&m_item2!="" &&m_item3!="" &&m_item4!=""&&m_item5!="" )
    {
        qry.prepare("INSERT INTO OtherAssets(empId,empName,Item1,Item2,Item3,Item4,Item5)"
                    "VALUES (?,?,?,?,?,?,?)");
        qry.addBindValue(m_empid);
        qry.addBindValue(m_empname);
        qry.addBindValue(m_item1);
        qry.addBindValue(m_item2);
        qry.addBindValue(m_item3);
        qry.addBindValue(m_item4);
        qry.addBindValue(m_item5);
        bool success=qry.exec();
        if(success){
            qDebug()<<"Other Assets Successfully add to Employee"<<Qt::endl;
            setMessegePopQml(true);
            return;
        }
        else{
            qDebug()<<"This Other id Issued some Already"<<Qt::endl;
            qDebug()<<"Please Check the Assets Deatails"<<Qt::endl;
            setMessegePopQml(false);
            return;
        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"Assets Name and Laptop Id Mandatory"<<Qt::endl;
        qDebug()<<"Other Asset Database Error"<<Qt::endl;
        qDebug()<<Q_FUNC_INFO<<Qt::endl;
    }
}

void AssetsDatabase::booksAssetsDeatails(QString m_empid, QString m_empname, QString m_book1, QString m_book2, QString m_book3, QString m_book4, QString m_book5)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;

    QSqlQuery qry(m_database);
    if(m_empid != "" && m_empname != ""&&m_book1!="" &&m_book2!="" &&m_book3!="" &&m_book4!=""&&m_book5!="" )
    {
        qry.prepare("INSERT INTO BooksAssets(empId,empName,Book1,Book2,Book3,Book4,Book5)"
                    "VALUES (?,?,?,?,?,?,?)");
        qry.addBindValue(m_empid);
        qry.addBindValue(m_empname);
        qry.addBindValue(m_book1);
        qry.addBindValue(m_book2);
        qry.addBindValue(m_book3);
        qry.addBindValue(m_book4);
        qry.addBindValue(m_book5);
        bool success=qry.exec();
        if(success){
            qDebug()<<"Books Assets Successfully add to Employee"<<Qt::endl;
            setMessegePopQml(true);
            return;
        }
        else{
            qDebug()<<"This Other id Issued some Already"<<Qt::endl;
            qDebug()<<"Please Check the Assets Deatails"<<Qt::endl;
            setMessegePopQml(false);
            return;

        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"Assets Name and Laptop Id Mandatory"<<Qt::endl;
        //        qDebug()<<"Book Asset Database Error"<<Qt::endl;
        qDebug()<<Q_FUNC_INFO<<Qt::endl;
        return;
    }
}

void AssetsDatabase::updateLaptopAssetsDeatails(QString m_empid, QString m_empname, QString m_lapname, QString m_lapid,QString m_damage,QString m_appdate,QString m_duedate)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    //Update Laptop Assets
    QSqlQuery updatelaptop(m_database);
    updatelaptop.prepare("SELECT * FROM LaptopAssets");
    if(updatelaptop.exec()){
        while(updatelaptop.next()){
            if(updatelaptop.value(0).toString()==m_empid && updatelaptop.value(1).toString()==m_empname && m_lapid!=""&&m_lapname!=""){
                updatelaptop.prepare("UPDATE LaptopAssets SET empId=:m_empid,empName=:m_empname,laptopName=:m_lapname,LaptopId=:m_lapid,damage=:m_damage,approvalDate=:m_appdate,dueDate=:m_duedate");
                updatelaptop.bindValue(":m_empid",m_empid);
                updatelaptop.bindValue(":m_empname",m_empname);
                updatelaptop.bindValue(":m_lapname",m_lapname);
                updatelaptop.bindValue(":m_lapid",m_lapid);
                updatelaptop.bindValue(":m_damage",m_damage);
                updatelaptop.bindValue(":m_appdate",m_appdate);
                updatelaptop.bindValue(":m_duedate",m_duedate);
                updatelaptop.exec();
                setMessegePopQml(true);
                qDebug()<<"Employee Laptop Assets Successfully Updated"<<Qt::endl;
                break;
            }
            else{
                setMessegePopQml(false);
                qDebug()<<"Employee Does't Have Any LaptopAssets"<<Qt::endl;
                qDebug()<<"Plese First Add Laptop Assets"<<Qt::endl;
            }
        }
    }
}

void AssetsDatabase::updateBagAssetsDeatails(QString m_empid, QString m_empname, QString m_bagname, QString m_bagid, QString m_damage)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QSqlQuery updatebag(m_database);
    updatebag.prepare("SELECT * FROM BagAssets");
    if(updatebag.exec()){
        while(updatebag.next()){
            if(updatebag.value(0).toString()==m_empid && updatebag.value(1).toString()==m_empname && m_bagid!=""){
                updatebag.prepare("UPDATE BagAssets SET empId=:m_empid,empName=:m_empname,bagName=:m_bagname,bagId=:m_bagid,damage=:m_damage");
                updatebag.bindValue(":m_empid",m_empid);
                updatebag.bindValue(":m_empname",m_empname);
                updatebag.bindValue(":m_bagname",m_bagname);
                updatebag.bindValue(":m_bagid",m_bagid);
                updatebag.bindValue(":m_damage",m_damage);
                updatebag.exec();
                setMessegePopQml(true);
                qDebug()<<"Employee Bag Assets Update Successful"<<Qt::endl;
                break;
            }
            else{
                setMessegePopQml(false);
                qDebug()<<"Employee Does't Have Any BagAssets"<<Qt::endl;
                qDebug()<<"Plese First Add Bag Assets"<<Qt::endl;
            }
        }
    }
}

void AssetsDatabase::updateotherAssetsDeatails(QString m_empid, QString m_empname, QString m_item1, QString m_item2, QString m_item3, QString m_item4,QString m_item5)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QSqlQuery updateassets(m_database);
    updateassets.prepare("SELECT * FROM OtherAssets");
    if(updateassets.exec()){
        while(updateassets.next()){
            if(updateassets.value(0).toString()==m_empid && updateassets.value(1).toString()==m_empname &&m_item1!="" &&m_item2!="" &&m_item3!="" &&m_item4!=""&&m_item5!=""){
                updateassets.prepare("UPDATE OtherAssets SET empId=:m_empid,empName=:m_empname,Item1=:m_item1,Item2=:m_item2,Item3=:m_item3,Item4=:m_item4,Item5=:m_item5");
                updateassets.bindValue(":m_empid",m_empid);
                updateassets.bindValue(":m_empname",m_empname);
                updateassets.bindValue(":m_item1",m_item1);
                updateassets.bindValue(":m_item2",m_item2);
                updateassets.bindValue(":m_item3",m_item3);
                updateassets.bindValue(":m_item4",m_item4);
                updateassets.bindValue(":m_item5",m_item5);
                updateassets.exec();
                setMessegePopQml(true);
                qDebug()<<"Assets Updata Successful"<<Qt::endl;
                break;
            }
            else{
                setMessegePopQml(false);
                qDebug()<<"Employee Does't Have Any Assets"<<Qt::endl;
                qDebug()<<"Plese First Add Assets"<<Qt::endl;

            }
        }
    }
}

void AssetsDatabase::updateBooksAssetsDeatails(QString m_empid, QString m_empname, QString m_book1, QString m_book2, QString m_book3, QString m_book4, QString m_book5)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QSqlQuery updatebooks(m_database);
    updatebooks.prepare("SELECT * FROM BooksAssets");
    if(updatebooks.exec()){
        while(updatebooks.next()){
            if(updatebooks.value(0).toString()==m_empid && updatebooks.value(1).toString()==m_empname &&m_book1!="" &&m_book2!="" &&m_book3!="" &&m_book4!=""&&m_book5!=""){
                updatebooks.prepare("UPDATE BooksAssets SET empId=:m_empid,empName=:m_empname,Book1=:m_book1,Book2=:m_book2,Book3=:m_book3,Book4=:m_book4,Book5=:m_book5");
                updatebooks.bindValue(":m_empid",m_empid);
                updatebooks.bindValue(":m_empname",m_empname);
                updatebooks.bindValue(":m_item1",m_book1);
                updatebooks.bindValue(":m_item2",m_book2);
                updatebooks.bindValue(":m_item3",m_book3);
                updatebooks.bindValue(":m_item4",m_book4);
                updatebooks.bindValue(":m_item5",m_book5);
                updatebooks.exec();
                setMessegePopQml(true);
                qDebug()<<"Books Assets Updata Successful"<<Qt::endl;
                break;
            }
            else{
                setMessegePopQml(false);
                qDebug()<<"Employee Does't Have Any Assets"<<Qt::endl;
                qDebug()<<"Plese First Add Assets"<<Qt::endl;
            }
        }
    }
}

bool AssetsDatabase::messegePopQml() const
{
    qDebug()<<"Messege"<<m_messegePopQml<<Qt::endl;
    return m_messegePopQml;
}

void AssetsDatabase::setMessegePopQml(bool newMessegePopQml)
{
    if(m_messegePopQml == newMessegePopQml)
        return;
    m_messegePopQml=newMessegePopQml;
    qDebug()<<"Messege set"<<m_messegePopQml<<Qt::endl;
    emit messegePopQmlChanged();
}


