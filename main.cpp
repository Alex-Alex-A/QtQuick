#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QPushButton>
#include <QWidget>
#include <QtWidgets>
#include <qpropertyanimation.h>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
//    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



//    QLineEdit le;
//    le.setFrame(true);
//    le.setFocus();
//    le.show();


//    QPushButton button("Animated Button");
//    button.show();
//    QPropertyAnimation animation(&button, "geometry");
//    animation.setDuration(10000);
//    animation.setStartValue(QRect(0, 0, 100, 30));
//    animation.setEndValue(QRect(250, 250, 100, 30));
//    animation.start();

    return app.exec();
}
