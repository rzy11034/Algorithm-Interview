unit Chapter09._07_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

/// 416. Partition Equal Subset Sum
/// https://leetcode.com/problems/partition-equal-subset-sum/description/
/// 动态规划
/// 时间复杂度: O(len(nums) * O(sum(nums)))
/// 空间复杂度: O(len(nums) * O(sum(nums)))
type
  TSolution = class(TObject)
  public
    function CanPartition(nums: TArr_int): boolean;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(CanPartition([1, 5, 11, 5]));
    WriteLn(CanPartition([1, 2, 3, 5]));

    Free;
  end;
end;

{ TSolution }

function TSolution.CanPartition(nums: TArr_int): boolean;
var
  memo: TArr_bool;
  sum, n, c, i, j: integer;
begin
  sum := 0;
  for i := 0 to High(nums) do
  begin
    Assert(nums[i] > 0);
    sum += nums[i];
  end;

  if sum mod 2 <> 0 then
    Exit(false);

  n := Length(nums);
  c := sum div 2;
  SetLength(memo, c + 1);

  for i := 0 to c do
    memo[i] := nums[0] = i;

  for i := 1 to n - 1 do
    for j := c downto nums[i] do
      memo[j] := memo[j] or memo[j - nums[i]];

  Result := memo[c];
end;

end.
