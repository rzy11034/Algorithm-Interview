unit Chapter02._05_RecursionTimeComplexity.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.Utils;

procedure Main;

implementation

function BinarySearch(arr: TArray_int; target: integer): integer;
  function __binarySearch__(l, r: integer): integer;
  var
    mid, res: integer;
  begin
    if l > r then Exit(-1);

    mid := l + (r - l) div 2;

    if arr[mid] = target then
      res := mid
    else if arr[mid] > target then
      res := __binarySearch__(l, mid - 1)
    else
      res := __binarySearch__(mid + 1, r);

    Result := res;
  end;

begin
  Result := __binarySearch__(0, High(arr));
end;

function Sum(n: integer): integer;
begin
  Assert(n >= 0);

  if n = 0 then
    Exit(0);

  Result := n + Sum(n - 1);
end;

function Pow(x: double; n: integer): double;
var
  t: double;
begin
  Assert(n >= 0);

  if n = 0 then
    Exit(1);

  t := Pow(x, n div 2);

  if n mod 2 = 1 then
    Exit(x * t * t);


  Result := t * t;
end;

procedure Main;
begin
  WriteLn(Sum(100));
  WriteLn(Pow(2, 10));
end;

end.

