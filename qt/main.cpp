#include "main.h"
#include "widget.h"

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
