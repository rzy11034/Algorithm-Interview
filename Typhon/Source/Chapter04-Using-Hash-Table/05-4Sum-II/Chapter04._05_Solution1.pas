unit Chapter04._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 454. 4Sum II
// https://leetcode.com/problems/4sum-ii/description/
// 时间复杂度: O(n^2)
// 空间复杂度: O(n^2)
type
  TSolution = class(TObject)
  public
    function FourSumCount(a, b, c, d: TArr_int): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: integer;
  a, b, c, d: TArr_int;
begin
  a := [1, 2];
  b := [-2, -1];
  c := [-1, 2];
  d := [0, 2];

  with TSolution.Create do
  begin
    ret := FourSumCount(a, b, c, d);
    Free;
  end;

  WriteLn(ret);
end;

{ TSolution }

function TSolution.FourSumCount(a, b, c, d: TArr_int): integer;
var
  map: TMap_int_int;
  i, j, sum, ret: integer;
begin
  map := TMap_int_int.Create;

  for i := 0 to High(c) do
  begin
    for j := 0 to High(d) do
    begin
      sum := c[i] + d[j];

      if map.ContainsKey(sum) then
        map[sum] := map[sum] + 1
      else
        map.Add(sum, 1);
    end;
  end;

  ret := 0;
  for i := 0 to High(a) do
  begin
    for j := 0 to High(b) do
    begin
      if map.ContainsKey(0 - a[i] - b[j]) then
        ret += map.GetItem(0 - a[i] - b[j]);
    end;
  end;

  Result := ret;
end;

end.
