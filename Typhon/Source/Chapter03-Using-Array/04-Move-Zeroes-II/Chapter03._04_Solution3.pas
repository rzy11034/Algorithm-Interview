unit Chapter03._04_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/description/
//
// 原地(in place)解决该问题
// 时间复杂度: O(n)
// 空间复杂度: O(1)

type
  TSolution = class(TObject)
  public
    procedure MoveZeroes(arr: TArr_int);
  end;

procedure Main;

implementation

procedure Main;
var
  arr: TArr_int;
begin
  arr := [0, 1, 0, 3, 12];

  with TSolution.Create do
  begin
    MoveZeroes(arr);
    Free;
  end;

  TArrayUtils_int.Print(arr);
end;

{ TSolution }

procedure TSolution.MoveZeroes(arr: TArr_int);
var
  k, i: integer;
begin
  k := 0; // nums中, [0...k)的元素均为非0元素

  // 遍历到第i个元素后,保证[0...i]中所有非0元素
  // 都按照顺序排列在[0...k)中
  for i := 0 to High(arr) do
  begin
    if arr[i] <> 0 then
    begin
      TUtils_int.Swap(arr[k], arr[i]);
      k += 1;
    end;
  end;
end;

end.
