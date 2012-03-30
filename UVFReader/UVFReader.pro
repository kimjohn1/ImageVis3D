######################################################################
# Generated by Jens Krueger
######################################################################

TEMPLATE          = app
win32:TEMPLATE    = vcapp
CONFIG           += exceptions largefile static stl warn_on
CONFIG           -= app_bundle
macx:DEFINES     += QT_MAC_USE_COCOA=1
TARGET            = Build/UVFReader
unix:TARGET       = Build/uvf
QT               += opengl
DEPENDPATH       += .
INCLUDEPATH      += . ../Tuvok/IO/3rdParty/boost ../Tuvok/3rdParty/GLEW
INCLUDEPATH      += ../Tuvok ../Tuvok/Basics/3rdParty ../Tuvok/Basics
QMAKE_LIBDIR     += ../Tuvok/Build ../Tuvok/IO/expressions
LIBS              = -lTuvok -ltuvokexpr
unix:LIBS        += -lz
macx:LIBS        += -framework CoreFoundation
win32:LIBS       += shlwapi.lib
# Qt 4.8 no longer provides GLU for us.  See Qt bug 1022
if(static) {
  unix:LIBS      += /usr/lib/libGLU.a
} else {
  unix:LIBS      += -lGLU
}
unix:QMAKE_CXXFLAGS += -fno-strict-aliasing
unix:QMAKE_CFLAGS += -fno-strict-aliasing

# Find the location of QtGui's prl file, and include it here so we can look at
# the QMAKE_PRL_CONFIG variable.
TEMP = $$[QT_INSTALL_LIBS] libQtGui.prl
PRL  = $$[QT_INSTALL_LIBS] QtGui.framework/QtGui.prl
TEMP = $$join(TEMP, "/")
PRL  = $$join(PRL, "/")
exists($$TEMP) {
  include($$TEMP)
}
exists($$PRL) {
  include($$PRL)
}

### Should we link Qt statically or as a shared lib?
# If the PRL config contains the `shared' configuration, then the installed
# Qt is shared.  In that case, disable the image plugins.
contains(QMAKE_PRL_CONFIG, shared) {
  message("Shared build, ensuring there will be image plugins linked in.")
  QTPLUGIN -= qgif qjpeg qtiff
} else {
  message("Static build, forcing image plugins to get loaded.")
  QTPLUGIN += qgif qjpeg qtiff
}

# Input
HEADERS += ../CmdLineConverter/DebugOut/HRConsoleOut.h


SOURCES += ../CmdLineConverter/DebugOut/HRConsoleOut.cpp \
           main.cpp
