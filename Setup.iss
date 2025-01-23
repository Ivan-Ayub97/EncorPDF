[Setup]
; Configuración básica de la instalación
AppName=EncorPDF
AppVersion=2.0
DefaultDirName={pf}\EncorPDF
DefaultGroupName=EncorPDF
OutputDir=.\Output
OutputBaseFilename=EncorPDF2.0_Installer
SetupIconFile=C:\Users\negro\Desktop\EncorPDF\EncorPDF.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin

[Files]
Source: "dist\EncorPDF.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "EncorPDF.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Crear accesos directos en el grupo del menú y en el escritorio
Name: "{group}\EncorPDF"; Filename: "{app}\EncorPDF.exe"; IconFilename: "{app}\EncorPDF.ico"; WorkingDir: "{app}"

[Registry]
; Asociar EncorPDF con archivos PDF
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "EncorPDF.exe"
Root: HKCU; Subkey: "Software\Classes\Applications\EncorPDF.exe\shell\open\command"; ValueType: string; ValueData: """{app}\EncorPDF.exe"" ""%1"""
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice"; ValueType: string; ValueName: "Progid"; ValueData: "Applications\EncorPDF.exe"

[Code]
function ShowCustomLicensePage(): Boolean;
var
  ResultCode: Integer;
begin
MsgBox('*** IMPORTANT NOTICE / AVISO IMPORTANTE ***'#13#10#13#10 +
       'EN: The developer, Iván E. C. Ayub, and the EncorPDF Project are not responsible for the use or misuse of this software.'#13#10 +
       'This program is provided "as is," with no warranties of any kind.'#13#10#13#10 +
       'ES: El desarrollador, Iván E. C. Ayub, y el Proyecto EncorPDF no se hacen responsables por el uso o mal uso de este software.'#13#10 +
       'Este programa se proporciona "tal cual," sin garantías de ningún tipo.'#13#10#13#10 +
       'EN/ES: By continuing, you accept these terms. If you do not agree, close this window and cancel the installation.'#13#10 +
       'Al continuar, acepta estos términos. Si no está de acuerdo, cierre esta ventana y cancele la instalación.', 
       mbInformation, MB_OK);

  Result := True;
end;

procedure InitializeWizard();
begin
  if not ShowCustomLicensePage() then
    Abort;
end;
