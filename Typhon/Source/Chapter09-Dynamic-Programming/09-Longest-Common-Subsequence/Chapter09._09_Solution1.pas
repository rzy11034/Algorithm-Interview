unit Chapter09._09_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.UString,
  DeepStar.Utils;

/// LCS问题
/// 记忆化搜索
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
  memo: TArr2D_int;

  // 求s1[0...m]和s2[0...n]的最长公共子序列的长度值
  function __LCS__(m, n: integer): integer;
  var
    res: integer;
  begin
    if (m < 0) or (n < 0) then
      Exit(0);

    if memo[m, n] <> -1 then
      Exit(memo[m, n]);

    res := 0;
    if s1.Chars[m] = s2.Chars[n] then
      res := 1 + __LCS__(m - 1, n - 1)
    else
      res := Max(__LCS__(m - 1, n), __LCS__(m, n - 1));

    memo[m, n] := res;
    Result := res;
  end;

  // 通过memo反向求解s1和s2的最长公共子序列
  function __getLCS__: UString;
  var
    m, n: integer;
    res: UString;
  begin
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

var
  i, m, n: integer;
begin
  m := Length(s1);
  n := Length(s2);
  SetLength(memo, m, n);
  for i := 0 to High(memo) do
    TArrayUtils_int.FillArray(memo[i], -1);

  __LCS__(Length(s1) - 1, Length(s2) - 1);
  Result := __getLCS__;
end;

end.
