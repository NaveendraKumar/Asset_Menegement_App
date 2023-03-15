#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <EmployeeDatabase.h>
#include <OfficeAuthorityDatabase.h>
#include <AssetsDatabase.h>
#include <DataModelManeger.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    EmployeeDatabase *database=new EmployeeDatabase;
    OfficeAuthorityDatabase *authdatabase=new OfficeAuthorityDatabase;
    AssetsDatabase *assets=new AssetsDatabase;
    DataModelManeger *mgr=new DataModelManeger;

    QQmlApplicationEngine engine;

    //expose the Object cpp to qml

    engine.rootContext()->setContextProperty("EmployeeDatabase",database);

    engine.rootContext()->setContextProperty("Authoritydatabase",authdatabase);

    engine.rootContext()->setContextProperty("AssetsDatabase",assets);

    engine.rootContext()->setContextProperty("dataModelMgr",mgr);
    qmlRegisterUncreatableType<EmployeeModel>("empmodel",1,0,"empmodel","not allow to create object");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
