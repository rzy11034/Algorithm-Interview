unit Chapter02._02_TimeComplexityBasic.Main2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

function Sum1(n: integer): integer;
var
  res, i: integer;
begin
  Assert(n >= 0);
  res := 0;
  for i := 0 to n do
    res += i;
  Result := res;
end;

function Sum2(n: integer): integer;
begin
  Assert(n >= 0);
  if n = 0 then
    Exit(0);

  Result := n + sum2(n - 1);
end;

procedure Main;
begin
  WriteLn(Sum1(10000));
  WriteLn(Sum2(10000));
end;

end.
