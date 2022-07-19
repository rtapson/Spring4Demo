program SpringTestDemo;

uses
  Vcl.Forms,
  fmMain in 'fmMain.pas' {Form2},
  SpringTestData in 'SpringTestData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
