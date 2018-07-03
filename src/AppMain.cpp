/***********************************************************************
 *
 * Copyright (C) 2014-2018 wereturtle
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 ***********************************************************************/

#include <QApplication>
#include <QCoreApplication>
#include <QTranslator>
#include <QLocale>
#include <QDebug>

#include "MainWindow.h"
#include "AppSettings.h"

int main(int argc, char* argv[])
{
#if QT_VERSION >= 0x050600
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
#endif

    QApplication app(argc, argv);

    // Load settings.
    AppSettings* appSettings = AppSettings::getInstance();

    // Set locale from settings
    QString savedLang = appSettings->getLocale();
    QLocale::setDefault(savedLang);

    // load translations from a resource file.
    QString resource = ":/translations";

    QStringList translationsList;
    translationsList << "qtbase" << "ghostwriter";

    // array of QTranslators for our list.
    QTranslator translator[translationsList.count()];

    for (int i = 0; i < translationsList.count(); i++) {
        QString name = translationsList.at(i) + "_" + savedLang;
        bool ok = translator[i].load(name, resource);

        if (ok) {
            qDebug().noquote() << "[" + name + "]" <<
                "using translation for language" << savedLang <<
                "from" << resource + "/" + name;

            app.installTranslator(&translator[i]);

        } else
            qWarning().noquote() << "[" + name + "]" <<
                "can't load translation for language" << savedLang <<
                "from" << resource + "/" + name;
    }

    QString filePath = QString();

    if (argc > 1)
    {
        filePath = app.arguments().at(1);
    }

    MainWindow window(filePath);

    window.show();
    return app.exec();
}
