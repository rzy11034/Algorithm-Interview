unit Chapter03._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 75. Sort Colors
// https://leetcode.com/problems/sort-colors/description/

// 计数排序的思路
// 对整个数组遍历了两遍
// 时间复杂度: O(n)
// 空间复杂度: O(k), k为元素的取值范围

type
  TSolution = class(TObject)
  public
    procedure SortColors(nums: TArr_int);
  end;

procedure Main;

implementation

procedure Main;
var
  arr: TArr_int;
begin
  arr := [2, 2, 2, 1, 1, 0];

  with TSolution.Create do
  begin
    SortColors(arr);
    Free;
  end;

  TArrayUtils_int.Print(arr);
end;

{ TSolution }

procedure TSolution.SortColors(nums: TArr_int);
var
  Count: TArr_int;
  i, index, j: integer;
begin
  Count := [0, 0, 0];

  for i := 0 to High(nums) do
  begin
    Assert((nums[i] >= 0) and (nums[i] <= 2));
    Count[nums[i]] += 1;
  end;

  index := 0;
  for i := 0 to High(Count) do
  begin
    for j := 0 to Count[i] - 1 do
    begin
      nums[index] := i;
      index += 1;
    end;
  end;
end;

end.
