unit Chapter03._05_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 75. Sort Colors
// https://leetcode.com/problems/sort-colors/description/

// 三路快速排序的思想
// 对整个数组只遍历了一遍
// 时间复杂度: O(n)
// 空间复杂度: O(1)

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
  zero, two, i: integer;
begin
  zero := -1; // [0...zero] = 0
  two := Length(nums); // [two...n-1] = 2

  i := 0;
  while i < two do
  begin
    if nums[i] = 1 then
    begin
      i += 1;
    end
    else if nums[i] = 2 then
    begin
      two -= 1;
      TUtils_int.Swap(nums[i], nums[two]);
    end
    else // nums[i] == 0
    begin
      Assert(nums[i] = 0);

      zero += 1;
      TUtils_int.Swap(nums[zero], nums[i]);
      i += 1;
    end;
  end;
end;

end.
