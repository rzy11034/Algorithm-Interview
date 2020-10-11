unit Chapter03._07_Solution2;

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
// 优化暴力解
// 时间复杂度: O(n^2)
// 空间复杂度: O(n)

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
  ret, l, r, i: integer;
  sums: TArr_int;
begin
  Assert((s >= 0) and (arr <> nil));

  // ums[i]存放nums[0...i-1]的和
  SetLength(sums, Length(arr) + 1);
  sums[0] := 0;
  for i := 1 to Length(arr) do
    sums[i] := sums[i - 1] + arr[i - 1];

  ret := Length(arr) + 1;
  for l := 0 to High(arr) do
  begin
    for r := l to High(arr) do
    begin
      // 使用sums[r+1] - sums[l] 快速获得nums[l...r]的和
      if sums[r + 1] - sums[l] >= s then
        ret := Min(ret, r - l + 1);
    end;
  end;

  if ret = Length(arr) + 1 then
    Exit(0);

  Result := ret;
end;

end.
