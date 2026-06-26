#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QUrl>

#include "ConfigureViewModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;

    ConfigureViewModel configureViewModel;
    engine.rootContext()->setContextProperty("configureViewModel", &configureViewModel);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    const QUrl url("qrc:/UI/Main.qml");
    engine.load(url);

    return QGuiApplication::exec();
}
