#include "widget.h"

#include <QApplication>
#include <QDateTime>
#include <QLabel>
#include <QPushButton>
#include <QVBoxLayout>

Widget::Widget(QWidget* parent) : QWidget{parent}
{
	auto label = new QLabel{this};

	auto button = new QPushButton{QStringLiteral("Show current time"), this};
	connect(button, &QPushButton::clicked, [label] {
		label->setText(QDateTime::currentDateTime().toString());
	});

	auto quitButton = new QPushButton{QStringLiteral("Quit Qt app"), this};
	connect(quitButton, &QPushButton::clicked, qApp, &QCoreApplication::quit);

	auto vLayout = new QVBoxLayout{this};
	vLayout->addStretch();
	vLayout->addWidget(button);
	vLayout->addWidget(label);
	vLayout->addWidget(quitButton);
	vLayout->addStretch();
}
