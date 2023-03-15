#include "EmployeeDatabase.h"
#include "qdebug.h"
#include "qsqlerror.h"
EmployeeDatabase::EmployeeDatabase(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Employee Database Constructor"<<Qt::endl;
    createEmpDatabase();
}

EmployeeDatabase::~EmployeeDatabase()
{
    qDebug()<<"Employee Database Distructor"<<Qt::endl;
}

void EmployeeDatabase::createEmpDatabase()
{
    QFile file;

    //connection to the sql Database

    qDebug()<<"Connect Database"<<Qt::endl;
    m_database=QSqlDatabase::addDatabase("QSQLITE");
    QString currentpath=QDir::currentPath()+"/Database.db";
    qDebug()<<"Current path"<<currentpath<<Qt::endl;


    file.setFileName(currentpath);
    file.open(QIODevice::ReadWrite);

    QSqlQuery m_query(m_database);
    m_database.setDatabaseName(currentpath);
    m_database.open();
    if(m_database.isOpen()){
        qDebug()<<"employee Database is open"<<Qt::endl;
    }
    else{
        qDebug()<<"employee Database is Not Open"<<Qt::endl;
    }

    QString qry("CREATE TABLE PthinksEmployee(empName VARCHAR(20) NOT NULL,empId VARCHAR(20) NOT NULL,eMail VARCHAR(30) NOT NULL,password VARCHAR(30) NOT NULL,confirmPassword VARCHAR(30) NOT NULL,Primary KEY(empId));");
    if(m_query.exec(qry)){
        qDebug()<<"Table Created Successful"<<m_query.lastError()<<Qt::endl;
    }
    else{
        qDebug()<<"Table is Not Created"<<m_query.lastError()<<Qt::endl;
    }

}

void EmployeeDatabase::readEmployeeData()
{
    QSqlQuery qry (m_database);
    qInfo()<<Q_FUNC_INFO;
    qry.prepare("SELECT * FROM PthinksEmployee");
    if(qry.exec()){
        qInfo()<<Q_FUNC_INFO;
        while(qry.next()){
            qInfo()<<Q_FUNC_INFO;
            QString m_id=qry.value(1).toString();
            QString m_name=qry.value(0).toString();
            QString m_email=qry.value(2).toString();
            emit sendemp_deatails(m_name,m_id,m_email);
        }
    }else{
        qDebug()<<"There is A Problem in the Database"<<endl;
    }

}

void EmployeeDatabase::storeEmployeeDeatails(QString m_name, QString m_id, QString m_email, QString m_password, QString m_confirmpassword)
{

    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QSqlQuery qry(m_database);
    if(m_password==m_confirmpassword && m_name !="")
    {
        qry.prepare("INSERT INTO PthinksEmployee(empName,empId,eMail,password,confirmPassword)"
                    "VALUES (?,?,?,?,?)");
        qry.addBindValue(m_name);
        qry.addBindValue(m_id);
        qry.addBindValue(m_email);
        qry.addBindValue(m_password);
        qry.addBindValue(m_confirmpassword);
        bool success=qry.exec();
        if(success){
            qDebug()<<"Employee Deatails Inserted Successfull"<<Qt::endl;
            setMessegePopQml(true);
            return;
        }
        else{
            qDebug()<<"Employee id Already Existed"<<Qt::endl;
            qDebug()<<"Please Check the Deatails"<<Qt::endl;
            setMessegePopQml(false);
            return;
        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"not insert into the table"<<qry.lastError()<<Qt::endl;
        qDebug()<<"MisMatch the Password and ConfirmPassword"<<Qt::endl;
    }

}

void EmployeeDatabase::authorityVerifyEmployee(QString m_id, QString m_name)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qInfo()<<"empid="<<m_id<<Qt::endl;
    qInfo()<<"empname="<<m_name<<Qt::endl;
    QSqlQuery qry (m_database);
    qry.prepare("SELECT * FROM PthinksEmployee");
    if(qry.exec()){
        qInfo()<<"--------inside if";
        while(qry.next()){
            qInfo()<<"--------inside while";
            if(qry.value(0).toString()==m_name && qry.value(1).toString()==m_id){
                qInfo()<<"--------inside table if";
                m_empid=m_id;
                m_empname=m_name;
                m_empemail=qry.value(2).toString();
                qInfo()<<m_empid<<endl;
                qInfo()<<m_empname<<endl;
                qInfo()<<m_empemail<<endl;

                //load the Employee Profie Data From EMployee Profile Class


                qDebug()<<"Valid Deatails"<<Qt::endl;
                setMessegePopQml(true);
                loadAssets(m_empid,m_empname);
                break;
            }
            else{
                qDebug()<<"invalid deatails enter"<<Qt::endl;
                setMessegePopQml(false);
                return;
            }
        }
    }
    else{
        qDebug()<<"There is A Problem in the Database"<<endl;
    }

}

void EmployeeDatabase::updateEmployeeDeatails(QString m_id,QString m_name,QString m_empid, QString m_empname, QString m_empemail)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    QSqlQuery update_emp(m_database);
    update_emp.prepare("SELECT * FROM PthinksEmployee");
    if(update_emp.exec()){
        while (update_emp.next()) {
            if(update_emp.value(1).toString()==m_id && update_emp.value(0).toString()==m_name &&m_empid!=""&&m_empname!=""){
                update_emp.prepare("UPDATE PthinksEmployee SET empId=:m_empid,empName=:m_empname,eMail=:m_email WHERE empId=:id");
                update_emp.bindValue(":id",m_id);
                update_emp.bindValue(":m_empname",m_empname);
                update_emp.bindValue(":m_empid",m_empid);
                update_emp.bindValue(":m_email",m_empemail);
                update_emp.exec();
                setMessegePopQml(true);
                break;
            }
            else{
                setMessegePopQml(false);
                qDebug()<<"Invalid"<<Qt::endl;
            }
        }
    }
}

void EmployeeDatabase::removeEmoployee(QString m_id, QString m_name)
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
    qInfo()<<"Remove Employee Function Called"<<Qt::endl;
    qInfo()<<"Emp id : "<<m_id<<Qt::endl;
    qInfo()<<"Emp Name : "<<m_name<<Qt::endl;
    QSqlQuery removeemp (m_database);
    if(removeemp.prepare("DELETE FROM PthinksEmployee WHERE empId=:m_empid")){
        removeemp.bindValue(":m_empid",m_id);
        removeemp.exec();
        qInfo()<<"Successful"<<Qt::endl;
        setMessegePopQml(true);
        return;

    }else{
        qInfo()<<"Not Successful"<<Qt::endl;
    }
}

const QString &EmployeeDatabase::book5() const
{
    return m_book5;
}

void EmployeeDatabase::setBook5(const QString &newBook5)
{
    m_book5 = newBook5;
}

const QString &EmployeeDatabase::book4() const
{
    return m_book4;
}

void EmployeeDatabase::setBook4(const QString &newBook4)
{
    m_book4 = newBook4;
}

const QString &EmployeeDatabase::book3() const
{
    return m_book3;
}

void EmployeeDatabase::setBook3(const QString &newBook3)
{
    m_book3 = newBook3;
}

const QString &EmployeeDatabase::book2() const
{
    return m_book2;
}

void EmployeeDatabase::setBook2(const QString &newBook2)
{
    m_book2 = newBook2;
}

const QString &EmployeeDatabase::book1() const
{
    return m_book1;
}

void EmployeeDatabase::setBook1(const QString &newBook1)
{
    m_book1 = newBook1;
}



const QString &EmployeeDatabase::empemail() const
{
    return m_empemail;
}

void EmployeeDatabase::setEmpemail(const QString &newEmpemail)
{
    m_empemail = newEmpemail;
}

const QString &EmployeeDatabase::empname() const
{
    return m_empname;
}

void EmployeeDatabase::setEmpname(const QString &newEmpname)
{
    m_empname = newEmpname;
}

const QString &EmployeeDatabase::empid() const
{
    return m_empid;
}

void EmployeeDatabase::setEmpid(const QString &newEmpid)
{
    m_empid = newEmpid;
}


bool EmployeeDatabase::messegePopQml() const
{
    qDebug()<<"Messege"<<m_messegePopQml<<Qt::endl;
    return m_messegePopQml;
}

void EmployeeDatabase::setMessegePopQml(bool newMessegePopQml)
{
    if(m_messegePopQml == newMessegePopQml)
        return;
    m_messegePopQml=newMessegePopQml;
    qDebug()<<"Messege set"<<m_messegePopQml<<Qt::endl;
    emit messegePopQmlChanged();
}


//assets

void EmployeeDatabase::loadAssets(QString m_id,QString m_name)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Employee id="<<m_id<<endl;
    qDebug()<<"Employee Name="<<m_name<<endl;

    QSqlQuery laptop(m_database);
    laptop.prepare("SELECT * FROM LaptopAssets");
    if(laptop.exec()){
        while(laptop.next()){
            if(laptop.value(0).toString()==m_id && laptop.value(1).toString()==m_name){
                m_laptopid=laptop.value(3).toString();
                m_laptopname=laptop.value(2).toString();
                m_lapdamage=laptop.value(4).toString();
                m_lapappdate=laptop.value(5).toString();
                m_lapduedate=laptop.value(6).toString();
            }else{
                m_laptopid="none";
                m_laptopname="none";
                m_lapdamage="none";
                m_lapappdate="none";
                m_lapduedate="none";
            }
        }
    }
    QSqlQuery bag(m_database);
    bag.prepare("SELECT * FROM BagAssets");
    if(bag.exec()){
        while(bag.next()){
            if(bag.value(0).toString()==m_id && bag.value(1).toString()==m_name){
                m_bagid=bag.value(3).toString();
                m_bagname=bag.value(2).toString();
                m_bagdamage=bag.value(4).toString();

            }else{
                m_bagid="none";
                m_bagname="none";
                m_bagdamage="none";

            }
        }
    }
    QSqlQuery otherassets(m_database);
    otherassets.prepare("SELECT * FROM OtherAssets");
    if(otherassets.exec()){
        while(otherassets.next()){
            if(otherassets.value(0).toString()==m_id && otherassets.value(1).toString()==m_name){
                m_item1=otherassets.value(2).toString();
                m_item2=otherassets.value(3).toString();
                m_item3=otherassets.value(4).toString();
                m_item4=otherassets.value(5).toString();
                m_item5=otherassets.value(6).toString();
            }else{
                m_item1="none";
                m_item2="none";
                m_item3="none";
                m_item4="none";
                m_item5="none";
            }
        }
    }

    QSqlQuery bookassets(m_database);
    bookassets.prepare("SELECT * FROM BooksAssets");
    if(bookassets.exec()){
        while(bookassets.next()){
            if(bookassets.value(0).toString()==m_id && bookassets.value(1).toString()==m_name){
                m_book1=bookassets.value(2).toString();
                m_book2=bookassets.value(3).toString();
                m_book3=bookassets.value(4).toString();
                m_book4=bookassets.value(5).toString();
                m_book5=bookassets.value(6).toString();
            }else{
                m_book1="none";
                m_book2="none";
                m_book3="none";
                m_book4="none";
                m_book5="none";
            }
        }
    }
}
const QString &EmployeeDatabase::item4() const
{
    return m_item4;
}

void EmployeeDatabase::setItem4(const QString &newItem4)
{
    m_item4 = newItem4;
}

const QString &EmployeeDatabase::item3() const
{
    return m_item3;
}

void EmployeeDatabase::setItem3(const QString &newItem3)
{
    m_item3 = newItem3;
}

const QString &EmployeeDatabase::item2() const
{
    return m_item2;
}

void EmployeeDatabase::setItem2(const QString &newItem2)
{
    m_item2 = newItem2;
}

const QString &EmployeeDatabase::item1() const
{
    return m_item1;
}

void EmployeeDatabase::setItem1(const QString &newItem1)
{
    m_item1 = newItem1;
}

const QString &EmployeeDatabase::bagdamage() const
{
    return m_bagdamage;
}

void EmployeeDatabase::setBagdamage(const QString &newBagdamage)
{
    m_bagdamage = newBagdamage;
}

const QString &EmployeeDatabase::bagname() const
{
    return m_bagname;
}

void EmployeeDatabase::setBagname(const QString &newBagname)
{
    m_bagname = newBagname;
}

const QString &EmployeeDatabase::bagid() const
{
    return m_bagid;
}

void EmployeeDatabase::setBagid(const QString &newBagid)
{
    m_bagid = newBagid;
}

const QString &EmployeeDatabase::lapdamage() const
{
    return m_lapdamage;
}

void EmployeeDatabase::setLapdamage(const QString &newLapdamage)
{
    m_lapdamage = newLapdamage;
}


const QString &EmployeeDatabase::laptopname() const
{
    return m_laptopname;
}

void EmployeeDatabase::setLaptopname(const QString &newLaptopname)
{
    m_laptopname = newLaptopname;
}

const QString &EmployeeDatabase::laptopid() const
{
    return m_laptopid;
}

void EmployeeDatabase::setLaptopid(const QString &newLaptopid)
{
    if (m_laptopid == newLaptopid)
        return;
    m_laptopid = newLaptopid;
    emit laptopidChanged();
}
const QString &EmployeeDatabase::item5() const
{
    return m_item5;
}

void EmployeeDatabase::setItem5(const QString &newItem5)
{
    m_item5 = newItem5;
}

const QString &EmployeeDatabase::bagduedate() const
{
    return m_bagduedate;
}

void EmployeeDatabase::setBagduedate(const QString &newBagduedate)
{
    m_bagduedate = newBagduedate;
}

const QString &EmployeeDatabase::bagappdate() const
{
    return m_bagappdate;
}

void EmployeeDatabase::setBagappdate(const QString &newBagappdate)
{
    m_bagappdate = newBagappdate;
}

const QString &EmployeeDatabase::lapduedate() const
{
    return m_lapduedate;
}

void EmployeeDatabase::setLapduedate(const QString &newLapduedate)
{
    m_lapduedate = newLapduedate;
}

const QString &EmployeeDatabase::lapappdate() const
{
    return m_lapappdate;
}

void EmployeeDatabase::setLapappdate(const QString &newLapappdate)
{
    m_lapappdate = newLapappdate;
}
