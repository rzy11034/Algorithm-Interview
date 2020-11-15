unit Chapter09._03_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 343. Integer Break
/// https://leetcode.com/problems/integer-break/description/
/// 记忆化搜索
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
var
  memo: TArr_int;

  function __max3__(a, b, c: integer): integer;
  begin
    Result := Max(a, Max(b, c));
  end;

  // 将n进行分割(至少分割两部分), 可以获得的最大乘积
  function __break__(n: integer): integer;
  var
    res, i: integer;
  begin
    if n = 1 then
      Exit(1);

    if memo[n] <> -1 then
      Exit(memo[n]);

    res := -1;
    for i := 1 to n - 1 do
      res := __max3__(res, i * (n - i), i * __break__(n - i));

    memo[n] := res;
    Result := res;
  end;

begin
  SetLength(memo, n + 1);
  TArrayUtils_int.FillArray(memo, -1);
  Result := __break__(n);
end;

end.
