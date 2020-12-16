unit Chapter09._09_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.UString,
  DeepStar.Utils;

/// LCS问题
/// 动态规划, 躲避边界条件
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
  m, n, j, i: integer;
  memo: TArr2D_int;
  res: UString;
begin
  m := Length(s1);
  n := Length(s2);

  // memo 是 (m + 1) * (n + 1) 的动态规划表格
  // memo[i][j] 表示s1的前i个字符和s2前j个字符的最长公共子序列的长度
  // 其中memo[0][j] 表示s1取空字符串时, 和s2的前j个字符作比较
  // memo[i][0] 表示s2取空字符串时, 和s1的前i个字符作比较
  // 所以, memo[0][j] 和 memo[i][0] 均取0
  // 我们不需要对memo进行单独的边界条件处理 :-)
  SetLength(memo, m + 1, n + 1);

  // 动态规划的过程
  // 注意, 由于动态规划状态的转变, 下面的i和j可以取到m和n
  for i := 1 to m do
    for j := 1 to n do
      if s1.Chars[i - 1] = s2.Chars[j - 1] then
        memo[i, j] := 1 + memo[i - 1, j - 1]
      else
        memo[i, j] := Max(memo[i - 1, j], memo[i, j - 1]);

  // 通过memo反向求解s1和s2的最长公共子序列
  res := '';
  while (m > 0) and (n > 0) do
  begin
    if s1.Chars[m - 1] = s2.Chars[n - 1] then
    begin
      res := s1.Chars[m - 1] + res;
      m -= 1;
      n -= 1;
    end
    else if memo[m - 1, n] > memo[m, n - 1] then
      m -= 1
    else
      n -= 1;
  end;

  Result := res;
end;

end.
