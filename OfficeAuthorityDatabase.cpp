#include "OfficeAuthorityDatabase.h"
#include "qdebug.h"
#include "qsqlerror.h"


OfficeAuthorityDatabase::OfficeAuthorityDatabase(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Office Authority Constructor"<<endl;
    createOfficeAuthDatabase();
}

OfficeAuthorityDatabase::~OfficeAuthorityDatabase()
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Office Authority Distructor"<<endl;
}

void OfficeAuthorityDatabase::createOfficeAuthDatabase()
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Office Authority Database Create Database Function"<<endl;
    QFile file;

    m_authDatabase=QSqlDatabase::addDatabase("QSQLITE");
    QString currentpath=QDir::currentPath()+"/Database.db";
    qDebug()<<"Current path"<<currentpath<<Qt::endl;

    file.setFileName(currentpath);
    file.open(QIODevice::ReadWrite);

    QSqlQuery m_query(m_authDatabase);
    m_authDatabase.setDatabaseName(currentpath);
    m_authDatabase.open();
    if(m_authDatabase.isOpen()){
        qDebug()<<"The Office Authority Database is open"<<Qt::endl;
    }else{
        qDebug()<<"The Office Authority Database is Not open"<<Qt::endl;
    }

    QString qry("CREATE TABLE PthinksAuthority(empName VARCHAR(20) NOT NULL,empId VARCHAR(20) NOT NULL,password VARCHAR(30) NOT NULL,Primary KEY(empId));");
    if(m_query.exec(qry)){
        qDebug()<<"Pthinks Authority Table Created Successful"<<m_query.lastError()<<Qt::endl;
    }
    else{
        qDebug()<<"Pthinks Authority Table is Not Created"<<Qt::endl;
    }
}

void OfficeAuthorityDatabase::authorityLoginVerify(QString m_id, QString m_password)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"Authority id="<<m_id<<endl;
    qDebug()<<"Authorrity Password="<<m_password<<endl;

    QSqlQuery qry(m_authDatabase);

    qry.prepare("SELECT * FROM PthinksAuthority");
    if(qry.exec()){
        while(qry.next()){
            if(qry.value(1).toString()==m_id && qry.value(2).toString()==m_password){
                qDebug()<<"Authority Login Success"<<endl;
                m_authId=m_id;
                m_authName=qry.value(0).toString();
                setMessegePopQml(true);
                break;
            }else{
                setMessegePopQml(false);
                qDebug()<<"Invalid Userid and Password"<<endl;
            }
        }
    }
}

void OfficeAuthorityDatabase::insertAuthorityEmployee(QString m_name, QString m_id, QString m_password)
{
    qDebug()<<Q_FUNC_INFO<<Qt::endl;
    qDebug()<<"New Authority Name="<<m_name<<endl;
    qDebug()<<"New Authority id="<<m_id<<endl;
    qDebug()<<"New Authority Password="<<m_password<<endl;
    QSqlQuery qry(m_authDatabase);
    if(m_name != "" && m_id != "" && m_password != ""){
        qry.prepare("INSERT INTO PthinksAuthority(empName,empId,password)"
                    "VALUES (?,?,?)");
        qry.addBindValue(m_name);
        qry.addBindValue(m_id);
        qry.addBindValue(m_password);
        bool success=qry.exec();
        if(success){
            qDebug()<<"New Authority Deatails Inserted Successfully"<<Qt::endl;
            setMessegePopQml(true);
        }else{
            qDebug()<<"Invali Deatails Enterd"<<endl;
            qDebug()<<"User id Is Already Existied"<<endl;
        }
    }
    else{
        setMessegePopQml(false);
        qDebug()<<"Invalid Deatails Entered"<<endl;
    }

}

const QString &OfficeAuthorityDatabase::authId() const
{
    return m_authId;
}

void OfficeAuthorityDatabase::setAuthId(const QString &newAuthId)
{
    m_authId = newAuthId;
}

const QString &OfficeAuthorityDatabase::authName() const
{
    return m_authName;
}

void OfficeAuthorityDatabase::setAuthName(const QString &newAuthName)
{
    m_authName = newAuthName;
}

bool OfficeAuthorityDatabase::messegePopQml() const
{
    qDebug()<<"Messege"<<m_messegePopQml<<Qt::endl;
    return m_messegePopQml;
}

void OfficeAuthorityDatabase::setMessegePopQml(bool newMessegePopQml)
{
    if(m_messegePopQml == newMessegePopQml)
        return;
    m_messegePopQml=newMessegePopQml;
    qDebug()<<"Messege set"<<m_messegePopQml<<Qt::endl;
    emit messegePopQmlChanged();
}
