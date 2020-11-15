unit Chapter09._04_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 198. House Robber
/// https://leetcode.com/problems/house-robber/description/
/// 记忆化搜索
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

  // 考虑抢劫nums[index...nums.size())这个范围的所有房子
  function __tryRob__(index: integer): integer;
  var
    res, i: integer;
  begin
    if index >= Length(nums) then
      Exit(0);

    if memo[index] <> -1 then
    begin
      Result := memo[index];
      Exit;
    end;

    res := 0;
    for i := index to Length(nums) - 1 do
      res := Max(res, nums[i] + __tryRob__(i + 2));

    memo[index] := res;
    Result := res;
  end;

begin
  SetLength(memo, Length(nums));
  TArrayUtils_int.FillArray(memo, -1);
  Result := __tryRob__(0);
end;

end.
