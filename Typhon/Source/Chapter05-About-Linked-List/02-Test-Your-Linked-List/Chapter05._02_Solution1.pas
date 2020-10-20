unit Chapter05._02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  Chapter05.ListNode,
  Chapter05._01_Solution1;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  l, m: TListNode;
begin
  a := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  l := TListNode.Create(a);
  WriteLn(l.ToString);

  with TSolution.Create do
  begin
    m := reverseList(l);
    WriteLn(m.ToString);
    Free;
  end;
end;

end.
