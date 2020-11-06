unit Chapter09._03_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 343. Integer Break
/// https://leetcode.com/problems/integer-break/description/
/// 动态规划
/// 时间复杂度: O(n^2)
/// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function integerBreak(n: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(integerBreak(2));
    WriteLn(integerBreak(10));
    WriteLn(integerBreak(40));

    Free;
  end;
end;

{ TSolution }

function TSolution.integerBreak(n: integer): integer;
  function __max3__(a, b, c: integer): integer;
  begin
    Result := Max(a, Max(b, c));
  end;

var
  memo: TArr_int;
  i, j: integer;
begin
  // memo[i] 表示将数字i分割(至少分割成两部分)后得到的最大乘积
  SetLength(memo, n + 1);
  TArrayUtils_int.FillArray(memo, -1);
  memo[1] := 1;

  for i := 2 to n do
  begin
    for j := 1 to i - 1 do
    begin
      memo[i] := __max3__(memo[i], j * (i - j), j * memo[i - j]);
    end;
  end;

  Result := memo[n];
end;

end.
