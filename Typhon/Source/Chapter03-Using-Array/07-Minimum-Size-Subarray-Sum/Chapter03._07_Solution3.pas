unit Chapter03._07_Solution3;

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
// 滑动窗口的思路
// 时间复杂度: O(n)
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
  l, r, sum: integer;
  ret: integer;
begin
  Assert((s >= 0) and (arr <> nil));

  // nums[l...r]为我们的滑动窗口
  l := 0;
  r := -1;
  sum := 0;
  ret := Length(arr) + 1;

  while l < Length(arr) do // 窗口的左边界在数组范围内,则循环继续
  begin
    if (r + 1 < Length(arr)) and (sum < s) then
    begin
      r += 1;
      sum += arr[r];
    end
    else // r 已经到头 或者 sum >= s
    begin
      sum -= arr[l];
      l += 1;
    end;

    if sum >= s then
      ret := Min(ret, r - l + 1);
  end;

  if ret = Length(arr) + 1 then
    Exit(0);

  Result := ret;
end;

end.
