unit Chapter09._08_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 300. Longest Increasing Subsequence
/// https://leetcode.com/problems/longest-increasing-subsequence/description/
/// 记忆化搜索
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

  // 以 nums[index] 为结尾的最长上升子序列的长度
  function __getMaxLength__(index: integer): integer;
  var
    res, i: integer;
  begin
    if memo[index] <> -1 then
      Exit(memo[index]);

    res := 1;
    for i := 0 to index - 1 do
    begin
      if nums[index] > nums[i] then
        res := Max(res, 1 + __getMaxLength__(i));
    end;

    memo[index] := res;
    Result := res;
  end;

var
  res, i: integer;
begin
  if Length(nums) = 0 then Exit(0);

  SetLength(memo, Length(nums));
  TArrayUtils_int.FillArray(memo, -1);

  res := 1;
  for i := 0 to High(nums) do
    res := Max(res, __getMaxLength__(i));

  Result := res;
end;

end.
