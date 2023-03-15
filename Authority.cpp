#include "Authority.h"
#include "qdebug.h"

Authority::Authority(QObject *parent)
    : QObject{parent}
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
}

Authority::~Authority()
{
    qInfo()<<Q_FUNC_INFO<<Qt::endl;
}

const QString &Authority::email() const
{
    return m_email;
}

void Authority::setEmail(const QString &newEmail)
{
    m_email = newEmail;
}

const QString &Authority::password() const
{
    return m_password;
}

void Authority::setPassword(const QString &newPassword)
{
    m_password = newPassword;
}
