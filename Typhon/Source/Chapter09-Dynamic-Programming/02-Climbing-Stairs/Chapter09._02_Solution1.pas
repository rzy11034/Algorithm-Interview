unit Chapter09._02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

/// 70. Climbing Stairs
/// https://leetcode.com/problems/climbing-stairs/description/
/// 记忆化搜索
/// 时间复杂度: O(n)
/// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function climbStairs(n: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(climbStairs(10));
    Free;
  end;
end;

{ TSolution }

function TSolution.climbStairs(n: integer): integer;
var
  memo: TArr_int;

  function __calcWays__(n: integer): integer;
  begin
    if (n = 0) or (n = 1) then
      Exit(1);

    if memo[n] = -1 then
      memo[n] := __calcWays__(n - 1) + __calcWays__(n - 2);

    Result := memo[n];
  end;

begin
  SetLength(memo, n + 1);
  TArrayUtils_int.FillArray(memo, -1);
  Result := __calcWays__(n);
end;

end.
