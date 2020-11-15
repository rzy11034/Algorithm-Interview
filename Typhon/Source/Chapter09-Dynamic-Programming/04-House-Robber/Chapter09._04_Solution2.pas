unit Chapter09._04_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 198. House Robber
/// https://leetcode.com/problems/house-robber/description/
/// 动态规划
/// 时间复杂度: O(n^2)
/// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function rob(nums: TArr_int): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(rob([1, 2, 3, 1]));
    WriteLn(rob([2, 7, 9, 3, 1]));

    Free;
  end;
end;

{ TSolution }

function TSolution.rob(nums: TArr_int): integer;
var
  // memo[i] 表示考虑抢劫 nums[i...n) 所能获得的最大收益
  memo: TArr_int;
  n, i, j: integer;
begin
  n := Length(nums);

  if n = 0 then
    Exit(0);

  SetLength(memo, n);
  memo[n - 1] := nums[n - 1];
  for i := n - 2 downto 0 do
  begin
    for j := i to n - 1 do
    begin
      if j + 2 < n then
        memo[i] := Max(memo[i], nums[j] + memo[j + 2])
      else
        memo[i] := Max(memo[i], nums[j] + 0);
    end;
  end;

  Result := memo[0];
end;

end.
