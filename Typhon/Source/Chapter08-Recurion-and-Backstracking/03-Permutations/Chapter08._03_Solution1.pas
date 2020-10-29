unit Chapter08._03_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.DSA.Linear.ArrayList;

/// 46. Permutations
/// https://leetcode.com/problems/permutations/description/
/// 时间复杂度: O(n^n)
/// 空间复杂度: O(n)
type
  TList_TList_int = specialize TArrayList<TList_int>;

  TSolution = class
  public
    function permute(nums: TArr_int): TList_TList_int;
  end;

procedure Main;

implementation

procedure Main;
var
  res: TList_TList_int;
  r: TList_int;
  i: integer;
begin
  with TSolution.Create do
  begin
    res := permute([1, 2, 3]);

    for i := 0 to res.Count - 1 do
    begin
      r := res[i];
      TArrayUtils_int.Print(r.ToArray);
      r.Free;
    end;

    res.Free;
    Free;
  end;
end;

{ TSolution }

function TSolution.permute(nums: TArr_int): TList_TList_int;
var
  used: TArr_bool;
  res: TList_TList_int;
  p: TList_int;

  // p中保存了一个有index-1个元素的排列。
  // 向这个排列的末尾添加第index个元素, 获得一个有index个元素的排列
  procedure __generatePermutation__(index: integer);
  var
    i: integer;
  begin
    if index = Length(nums) then
    begin
      res.AddLast(TList_int.Create(p.ToArray));
      Exit;
    end;

    for i := 0 to High(nums) do
    begin
      if used[i] = false then
      begin
        p.AddLast(nums[i]);
        used[i] := true;
        __generatePermutation__(index + 1);

        p.RemoveLast;
        used[i] := false;
      end;
    end;
  end;

begin
  SetLength(used, Length(nums));
  res := TList_TList_int.Create;
  p := TList_int.Create;

  __generatePermutation__(0);

  Result := res;
  p.Free;
end;

end.
