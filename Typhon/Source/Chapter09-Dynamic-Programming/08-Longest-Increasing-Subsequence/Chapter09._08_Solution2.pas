unit Chapter09._08_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 300. Longest Increasing Subsequence
/// https://leetcode.com/problems/longest-increasing-subsequence/description/
/// 动态规划
/// 时间复杂度: O(n^2)
/// 空间复杂度: O(n)
type
  TSolution = class(TObject)
  public
    function LengthOfLIS(nums: TArr_int): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(LengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]));

    Free;
  end;
end;

{ TSolution }

function TSolution.LengthOfLIS(nums: TArr_int): integer;
var
  memo: TArr_int;
  i, j, res: integer;
begin
  if Length(nums) = 0 then Exit(0);

  // memo[i] 表示以 nums[i] 为结尾的最长上升子序列的长度
  SetLength(memo, Length(nums));
  TArrayUtils_int.FillArray(memo, 1);

  for i := 1 to High(nums) do
  begin
    for j := 0 to i - 1 do
    begin
      if nums[i] > nums[j] then
        memo[i] := Max(memo[i], 1 + memo[j]);
    end;
  end;

  res := memo[0];
  for i := 1 to High(nums) do
    res := Max(res, memo[i]);

  Result := res;
end;

end.
