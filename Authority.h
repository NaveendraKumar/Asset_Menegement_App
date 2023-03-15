#ifndef AUTHORITY_H
#define AUTHORITY_H
#include <QDebug>
#include <QObject>

class Authority : public QObject
{
    Q_OBJECT
public:
    explicit Authority(QObject *parent = nullptr);
    ~Authority();

    const QString &email() const;
    void setEmail(const QString &newEmail);

    const QString &password() const;
    void setPassword(const QString &newPassword);

signals:


private:
    QString m_email;
    QString m_password;
};

#endif // AUTHORITY_H
