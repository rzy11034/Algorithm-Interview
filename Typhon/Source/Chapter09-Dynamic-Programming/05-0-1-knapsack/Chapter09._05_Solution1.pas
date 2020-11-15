unit Chapter09._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 背包问题
/// 记忆化搜索
/// 时间复杂度: O(n * C) 其中n为物品个数; C为背包容积
/// 空间复杂度: O(n * C)
type
  TSolution = class(TObject)
  public
    function knapsack01(const w, v: TArr_int; c: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  w, v: TArr_int;
begin
  w := [1, 2, 3];
  v := [6, 10, 12];

  with TSolution.Create do
  begin
    WriteLn(knapsack01(w, v, 5));

    Free;
  end;
end;

{ TSolution }

function TSolution.knapsack01(const w, v: TArr_int; c: integer): integer;
var
  memo: TArr2D_int;

  // 用 [0...index]的物品,填充容积为c的背包的最大价值
  function __bestValue__(index, c: integer): integer;
  var
    res: integer;
  begin
    if (c <= 0) or (index < 0) then
      Exit(0);

    if memo[index, c] <> -1 then
      Exit(memo[index, c]);

    res := __bestValue__(index - 1, c);
    if c >= w[index] then
      res := Max(res, v[index] + __bestValue__(index - 1, c - w[index]));

    memo[index, c] := res;
    Result := res;
  end;

var
  n, i: integer;
begin
  Assert((Length(w) = Length(v)) and (c >= 0));
  n := Length(w);

  if (n = 0) or (c = 0) then
    Exit(0);

  SetLength(memo, n, c + 1);
  for i := 0 to n - 1 do
    TArrayUtils_int.FillArray(memo[i], -1);

  Result := __bestValue__(n - 1, c);
end;


end.
