#include "widget.h"

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

	auto vLayout = new QVBoxLayout{this};
	vLayout->addStretch();
	vLayout->addWidget(button);
	vLayout->addWidget(label);
	vLayout->addStretch();
}
