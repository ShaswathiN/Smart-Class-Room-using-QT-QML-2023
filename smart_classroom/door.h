#ifndef DOOR_H
#define DOOR_H

#include <QObject>

class door : public QObject
{
    Q_OBJECT
public:
    explicit door(QObject *parent = nullptr);

signals:
    void doorlock();
public slots:
    void doorcode(QString code);
    void secondFunction(const QString& arg1,const QString& arg2);
};

#endif // DOOR_H
