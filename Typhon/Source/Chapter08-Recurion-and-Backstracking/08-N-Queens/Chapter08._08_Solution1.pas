unit Chapter08._08_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.UString,
  DeepStar.Utils;

/// 51. N-Queens
/// https://leetcode.com/problems/n-queens/description/
/// 时间复杂度: O(n^n)
/// 空间复杂度: O(n)
type
  TList_TList_str = specialize TArrayList<TList_str>;

  TSolution = class(TObject)
  public
    function solveNQueens(n: integer): TList_TList_str;
  end;

procedure Main;

implementation

procedure Main;
var
  res: TList_TList_str;
  i: integer;
begin
  with TSolution.Create do
  begin
    res := solveNQueens(4);

    for i := 0 to res.Count - 1 do
    begin
      TArrayUtils_str.Print(res[i].ToArray);
    end;
  end;
end;

{ TSolution }

function TSolution.solveNQueens(n: integer): TList_TList_str;
var
  res: TList_TList_str;
  arr: TArr_int;

  function __check__(k: integer): boolean;
  var
    i: integer;
  begin
    for i := 0 to k - 1 do
    begin
      if (arr[i] = arr[k]) or (Abs(k - i) = Abs(arr[k] - arr[i])) then
        Exit(false);
    end;

    Result := true;
  end;

  function __generateBoard__: TList_str;
  var
    res: TList_str;
    cs: TArr_chr;
    i: integer;
  begin
    res := TList_str.Create;
    for i := 0 to n - 1 do
    begin
      SetLength(cs, n);
      TArrayUtils_chr.FillArray(cs, '.');

      if i = arr[i] then
        cs[i] := 'Q';

      res.AddLast(UString(cs));
    end;

    Result := res;
  end;

  procedure __putQueen__(index: integer);
  var
    i: integer;
  begin
    if index = n - 1 then
    begin
      res.AddLast(__generateBoard__);
      Exit;
    end;

    for i := 0 to n - 1 do
    begin
      arr[index] := i;

      if __check__(index) then
        __putQueen__(index + 1);
    end;
  end;

begin
  res := TList_TList_str.Create;
  SetLength(arr, n);
  __putQueen__(0);

  Result := res;
end;

end.
