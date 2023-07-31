#include "login.h"

#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QQuickView>

login::login(QObject *parent)
    : QObject{parent}
{

}

QString login::username() const
{
    return m_username;
}

void login::setUsername(const QString &username)
{
    if (m_username != username) {
        m_username = username;
        emit usernameChanged();
    }
}

void login::verifyLogin(const QString &username, const QString &password)

{

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("E:/newqt/smart_classroom/login.db");
    db.open();
    if(db.open()){
        qDebug()<<"Connected";
    }
    else{
        qDebug() <<"notConnected";
    }
    // Execute a SQL query to verify the login credentials
    qDebug()<<username;
    qDebug()<<password;
    QSqlQuery query(db);
    query.prepare("SELECT * FROM login WHERE username = :username AND password = :password");
    query.bindValue(":username", username);
    query.bindValue(":password", password);

    if (query.exec()) {
        if (query.next()) {
            qDebug() << "Login successful";
            emit loginSuccessfull();

        } else {
            qDebug() << "Invalid username or password";
            emit loginfailed();
        }
    } else {
        qDebug() << "Database error:" << query.lastError().text();
    }
    db.close();
}


