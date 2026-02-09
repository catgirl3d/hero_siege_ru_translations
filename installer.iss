; Hero Siege Russian Translation Installer Script

[Setup]
AppId={{269210-HS-RU-TRANS}}
AppName=Hero Siege Russian Translation
AppVersion=1.0.3
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
  InstallPath := '';
  
  // 1. Try 64-bit registry view (where Steam actually writes on 64-bit Windows)
  if RegQueryStringValue(HKEY_LOCAL_MACHINE_64, 
      'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 269210', 
      'InstallLocation', InstallPath) and (InstallPath <> '') then
  begin
    Result := InstallPath + '\bin';
    Exit;
  end;
  
  // 2. Try 32-bit registry view (WOW6432Node)
  if RegQueryStringValue(HKEY_LOCAL_MACHINE_32, 
      'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 269210', 
      'InstallLocation', InstallPath) and (InstallPath <> '') then
  begin
    Result := InstallPath + '\bin';
    Exit;
  end;
  
  // 3. Try HKCU as fallback
  if RegQueryStringValue(HKEY_CURRENT_USER, 
      'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 269210', 
      'InstallLocation', InstallPath) and (InstallPath <> '') then
  begin
    Result := InstallPath + '\bin';
    Exit;
  end;
  
  // 4. Fallback to default Steam location
  Result := 'C:\Program Files (x86)\Steam\steamapps\common\HeroSiege\bin';
end;

[Messages]
SetupAppTitle=Установка русификатора Hero Siege
SetupWindowTitle=Установка русификатора Hero Siege
