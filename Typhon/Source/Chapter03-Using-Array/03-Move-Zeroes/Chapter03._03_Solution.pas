unit Chapter03._03_Solution;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/description/
// 时间复杂度: O(n)
// 空间复杂度: O(n)

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
  list: TList_int;
  i: integer;
begin
  list := TList_int.Create();
  for i := 0 to High(arr) do
    if arr[i] <> 0 then
      list.AddLast(arr[i]);

  for i := 0 to list.Count - 1 do
    arr[i] := list[i];

  for i := list.Count to High(arr) do
    arr[i] := 0;

  list.Free;
end;

end.
