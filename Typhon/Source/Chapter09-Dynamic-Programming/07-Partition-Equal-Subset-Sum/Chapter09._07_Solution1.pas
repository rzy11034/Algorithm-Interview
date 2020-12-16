unit Chapter09._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 416. Partition Equal Subset Sum
/// https://leetcode.com/problems/partition-equal-subset-sum/description/
/// 记忆化搜索
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
  // memo[i][c] 表示使用索引为[0...i]的这些元素,是否可以完全填充一个容量为c的背包
  // -1 表示为未计算; 0 表示不可以填充; 1 表示可以填充
  memo: TArr2D_int;

  // 使用nums[0...index], 是否可以完全填充一个容量为sum的背包
  function __tryPartition__(index, sum: integer): boolean;
  begin
    if sum = 0 then
      Exit(true);

    if (sum < 0) or (index < 0) then
      Exit(false);

    if memo[index, sum] <> -1 then
      Exit(memo[index, sum] = 1);

    memo[index, sum] := IfThen(__tryPartition__(index - 1, sum)
      or __tryPartition__(index - 1, sum - nums[index]), 1, 0);

    Result := memo[index, sum] = 1;
  end;

var
  sum, i: integer;
begin
  sum := 0;
  for i := 0 to High(nums) do
  begin
    Assert(nums[i] > 0);
    sum += nums[i];
  end;

  if sum mod 2 <> 0 then
    Exit(false);

  SetLength(memo, Length(nums), sum div 2 + 1);
  for i := 0 to High(memo) do
    TArrayUtils_int.FillArray(memo[i], -1);

  Result := __tryPartition__(High(nums), sum div 2);
end;

end.
