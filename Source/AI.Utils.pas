unit AI.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  UChar = UnicodeChar;
  UString = UnicodeString;

  TArray_int = array of integer;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

procedure DrawLineBlockEnd;
procedure DrawLineProgramEnd;
procedure NeedInput;
function Chr(i: cardinal): UChar;

implementation

procedure DrawLineBlockEnd;
var
  i: integer;
begin
  for i := 0 to 10 do
  begin
    Write('-');
  end;
  Writeln;
end;

procedure DrawLineProgramEnd;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    Write('=');
  end;
  Writeln;
end;

procedure NeedInput;
begin
  writeln('Need input data: ');
end;

function Chr(i: cardinal): UChar;
begin
  Result := UChar(i);
end;

end.
