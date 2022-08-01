#ifndef MAIN_H
#define MAIN_H

#include <QtGlobal>

#ifdef Q_OS_IOS
void showQtWindow();

#define main qt_app_main
#endif
int main(int argc, char* argv[]);

#endif // MAIN_H
