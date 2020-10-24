unit Chapter05._03_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  AI.ListNode;

// 203. Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements/description/
// 使用虚拟头结点
// 时间复杂度: O(n)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function removeElements(head: TListNode; val: integer): TListNode;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  val: integer;
  l, m: TListNode;
begin
  a := [1, 2, 6, 3, 4, 5, 6];
  val := 6;

  with TSolution.Create do
  begin
    l := TListNode.Create(a);
    WriteLn(l.ToString);
    m := removeElements(TListNode.Create(a), val);
    WriteLn(m.ToString);
    Free;
  end;

  l.CLearAndFree;
end;

{ TSolution }

function TSolution.removeElements(head: TListNode; val: integer): TListNode;
var
  del, cur: TListNode;
begin
  while (head <> nil) and (head.Val = val) do
  begin
    del := head;
    head := head.Next;
    FreeAndNil(del);
  end;

  if head = nil then Exit(nil);

  cur := head;
  while cur.Next <> nil do
  begin
    if cur.Next.Val = val then
    begin
      del := cur.Next;
      cur.Next := del.Next;
      FreeAndNil(del);
    end
    else
      cur := cur.Next;
  end;

  Result := head;
end;

end.
