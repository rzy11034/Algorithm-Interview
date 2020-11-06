unit Chapter09._02_Solution2;

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
  i: integer;
begin
  SetLength(memo, n + 1);
  memo[0] := 1;
  memo[1] := 1;

  for i := 2 to High(memo) do
    memo[i] := memo[i - 1] + memo[i - 2];

  Result := memo[n];
end;

end.
