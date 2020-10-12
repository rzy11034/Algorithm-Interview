unit Chapter03._07_Solution5;

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
// 二分搜索
// 扩展 Solution2 的方法。对于每一个l, 可以使用二分搜索法搜索r
//
// 时间复杂度: O(nlogn)
// 空间复杂度: O(n)

type
  TSolution = class(TObject)
  private
    // 在有序数组nums中寻找大于等于target的最小值
    // 如果没有（nums数组中所有值都小于target），则返回nums.length
    function __lowerBound(nums: TArr_int; target: integer): integer;
    function __isSorted(nums: TArr_int): boolean;
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
  sums: TArr_int;
  r, ret, i, l: integer;
begin
  Assert((s >= 0) and (nums <> nil));

  // sums[i]存放nums[0...i-1]的和
  SetLength(sums, Length(nums) + 1);
  sums[0] := 0;
  for i := 1 to Length(nums) do
    sums[i] := sums[i - 1] + nums[i - 1];

  ret := Length(nums) + 1;
  for l := 0 to High(nums) do
  begin
    // 类库中没有内置的lowerBound方法，
    // 我们需要自己实现一个基于二分搜索的lowerBound:)
    r := __lowerBound(sums, sums[l] + s);

    if r <> Length(sums) then
      ret := Min(ret, r - l);
  end;

  if ret = Length(nums) + 1 then
    Exit(0);

  Result := ret;
end;

function TSolution.__isSorted(nums: TArr_int): boolean;
var
  i: integer;
begin
  for i := 1 to High(nums) do
    if nums[i] < nums[i - 1] then
      Exit(false);

  Result := true;
end;

function TSolution.__lowerBound(nums: TArr_int; target: integer): integer;
var
  l, r, mid: integer;
begin
  Assert(nums <> nil);

  // 在nums[l...r)的范围里寻找解
  l := 0;
  r := Length(nums);
  while l <> r do
  begin
    mid := l + (r - l) div 2;

    if nums[mid] >= target then
      r := mid
    else
      l := mid + 1;
  end;

  Result := l;
end;

end.
