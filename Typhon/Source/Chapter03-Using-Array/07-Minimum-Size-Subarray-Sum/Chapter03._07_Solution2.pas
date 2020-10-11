unit Chapter03._07_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/description/
//
// 优化暴力解
// 时间复杂度: O(n^2)
// 空间复杂度: O(n)

type
  TSolution = class(TObject)
  public
    function MinSubArrayLen(arr: TArr_int; s: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  nums: TArr_int;
  ret: integer;
begin
  nums := [2, 3, 1, 2, 4, 3];

  with TSolution.Create do
  begin
    ret := MinSubArrayLen(nums, 7);
    Free;
  end;

  WriteLn(ret);
end;

{ TSolution }

function TSolution.MinSubArrayLen(arr: TArr_int; s: integer): integer;
begin

end;

end.

