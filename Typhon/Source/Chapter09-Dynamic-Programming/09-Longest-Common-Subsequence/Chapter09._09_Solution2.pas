unit Chapter09._09_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.UString,
  DeepStar.Utils;

/// LCS问题
/// 动态规划
/// 时间复杂度: O(len(s1)*len(s2))
/// 空间复杂度: O(len(s1)*len(s2))
type
  TSolution = class(TObject)
  public
    function GetLCS(const s1, s2: UString): UString;
  end;

procedure Main;

implementation

procedure Main;
var
  s1, s2: UString;
begin
  s1 := 'ABCD';
  s2 := 'AEBD';

  with TSolution.Create do
  begin
    WriteLn(GetLCS(s1, s2));

    Free;
  end;
end;

{ TSolution }

function TSolution.GetLCS(const s1, s2: UString): UString;
var
  m, n, j, k, i: integer;
  memo: TArr2D_int;
  res: UString;
begin
  m := Length(s1);
  n := Length(s2);
  SetLength(memo, m, n);

  // 对memo的第0行和第0列进行初始化
  for j := 0 to n - 1 do
  begin
    if s1.Chars[0] = s2.Chars[j] then
    begin
      for k := j to n - 1 do
        memo[0, k] := 1;

      Break;
    end;
  end;

  for i := 0 to m - 1 do
  begin
    if s1.Chars[i] = s2.Chars[0] then
    begin
      for k := i to m - 1 do
        memo[0, k] := 1;

      Break;
    end;
  end;

  // 动态规划的过程
  for i := 1 to m - 1 do
    for j := 1 to n - 1 do
      if s1.Chars[i] = s2.Chars[j] then
        memo[i, j] := 1 + memo[i - 1, j - 1]
      else
        memo[i, j] := Max(memo[i - 1, j], memo[i, j - 1]);

  // 通过memo反向求解s1和s2的最长公共子序列
  m := Length(s1) - 1;
  n := Length(s2) - 1;

  res := '';
  while (m >= 0) and (n >= 0) do
  begin
    if s1.Chars[m] = s2.Chars[n] then
    begin
      res := s1.Chars[m] + res;
      m -= 1;
      n -= 1;
    end
    else if m = 0 then
      n -= 1
    else if n = 0 then
      m -= 1
    else
    begin
      if memo[m - 1, n] > memo[m, n - 1] then
        m -= 1
      else
        n -= 1;
    end;
  end;

  Result := res;
end;

end.
