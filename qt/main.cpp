#include "main.h"
#include "widget.h"

#ifdef Q_OS_MACOS
#include "QCocoaIntegrationPlugin.h"
#else
#include "QIOSIntegrationPlugin.h"
#endif

#include <QApplication>

int main(int argc, char* argv[])
{
	QApplication a{argc, argv};

	Widget w;
	w.show();

#ifdef EMBEDDED_QT_APP
	showQtWindow();
#endif

	return a.exec();
}
