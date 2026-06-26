#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "ConfigureViewModel.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    ConfigureViewModel configureViewModel;
    engine.rootContext()->setContextProperty("configureViewModel", &configureViewModel);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    QQuickStyle::setStyle("Material");
    engine.loadFromModule("UI", "Main");

    return QGuiApplication::exec();
}
