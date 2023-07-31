#ifndef FORM_H
#define FORM_H

#include <QObject>
#include <QSqlQueryModel>

class form : public QObject
{
    Q_OBJECT

public:
    explicit form(QObject *parent = nullptr);
signals:
    void insertSuccessfull();
    void loginSuccessfull();
    void duplicate();
public slots:
    void submitform(const QString &block, const QString &classroom, const QString &date, const QString &starttime,const QString &endtime);
    QStringList getComboBoxData();
    QStringList getComboBoxData1(const QString &box);
private:
    QSqlQueryModel *categoryModel;
    QSqlQueryModel *itemsModel;


};

#endif // FORM_H
