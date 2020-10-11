unit Chapter03._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/description/
//
// 暴力解法
// 该方法在 Leetcode 中会超时！
// 时间复杂度: O(n^3)
// 空间复杂度: O(1)

type
  TSolution = class(TObject)
  public
    function MinSubArrayLen(arr: TArr_int; s: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  nums: TArr_int;
  ret: integer;
begin
  nums := [2, 3, 1, 2, 4, 3];

  with TSolution.Create do
  begin
    ret := MinSubArrayLen(nums, 7);
    Free;
  end;

  WriteLn(ret);
end;

{ TSolution }

function TSolution.MinSubArrayLen(arr: TArr_int; s: integer): integer;
var
  ret, l, r, sum, i: integer;
begin
  ret := Length(arr) + 1;

  for l := 0 to High(arr) do
  begin
    for r := l to High(arr) do
    begin
      sum := 0;

      for i := l to r do
        sum += arr[i];

      if sum >= s then
        ret := Min(ret, r - l + 1);
    end;
  end;

  Result := ret;
end;

end.
