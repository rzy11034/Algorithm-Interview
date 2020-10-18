unit Chapter04._04_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

// 1. Two Sum
// https://leetcode.com/problems/two-sum/description/
// 时间复杂度：O(n)
// 空间复杂度：O(n)
type
  TSolution = class(TObject)
  public
    function TowSum(nums: TArr_int; target: integer): TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  ret: TArr_int;
begin
  with TSolution.Create do
  begin
    ret := TowSum([0, 4, 3, 0], 0);
    Free;
  end;

  TArrayUtils_int.Print(ret);
end;

{ TSolution }

function TSolution.TowSum(nums: TArr_int; target: integer): TArr_int;
var
  map: TMap_int_int;
  i, complement: integer;
begin
  map := TMap_int_int.Create;

  for i := 0 to High(nums) do
  begin
    complement := target - nums[i];

    if map.ContainsKey(complement) then
    begin
      Result := [map[complement],i];
      Exit;
    end;

    map.Add(nums[i], i);
  end;

  Result := [];
end;

end.
