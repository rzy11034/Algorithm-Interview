unit Chapter10._02_Solution1;

{$mode objfpc}{$H+}
{$ModeSwitch advancedrecords}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

/// 435. Non-overlapping Intervals
/// https://leetcode.com/problems/non-overlapping-intervals/description/
/// 动态规划
/// 时间复杂度: O(n^2)
/// 空间复杂度: O(n)
type
  TInterval = record
    Start, End_: integer;
    constructor Create(newStart: integer; newEnd: integer);
    function Comparer(constref Left, Right: TInterval): integer;
  end;

  TArr_TInterval = array of TInterval;

  TSolution = class(TObject)
  public
    function EraseOverlapIntervals(intervals: TArr_TInterval): integer;

  end;

procedure Main;

implementation

procedure Main;
begin
  with TSolution.Create do
  begin
    WriteLn(EraseOverlapIntervals([TInterval.Create(0, 0)]));

    Free;
  end;
end;

{ TInterval }

constructor TInterval.Create(newStart: integer; newEnd: integer);
begin
  Start := newStart;
  End_ := newEnd;
end;

function TInterval.Comparer(constref Left, Right: TInterval): integer;
begin
  Result := Left.Start - Right.Start;

  if Result = 0 then
    Result := Left.End_ - Right.End_;
end;

{ TSolution }

function TSolution.EraseOverlapIntervals(intervals: TArr_TInterval): integer;
type
  TArrayUtils_TInterval = specialize TArrayUtils<TInterval>;
  TCmp = TArrayUtils_TInterval.TCmp_T;
  TCmpFunc = TArrayUtils_TInterval.TComparisonFunc_T;
var
  cmp: TCmpFunc;
begin
  if Length(intervals) = 0 then
    Exit(0);

  cmp := TCmpFunc(@TInterval.Comparer);

  TArrayUtils_TInterval.Sort(intervals, TCmp.Construct(cmp));
end;

end.



