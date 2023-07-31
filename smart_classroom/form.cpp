#include "form.h"
#include "door.h"
#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QQuickView>
#include <QQmlProperty>

form::form(QObject *parent)
    : QObject{parent}
{

}


void form::submitform(const QString &block, const QString &classroom , const QString &date,const QString &starttime,const QString &endtime)
{
    door doorobj;

    // Call the second function in Door.cpp and pass the arguments
    doorobj.secondFunction(block, classroom);
    qDebug()<<block;
    qDebug()<<classroom;
    qDebug()<<date;
    qDebug()<<starttime;
    qDebug()<<endtime;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("E:/newqt/smart_classroom/login.db");

    if (!db.open()) {
        // Handle the database connection error
        qDebug() << "Failed to connect to the database:" << db.lastError().text();
        return;
    }
    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT COUNT(*) FROM subform WHERE block = ? AND class = ? AND date = ? AND starttime = ? AND endtime = ?");
    checkQuery.addBindValue(block);
    checkQuery.addBindValue(classroom);
    checkQuery.addBindValue(date);
    checkQuery.addBindValue(starttime);
    checkQuery.addBindValue(endtime);

    if (!checkQuery.exec()) {
        // Handle the query execution error
        qDebug() << "Failed to execute check query:" << checkQuery.lastError().text();
        db.close();
        return;
    }

    checkQuery.next();
    int count = checkQuery.value(0).toInt();
    if (count > 0) {
        // Duplicate entry exists, handle accordingly
        qDebug() << "Duplicate entry already exists in the database.";
        emit duplicate();

        db.close();
        return;
    }
    QSqlQuery insertQuery;
    insertQuery.prepare("INSERT INTO subform (block, class, date,starttime,endtime) VALUES (?, ?, ?,?,?)");
    insertQuery.addBindValue(block);
    insertQuery.addBindValue(classroom);
    insertQuery.addBindValue(date);
    insertQuery.addBindValue(starttime);
    insertQuery.addBindValue(endtime);

    if (!insertQuery.exec()) {
        // Handle the SQL execution error
        qDebug() << "Failed to execute insert query:" << insertQuery.lastError().text();
        db.close();
        return;
    }
    else{
        qDebug() << "Inserted successful";
        emit insertSuccessfull();
    }

    // Close the database connection
    db.close();
}

QStringList form::getComboBoxData()
{
    QStringList data;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("E:/newqt/smart_classroom/login.db");
    db.open();
    if (!db.open()) {
        qDebug() << "Error opening database";
        return data;
    }
    QSqlQuery query;
    query.prepare("SELECT DISTINCT(block) FROM form ");

    if (query.exec()) {

        while (query.next()) {
            // Add each value to the QStringList
            QString value = query.value(0).toString();
            data.append(value);

        }
    } else {
        qDebug() << "Error executing query";
    }

    // Close the database connection


    return data;

}

QStringList form::getComboBoxData1(const QString &box)
{
    QStringList data1;

    QSqlQuery query;
    query.prepare("SELECT class FROM form WHERE block=:block ");
    query.bindValue(":block",box);

    if (query.exec()) {

        while (query.next()) {
            // Add each value to the QStringList
            QString value = query.value(0).toString();
            data1.append(value);

        }
    } else {
        qDebug() << "Error executing query";
    }

    // Close the database connection


    return data1;
}

