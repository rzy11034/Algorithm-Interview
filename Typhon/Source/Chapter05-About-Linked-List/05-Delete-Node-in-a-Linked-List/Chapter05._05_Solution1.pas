unit Chapter05._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Chapter05.ListNode,
  DeepStar.Utils;

// 237. Delete Node in a Linked List
// https://leetcode.com/problems/delete-node-in-a-linked-list/description/
// 时间复杂度: O(1)
// 空间复杂度: O(1)
type
  TSolution = class(TObject)
  public
    procedure deleteNode(node: TListNode);
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  head, del: TListNode;
begin
  a := [1, 2, 3, 4];
  head := TListNode.Create(a);

  with TSolution.Create do
  begin
    del := head.FindNdoe(2);
    deleteNode(del);
    WriteLn(head.ToString);
    Free;
  end;

  head.CLearAndFree;
end;

{ TSolution }

procedure TSolution.deleteNode(node: TListNode);
var
  cur, del: TListNode;
begin
  if (node = nil) or (node.Next = nil) then Exit;

  cur := node;
  del := cur.Next;
  cur.Val := del.Val;
  cur.Next := del.Next;

  FreeAndNil(del);
end;

end.
