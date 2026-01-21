; Hero Siege Russian Translation Installer Script

[Setup]
AppId={{269210-HS-RU-TRANS}}
AppName=Hero Siege Russian Translation
AppVersion=1.0
AppPublisher=Alina Lisova
DefaultDirName={code:GetInstallDir}
DefaultGroupName=Hero Siege Russian Translation
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=hero_siege_ru_installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableWelcomePage=no
DirExistsWarning=no

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "translate\*"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{app}\README.txt"; Description: "Показать README"; Flags: postinstall shellexec skipifsilent

[Code]
var
  InstallPath: String;

function GetInstallDir(Default: String): String;
begin
  // Try to find Steam InstallLocation for Hero Siege (AppID 269210)
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 269210', 'InstallLocation', InstallPath) then
  begin
    // Add \bin to the detected path
    Result := InstallPath + '\bin';
  end
  else
  begin
    // Fallback if not found in registry
    Result := 'C:\Program Files (x86)\Steam\steamapps\common\HeroSiege\bin';
  end;
end;

[Messages]
SetupAppTitle=Установка русификатора Hero Siege
SetupWindowTitle=Установка русификатора Hero Siege
