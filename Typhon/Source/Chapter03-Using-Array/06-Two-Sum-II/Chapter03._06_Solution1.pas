unit Chapter03._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 167. Two Sum II - Input array is sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
//
// 暴力枚举法
// 时间复杂度: O(n^2)
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
  i, j: integer;
  ret: TArr_int;
begin
  for i := 0 to High(arr) do
  begin
    for j := i + 1 to High(arr) do
    begin
      if target = arr[i] + arr[j] then
        Exit([arr[i], arr[j]]);
    end;
  end;

  Result := [];
end;

end.
