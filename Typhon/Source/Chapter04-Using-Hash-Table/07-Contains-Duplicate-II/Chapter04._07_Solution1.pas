unit Chapter04._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 219. Contains Duplicate II
// https://leetcode.com/problems/contains-duplicate-ii/description/
// 时间复杂度: O(n)
// 空间复杂度: O(k)
type
  TSolution = class(TObject)
  public
    function containsNearbyDuplicate(nums: TArr_int; k: integer): boolean;
  end;

procedure Main;

implementation

procedure Main;
var
  k: integer;
  nums: TArr_int;
  ret: boolean;
begin
  with TSolution.Create do
  begin
    nums := [1, 2, 3, 1];
    k := 3;
    ret := containsNearbyDuplicate(nums, k);
    WriteLn(ret);

    nums := [1, 0, 1, 1];
    k := 1;
    ret := containsNearbyDuplicate(nums, k);
    WriteLn(ret);

    nums := [1, 2, 3, 1, 2, 3];
    k := 2;
    ret := containsNearbyDuplicate(nums, k);
    WriteLn(ret);

    Free;
  end;
end;

{ TSolution }

function TSolution.containsNearbyDuplicate(nums: TArr_int; k: integer): boolean;
var
  recordSet: TSet_int;
  i: integer;
begin
  if (nums = nil) or (Length(nums) <= 1) then
    Exit(false);

  if k <= 0 then
    Exit(false);

  recordSet := TSet_int.Create;

  for i := 0 to High(nums) do
  begin
    if recordSet.Contains(nums[i]) then
      Exit(true);

    recordSet.Add(nums[i]);
    if recordSet.Count = k + 1 then
      recordSet.Remove(nums[i - k]);
  end;

  Result := false;

  recordSet.Free;
end;

end.
