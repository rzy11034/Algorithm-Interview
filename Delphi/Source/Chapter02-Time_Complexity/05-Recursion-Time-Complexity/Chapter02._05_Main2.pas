unit Chapter02._05_Main2;

interface

uses
  System.Classes,
  System.SysUtils;

procedure Main;

implementation

function f(n: integer): integer;
begin
  Assert(n >= 0);

  if n = 0 then
    Exit(1);

  Result := f(n - 1) + f(n - 1);
end;

procedure Main;
begin
  writeln(f(10));
end;

end.
