unit Chapter09._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 背包问题
/// 动态规划改进: 滚动数组
/// 时间复杂度: O(n * C) 其中n为物品个数; C为背包容积
/// 空间复杂度: O(C), 实际使用了2*C的额外空间
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
  n, i, j: integer;
begin
  Assert((Length(w) = Length(v)) and (c >= 0));
  n := Length(w);

  if (n = 0) or (c = 0) then
    Exit(0);

  SetLength(memo, 2, c + 1);

  for i := 0 to c do
    memo[0, i] := IfThen(i >= w[0], v[0], 0);

  for i := 1 to n - 1 do
  begin
    for j := 0 to c do
    begin
      memo[i mod 2, j] := memo[(i - 1) mod 2, j];
      if j >= w[i] then
        memo[i mod 2, j] := Max(memo[i mod 2, j], v[i] + memo[(i - 1) mod 2, j - w[i]]);
    end;
  end;

  Result := memo[(n - 1) mod 2, c];
end;

end.
