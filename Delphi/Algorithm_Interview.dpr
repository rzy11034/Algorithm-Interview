program Algorithm_Interview;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AI.Main in 'Source\AI.Main.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
