######################################################################
# Generated by Jens Krueger
######################################################################

TEMPLATE          = app
CONFIG           += link_prl static warn_on stl exceptions x86 ppc
TARGET            = ../Build/ImageVis3D
RCC_DIR           = ../Build/rcc
OBJECTS_DIR       = ../Build/objects
UI_DIR            = UI/AutoGen
MOC_DIR           = UI/AutoGen
DEPENDPATH       += .
INCLUDEPATH      += .
QT               += opengl network
LIBS              = -L../Tuvok/Build -lTuvok
RESOURCES         = ImageVis3D.qrc
RC_FILE 	  = Resources/ImageVis3D.rc
ICON              = Resources/ImageVis3D.icns
unix:QMAKE_CXXFLAGS += -fno-strict-aliasing
unix:QMAKE_CFLAGS += -fno-strict-aliasing

# Input
HEADERS += StdDefines.h \
           UI/SettingsDlg.h \
           UI/BrowseData.h \
           UI/ImageVis3D.h \
           UI/PleaseWait.h \
           UI/FTPDialog.h \
           UI/QTransferFunction.h \
           UI/Q1DTransferFunction.h \
           UI/Q2DTransferFunction.h \
           UI/QDataRadioButton.h \
           UI/RenderWindow.h \
           UI/RenderWindowGL.h \
           UI/RAWDialog.h \
           UI/MIPRotDialog.h \ 
           UI/Welcome.h \                     
           DebugOut/QTOut.h \
           DebugOut/QTLabelOut.h \
           IO/DialogConverter.h

FORMS += UI/UI/BrowseData.ui \
         UI/UI/ImageVis3D.ui \
         UI/UI/PleaseWait.ui \
         UI/UI/SettingsDlg.ui \
         UI/UI/RAWDialog.ui \
         UI/UI/FTPDialog.ui \
         UI/UI/Welcome.ui \
         UI/UI/MIPRotDialog.ui

SOURCES += UI/BrowseData.cpp \
           UI/ImageVis3D.cpp \
           UI/ImageVis3D_Capturing.cpp \
           UI/ImageVis3D_Progress.cpp \
           UI/ImageVis3D_1DTransferFunction.cpp \
           UI/ImageVis3D_2DTransferFunction.cpp \
           UI/ImageVis3D_FileHandling.cpp \
           UI/ImageVis3D_WindowHandling.cpp \
           UI/ImageVis3D_DebugWindow.cpp \
           UI/ImageVis3D_Settings.cpp \
           UI/ImageVis3D_Locking.cpp \
           UI/ImageVis3D_Stereo.cpp \
           UI/ImageVis3D_Scripting.cpp \
           UI/ImageVis3D_Help.cpp \
           UI/PleaseWait.cpp \
           UI/Welcome.cpp \
           UI/FTPDialog.cpp \
           UI/QTransferFunction.cpp \
           UI/Q1DTransferFunction.cpp \
           UI/Q2DTransferFunction.cpp \
           UI/QDataRadioButton.cpp \
           UI/RenderWindowGL.cpp \
           UI/RenderWindow.cpp \
           UI/SettingsDlg.cpp \
           UI/RAWDialog.cpp \
           UI/MIPRotDialog.cpp \           
           DebugOut/QTOut.cpp \
           DebugOut/QTLabelOut.cpp \
           IO/DialogConverter.cpp \
           main.cpp




win32 {
  HEADERS += UI/RenderWindowDX.h
  SOURCES += UI/RenderWindowDX.cpp
}
