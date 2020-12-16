unit Chapter10._01_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

/// 455. Assign Cookies
/// https://leetcode.com/problems/assign-cookies/description/
/// 先尝试满足最不贪心的小朋友
/// 时间复杂度: O(nlogn)
/// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function FindContentChildren(g, s: TArr_int): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  g, s: TArr_int;
begin
  with TSolution.Create do
  begin
    g := [1, 2, 3];
    s := [1, 1];
    WriteLn(FindContentChildren(g, s));

    g := [1, 2];
    s := [1, 2, 3];
    WriteLn(FindContentChildren(g, s));

    Free;
  end;
end;

{ TSolution }

function TSolution.FindContentChildren(g, s: TArr_int): integer;
var
  gi, si, res: integer;
begin
  TArrayUtils_int.Sort(g);
  TArrayUtils_int.Sort(s);

  gi := 0;
  si := 0;
  res := 0;
  while (gi < Length(g)) and (si < Length(s)) do
  begin
    if s[si] >= g[gi] then
    begin
      res += 1;
      gi += 1;
    end;
    si += 1;
  end;

  Result := res;
end;

end.
