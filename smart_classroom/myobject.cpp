#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>

class MyObject : public QObject {
    Q_OBJECT

};
void MyObject::verifylogin()
{

    // Database connection
    QSqlDatabase currentDB = QSqlDatabase::addDatabase("QSQLITE");
    currentDB.setDatabaseName("E:/newqt/smart_classroom/login.db");

    // Execute a SQL query to verify the login credentials
    QSqlQuery query(currentDB);
    query.prepare("SELECT * FROM login WHERE username = :username AND password = :password");
    query.bindValue(":username", username);
    query.bindValue(":password", password);

    if (query.exec()) {
        if (query.next()) {
            qDebug() << "Login successful";
        } else {
            qDebug() << "Invalid username or password";
        }
    } else {
        qDebug() << "Database error:" << query.lastError().text();
    }
}
};

}
