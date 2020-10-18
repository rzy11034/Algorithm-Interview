unit Chapter04._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 447. Number of Boomerangs
// https://leetcode.com/problems/number-of-boomerangs/description/
// 时间复杂度: O(n^2)
// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  private
    function __dis(pa, pb: TArr_int): integer;

  public
    function NumberOfBoomerangs(points: TArr2D_int): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: integer;
  points: TArr2D_int;
begin
  points := [[0, 0], [1, 0], [2, 0]];

  with TSolution.Create do
  begin
    ret := NumberOfBoomerangs(points);
    Free;
  end;

  WriteLn(ret);
end;

{ TSolution }

function TSolution.NumberOfBoomerangs(points: TArr2D_int): integer;
var
  ret, i, j, dis: integer;
  recordMap: TMap_int_int;
begin
  ret := 0;

  for i := 0 to High(points) do
  begin
    // recordMap 中存储点 i 到所有其他点的距离出现的频次
    recordMap := TMap_int_int.Create;

    for j := 0 to High(points) do
    begin
      if j <> i then
      begin
        // 计算距离时不进行开根运算, 以保证精度
        dis := __dis(points[i], points[j]);
        if recordMap.ContainsKey(dis) then
          recordMap[dis] := recordMap[dis] + 1
        else
          recordMap.Add(dis, 1);
      end;
    end;

    for dis in recordMap.Keys do
    begin
      ret += recordMap[dis] * (recordMap[dis] - 1);
    end;
  end;

  Result := ret;
end;

function TSolution.__dis(pa, pb: TArr_int): integer;
begin
  Result := Sqr(pa[0] - pb[0]) + Sqr(pa[1] - pb[1]);
end;

end.
