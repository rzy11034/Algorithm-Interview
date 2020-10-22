unit Chapter05._03_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Chapter05.ListNode,
  DeepStar.Utils;

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
  l: TListNode;
begin
  a := [1, 2, 6, 3, 4, 5, 6];
  val := 6;

  with TSolution.Create do
  begin
    l := TListNode.Create(a);
    WriteLn(l.ToString);
    removeElements(l, val);
    WriteLn(l.ToString);
    Free;
  end;

  l.CLearAndFree;
end;

{ TSolution }

function TSolution.removeElements(head: TListNode; val: integer): TListNode;
var
  dummyHead, cur, del: TListNode;
begin
  dummyHead := TListNode.Create(0);
  dummyHead.Next := head;

  cur := dummyHead;
  while cur.Next <> nil do
  begin
    if cur.Next.Val = val then
    begin
      del := cur.Next;
      cur.Next := del.Next;
      FreeAndNil(del);
    end
    else
      cur := cur.Next
  end;

  Result := dummyHead.Next;
  dummyHead.Free;
end;

end.
