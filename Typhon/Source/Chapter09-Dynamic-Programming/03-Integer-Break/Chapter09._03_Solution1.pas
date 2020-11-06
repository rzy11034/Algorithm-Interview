unit Chapter09._03_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math;

/// 343. Integer Break
/// 暴力搜索
/// 在Leetcode中提交这个版本的代码会超时! (Time Limit Exceeded)
/// 时间复杂度: O(n^n)
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

  // 将n进行分割(至少分割两部分), 可以获得的最大乘积
  function __break__(n: integer): integer;
  var
    res, i: integer;
  begin
    if n = 1 then
      Exit(1);

    res := -1;
    for i := 1 to n - 1 do
      res := __max3__(res, i * (n - i), i * __break__(n - i));

    Result := res;
  end;

begin
  Result := __break__(n);
end;

end.
