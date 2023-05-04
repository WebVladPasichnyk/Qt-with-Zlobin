QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../Qwt2/build-qwt-Desktop_Qt_6_6_0_MinGW_64_bit-Release/lib/ -lqwt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../Qwt2/build-qwt-Desktop_Qt_6_6_0_MinGW_64_bit-Release/lib/ -lqwtd
else:unix: LIBS += -L$$PWD/../../../Qwt2/build-qwt-Desktop_Qt_6_6_0_MinGW_64_bit-Release/lib/ -lqwt

INCLUDEPATH += $$PWD/../../../Qwt2/qwt-6.2.0/src
DEPENDPATH += $$PWD/../../../Qwt2/qwt-6.2.0/src
