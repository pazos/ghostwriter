# Rules for building translations for qt, qtbase and ghostwriter
message("Buiding translations from source")

APP_TRANSLATIONS = $$files($$PWD/translations/ghostwriter_*.ts)
#QT_TRANSLATIONS = $$files($$PWD/external/qttranslations/translations/qt_*.ts)
QTBASE_TRANSLATIONS = $$files($$PWD/external/qttranslations/translations/qtbase_*.ts)

TRANSLATION_TARGET_DIR = $$DESTDIR/translations
L_RELEASE_OPTIONS = -compress -nounfinished -removeidentical
#-silent

isEmpty(QMAKE_LRELEASE) {
    win32:L_RELEASE = $$[QT_INSTALL_BINS]\lrelease.exe
    else:L_RELEASE = $$[QT_INSTALL_BINS]/lrelease
}

langrel.input = APP_TRANSLATIONS QTBASE_TRANSLATIONS
langrel.output = $$TRANSLATION_TARGET_DIR/${QMAKE_FILE_BASE}.qm
langrel.commands = \
    $$L_RELEASE $$L_RELEASE_OPTIONS ${QMAKE_FILE_IN} -qm $$TRANSLATION_TARGET_DIR/${QMAKE_FILE_BASE}.qm
langrel.CONFIG += no_link

QMAKE_EXTRA_COMPILERS += langrel

!exists($$TRANSLATION_TARGET_DIR) {
    mkpath($$TRANSLATION_TARGET_DIR)
}

# Create a Qt resource file for translations.

qrc_entry = "<RCC>"
qrc_entry += '  <qresource prefix="/translations">'
write_file($$TRANSLATION_TARGET_DIR/translations.qrc, qrc_entry)

# add ghostwriter translations
for(tsfile, APP_TRANSLATIONS) {
    qmfile = $$TRANSLATION_TARGET_DIR/$$basename(tsfile)
    qmfile ~= s/.ts$/.qm/
    system($$L_RELEASE $$L_RELEASE_OPTIONS $$tsfile -qm $$qmfile)
    qrc_entry = "    <file>$$basename(qmfile)</file>"
    write_file($$TRANSLATION_TARGET_DIR/translations.qrc, qrc_entry, append)
}

# add qtbase translations
for(tsfile, QTBASE_TRANSLATIONS) {
    qmfile = $$TRANSLATION_TARGET_DIR/$$basename(tsfile)
    qmfile ~= s/.ts$/.qm/
    system($$L_RELEASE $$L_RELEASE_OPTIONS $$tsfile -qm $$qmfile)
    qrc_entry = "    <file>$$basename(qmfile)</file>"
    write_file($$TRANSLATION_TARGET_DIR/translations.qrc, qrc_entry, append)
}

qrc_entry = "  </qresource>"
qrc_entry += "</RCC>"

write_file($$TRANSLATION_TARGET_DIR/translations.qrc, qrc_entry, append)

RESOURCES += $$TRANSLATION_TARGET_DIR/translations.qrc

PRE_TARGETDEPS += compiler_langrel_make_all
