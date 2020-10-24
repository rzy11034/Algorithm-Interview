unit Chapter05._06_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.ListNode;

// 19. Remove Nth Node From End of List
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
//
// 使用双指针, 对链表只遍历了一遍
// 时间复杂度: O(n)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    function removeNthFromEnd(head: TListNode; n: integer): TListNode;
  end;

procedure Main;

implementation

procedure Main;
var
  head: TListNode;
begin
  head := TListNode.Create([1, 2, 3, 4, 5]);

  with TSolution.Create do
  begin
    head := removeNthFromEnd(head, 1);
    WriteLn(head.ToString);
    Free;
  end;

  head.CLearAndFree;
end;

{ TSolution }

function TSolution.removeNthFromEnd(head: TListNode; n: integer): TListNode;
var
  l, r, dummyHead, del: TListNode;
  i: integer;
begin
  dummyHead := TListNode.Create(0);
  dummyHead.Next := head;
  l := dummyHead;
  r := dummyHead;

  for i := 0 to n do
    r := r.Next;

  while r <> nil do
  begin
    l := l.Next;
    r := r.Next;
  end;

  del := l.Next;
  l.Next := del.Next;
  FreeAndNil(del);

  Result := dummyHead.Next;
  dummyHead.Free;
end;

end.
