unit Chapter03._06_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 167. Two Sum II - Input array is sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
//
// 对撞指针
// 时间复杂度: O(n)
// 空间复杂度: O(1)

type
  TSolution = class
  public
    function TwoSum(arr: TArr_int; target: integer): TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  nums, arr: TArr_int;
begin
  nums := [2, 7, 11, 15];

  with TSolution.Create do
  begin
    arr := TwoSum(nums, 9);
    Free;
  end;

  TArrayUtils_int.Print(arr);
end;

{ TSolution }

function TSolution.TwoSum(arr: TArr_int; target: integer): TArr_int;
var
  l, r: integer;
begin
  l := 0;
  r := High(arr);

  while l < r do
  begin
    if arr[l] + arr[r] < target then
      l += 1
    else if arr[l] + arr[r] > target then
      r -= 1
    else
      Exit([arr[l], arr[r]]);
  end;

  Result := [];
end;

end.
