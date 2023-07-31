#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

class login : public QObject
{
    Q_OBJECT
public:
    explicit login(QObject *parent = nullptr);
    QString username() const;
    void setUsername(const QString &username);


signals:
    void loginSuccessfull();
    void loginfailed();
    void usernameChanged();

public slots:
    void verifyLogin(const QString& username, const QString& password);
private:
    QString m_username;


};

#endif // LOGIN_H
