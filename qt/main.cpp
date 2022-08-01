#include "main.h"
#include "widget.h"

#include <QApplication>

int main(int argc, char* argv[])
{
	QApplication a{argc, argv};

	Widget w;
	w.show();

#ifdef Q_OS_IOS
	showQtWindow();
#endif

	return a.exec();
}
