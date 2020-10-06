unit Chapter03._06_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 167. Two Sum II - Input array is sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
//
// 二分搜索法
// 时间复杂度: O(nlogn)
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
  function BinarySearch(l, r: integer; target: integer): integer;
  var
    mid: integer;
  begin
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

var
  i, j: integer;
begin
  for i := 0 to High(arr) do
  begin
    j := BinarySearch(i + 1, High(arr), target - arr[i]);
    if j <> -1 then
      Exit([arr[i], arr[j]]);
  end;

  Result := [];
end;

end.
