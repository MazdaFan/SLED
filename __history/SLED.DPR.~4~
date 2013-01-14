program SLED;

uses
  Forms,
  MAIN in 'MAIN.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  EXPORT_XML in 'EXPORT_XML.pas',
  FILE_IO in 'FILE_IO.pas',
  MATRIX in 'MATRIX.pas',
  SEQUENCE in 'SEQUENCE.pas',
  SETUP in 'SETUP.pas' {SetupForm},
  Buffer in 'Buffer.pas' {BufferForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TBufferForm, BufferForm);
  Application.Run;
end.
 
