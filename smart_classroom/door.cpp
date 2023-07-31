#include "door.h"
#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QQuickView>
#include <QQmlProperty>
QString globalarg1;
QString globalarg2;

door::door(QObject *parent)
    : QObject{parent}
{

}

void door::doorcode(QString code)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("E:/newqt/smart_classroom/login.db");
    qDebug() << code;
    if (!db.open()) {
        // Handle the database connection error
        qDebug() << "Failed to connect to the database:" << db.lastError().text();
        return;
    }
    qDebug() << "Received arguments: " << globalarg1 << ", " << globalarg2;
    QSqlQuery query(db);
    query.prepare("SELECT pcode FROM door WHERE block = :block AND class = :class AND pcode=:pcode ");
    query.bindValue(":block", globalarg1);
    query.bindValue(":class", globalarg2);
    query.bindValue(":pcode", code);

    if (query.exec()) {
        if (query.next()) {
            qDebug() << "Correct password";
            emit doorlock();

        } else {
            qDebug() << "Invalid username or password";
        }
    } else {
        qDebug() << "Database error:" << query.lastError().text();
    }
    db.close();
}

void door::secondFunction(const QString& arg1, const QString& arg2)
{


    globalarg1=arg1;
    globalarg2=arg2;

}
