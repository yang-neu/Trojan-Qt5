; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Trojan-Qt5"
!define PRODUCT_VERSION "1.1.6"
!define PRODUCT_PUBLISHER "TheWanderingCoel"
!define PRODUCT_WEB_SITE "https://trojan-qt5.github.io"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\trojan-qt5.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "LICENSE"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\trojan-qt5.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Trojan-Qt5-Windows.exe"
InstallDir "$PROGRAMFILES\Trojan-Qt5"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "Trojan-Qt5" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "trojan-qt5.exe"
  CreateDirectory "$SMPROGRAMS\Trojan-Qt5"
  CreateShortCut "$SMPROGRAMS\Trojan-Qt5\Trojan-Qt5.lnk" "$INSTDIR\trojan-qt5.exe"
  CreateShortCut "$DESKTOP\Trojan-Qt5.lnk" "$INSTDIR\trojan-qt5.exe"
  File "Qt5Gui.dll"
  File "Qt5Core.dll"
  File "Qt5Network.dll"
  File "Qt5Widgets.dll"
  File "Qt5Svg.dll"
  File "libcrypto-1_1.dll"
  File "libgcc_s_dw2-1.dll"
  File "libiconv-2.dll"
  File "libprotobuf.dll"
  File "libssl-1_1.dll"
  File "libzbar-0.dll"
  File "trojan-qt5-core.dll"
  File "WinSparkle.dll"
  File "zlib1.dll"
  File "cares.dll"
  SetOutPath "$INSTDIR\styles"
  File "styles\qwindowsvistastyle.dll"
  SetOutPath "$INSTDIR\platforms"
  File "platforms\qwindows.dll"
  SetOutPath "$INSTDIR\imageformats"
  File "imageformats\qicns.dll"
  File "imageformats\qico.dll"
  File "imageformats\qsvg.dll"
  SetOutPath "$INSTDIR\iconengines"
  File "iconengines\qsvgicon.dll"
  SetOutPath "$INSTDIR\translations"
  File "translations\qt_en.qm"
  File "translations\qt_zh_TW.qm"
  File "translations\qt_ru.qm"
  File "translations\qt_ja.qm"
  File "translations\qt_de.qm"
  File "translations\qt_fr.qm"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Trojan-Qt5\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Trojan-Qt5\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\trojan-qt5.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\trojan-qt5.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "你确实要完全移除 $(^Name) ，其及所有的组件？" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\trojan-qt5.exe"

  Delete "$SMPROGRAMS\Trojan-Qt5\Uninstall.lnk"
  Delete "$SMPROGRAMS\Trojan-Qt5\Website.lnk"
  Delete "$DESKTOP\Trojan-Qt5.lnk"
  Delete "$SMPROGRAMS\Trojan-Qt5\Trojan-Qt5.lnk"

  RMDir "$SMPROGRAMS\Trojan-Qt5"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd