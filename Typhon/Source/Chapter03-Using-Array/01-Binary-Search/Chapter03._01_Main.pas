﻿unit Chapter03._01_Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils,
  AI.Utils;

procedure Main;

implementation

function BinarySearch(arr: TArr_int; target: integer): integer;
var
  l, r, mid: integer;
begin
  l := 0;
  r := High(arr);

  while l <= r do
  begin
    mid := l + (r - l) div 2;

    if arr[mid] = target then
      Exit(mid);

    if arr[mid] > target then
      r := mid - 1
    else
      l := mid + 1;
  end;

  Result := -1;
end;

procedure Main;
var
  n, i: integer;
  startTime, endTime: cardinal;
  Data: TArr_int;
begin
  n := Round(IntPower(10, 7));
  Data := TUtils.GenerateOrderedArray(n);
  startTime := TThread.GetTickCount64;
  for i := 0 to n - 1 do
    Assert(i = BinarySearch(Data, i));
  endTime := TThread.GetTickCount64;

  WriteLn('Binary Search test complete.');
  WriteLn('Time cost: ', (endTime - startTime) / 1000, ' s');
end;

end.
