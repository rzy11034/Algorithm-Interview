unit Chapter06._02_Solution2;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode,
  DeepStar.Utils;

// 94. Binary Tree Inorder Traversal
// https://leetcode.com/problems/binary-tree-inorder-traversal/solution/
// 二叉树的中序遍历
// 时间复杂度: O(n), n为树的节点个数
// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function inorderTraversal(root: TTreeNode): TList_int;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  l: TList_int;
  t: TTreeNode;
begin
  a := [1, 3, 2];
  t := TTreeNode.Create(a);

  with TSolution.Create do
  begin
    l := inorderTraversal(t);
    WriteLn(l.ToString);
    Free;
  end;

  l.Free;
  t.ClearAndFree;
end;

{ TSolution }

function TSolution.inorderTraversal(root: TTreeNode): TList_int;
var
  list: TList_int;

  procedure __in__(node: TTreeNode);
  begin
    if node = nil then Exit;

    __in__(node.Left);
    list.AddLast(node.Val);
    __in__(node.Right);
  end;

begin
  list := TList_int.Create;
  __in__(root);
  Result := list;
end;

end.
