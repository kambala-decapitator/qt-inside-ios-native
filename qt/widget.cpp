#include "widget.h"

#include <QApplication>
#include <QComboBox>
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

	auto combobox = new QComboBox{this};
	combobox->addItems({QStringLiteral("one"), QStringLiteral("two")});

	auto vLayout = new QVBoxLayout{this};
	vLayout->addStretch();
	vLayout->addWidget(combobox);
	vLayout->addWidget(button);
	vLayout->addWidget(label);
	vLayout->addWidget(quitButton);
	vLayout->addStretch();
}
