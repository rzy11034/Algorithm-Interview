unit Chapter03._07_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/description/
//
// 暴力解法
// 该方法在 Leetcode 中会超时！
// 时间复杂度: O(n^3)
// 空间复杂度: O(1)

type
  TSolution = class(TObject)
  public
    function MinSubArrayLen(arr: TArr_int; sum: integer): integer;
  end;

implementation

{ TSolution }

function TSolution.MinSubArrayLen(arr: TArr_int; sum: integer): integer;
begin
  //Min();
end;

end.
