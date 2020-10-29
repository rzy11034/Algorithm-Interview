unit Chapter08._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.UString,
  DeepStar.Utils;

/// 79. Word Search
/// Source : https://leetcode.com/problems/word-search/description/
/// 回溯法
/// 时间复杂度: O(m*n*m*n)
/// 空间复杂度: O(m*n)
type
  TSolution = class
  public
    function exist(board: TArr2D_chr; word: UString): boolean;
  end;

procedure Main;

implementation

procedure Main;
var
  board: TArr2D_chr;
begin
  board := [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E']];

  with TSolution.Create do
  begin
    WriteLn(exist(board, 'ABCCED'));
    WriteLn(exist(board, 'SEE'));
    WriteLn(exist(board, 'ABCB'));

    Free;
  end;
end;

{ TSolution }

function TSolution.exist(board: TArr2D_chr; word: UString): boolean;
const
  D: TArr2D_int = ((-1, 0), (0, 1), (1, 0), (0, -1));
var
  visited: array of array of boolean;
  n, m: integer;

  function __inArea__(x, y: integer): boolean;
  begin
    Result := (x >= 0) and (y >= 0) and (x < n) and (y < m);
  end;

  function __search__(x, y, index: integer): boolean;
  var
    newX, i, newY: integer;
  begin
    if index = word.Length - 1 then
    begin
      Result := word.Chars[index] = board[x, y];
      Exit;
    end;

    if board[x, y] = word.Chars[index] then
    begin
      visited[x, y] := true;

      for i := 0 to High(D) do
      begin
        newX := x + D[i, 0];
        newY := y + D[i, 1];

        if __inArea__(newX, newY)
          and (visited[newX, newY] = false)
          and __search__(newX, newY, index + 1) then
        begin
          Result := true;
          Exit;
        end;
      end;

      visited[x, y] := false;
    end;

    Result := false;
  end;

var
  i, j: integer;
begin
  n := Length(board);
  m := Length(board[0]);

  SetLength(visited, n, m);
  for i := 0 to n - 1 do
    for j := 0 to m - 1 do
      visited[i, j] := false;

  for i := 0 to n - 1 do
  begin
    for j := 0 to m - 1 do
    begin
      if __search__(i, j, 0) then
        Exit(true);
    end;
  end;

  Result := false;
end;

end.
