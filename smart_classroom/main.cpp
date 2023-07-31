#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QCoreApplication>
#include <QtSql>
#include <QDebug>
#include <QQuickItem>
#include <login.h>
#include <QQmlContext>
#include <form.h>
#include <door.h>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQuickStyle::setStyle(":/mystyle");
    QQuickStyle::setFallbackStyle("Material");
    login l;
    form f;
    door doorobj;
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("classA",&l);
    rootContext->setContextProperty("form",&f);
    rootContext->setContextProperty("doorobj",&doorobj);


    return app.exec();
}
