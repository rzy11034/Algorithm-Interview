unit Chapter08._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

/// 200. Number of Islands
/// https://leetcode.com/problems/number-of-islands/description/
/// 时间复杂度: O(n*m)
/// 空间复杂度: O(n*m)
type
  TSolution = class(TObject)
  public
    function numIslands(grid: TArr2D_chr): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  grid: TArr2D_chr;
  res: integer;
begin
  with TSolution.Create do
  begin
    grid := [
      ['1', '1', '1', '1', '0'],
      ['1', '1', '0', '1', '0'],
      ['1', '1', '0', '0', '0'],
      ['0', '0', '0', '0', '0']];
    res := numIslands(grid);
    WriteLn(res);

    grid := [
      ['1', '1', '0', '0', '0'],
      ['1', '1', '0', '0', '0'],
      ['0', '0', '1', '0', '0'],
      ['0', '0', '0', '1', '1']];
    res := numIslands(grid);
    WriteLn(res);

    Free;
  end;
end;

{ TSolution }

function TSolution.numIslands(grid: TArr2D_chr): integer;
const
  D: TArr2D_int = ((-1, 0), (0, 1), (1, 0), (0, -1));
var
  visited: array of array of boolean;
  n, m: integer;

  function __inArea__(x, y: integer): boolean;
  begin
    Result := (x >= 0) and (y >= 0) and (x < n) and (y < m);
  end;

  // 从grid[x][y]的位置开始,进行 floodfill
  // 保证(x,y)合法,且grid[x][y]是没有被访问过的陆地
  procedure __isLands__(x, y: integer);
  var
    newX, newY, i: integer;
  begin
    visited[x, y] := true;
    for i := 0 to High(D) do
    begin
      newX := x + D[i, 0];
      newY := y + D[i, 1];

      if __inArea__(newX, newY) and (not visited[newX, newY]) and (grid[newX, newY] = '1') then
      begin
        __isLands__(newX, newY);
      end;
    end;
  end;

var
  i, j, res: integer;
begin
  n := Length(grid);
  m := Length(grid[0]);

  SetLength(visited, n, m);
  for i := 0 to n - 1 do
    for j := 0 to m - 1 do
      visited[i, j] := false;

  res := 0;
  for i := 0 to n - 1 do
  begin
    for j := 0 to m - 1 do
    begin
      if (grid[i, j] = '1') and (not visited[i, j]) then
      begin
        __isLands__(i, j);
        res += 1;
      end;
    end;
  end;

  Result := res;
end;

end.
