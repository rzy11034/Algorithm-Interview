unit Chapter03._07_Solution4;

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
// 另外一个滑动窗口的实现, 仅供参考
// 时间复杂度: O(n)
// 空间复杂度: O(1)

type
  TSolution = class(TObject)
  public
    function MinSubArrayLen(nums: TArr_int; s: integer): integer;
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

function TSolution.MinSubArrayLen(nums: TArr_int; s: integer): integer;
var
  l, r, sum: integer;
  ret: integer;
begin
  Assert((s >= 0) and (nums <> nil));

  // nums[l...r]为我们的滑动窗口
  l := 0;
  r := -1;
  sum := 0;
  ret := Length(nums) + 1;

  // 窗口的右边界无法继续扩展了, 则循环继续
  while r + 1 < Length(nums) do
  begin
    while (r + 1 < Length(nums)) and (sum < s) do
    begin
      r += 1;
      sum += nums[r];
    end;

    if sum >= s then
      ret := Min(ret, r - l + 1);

    while (l < Length(nums)) and (sum >= s) do
    begin
      sum -= nums[l];
      l += 1;

      if sum >= s then
        ret := Min(ret, r - l + 1);
    end;
  end;

  if ret = Length(nums) + 1 then
    Exit(0);

  Result := ret;
end;

end.
