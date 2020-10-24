unit Chapter06._02_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  AI.TreeNode;

// 144. Binary Tree Preorder Traversal
// https://leetcode.com/problems/binary-tree-preorder-traversal/description/
// 二叉树的前序遍历
// 时间复杂度: O(n), n为树的节点个数
// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function preorderTraversal(root: TTreeNode): TList_int;
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
  TArrayUtils_int.Print(a);
  t := TTreeNode.Create(a);

  with TSolution.Create do
  begin
    l := preorderTraversal(t);
    TArrayUtils_int.Print(l.ToArray);
    Free;
  end;

  l.Free;
  t.ClearAndFree;
end;

{ TSolution }

function TSolution.preorderTraversal(root: TTreeNode): TList_int;
var
  list: TList_int;

  procedure __pre__(node: TTreeNode);
  begin
    if node = nil then Exit;

    list.AddLast(node.Val);
    __pre__(node.Left);
    __pre__(node.Right);
  end;

begin
  list := TList_int.Create;
  __pre__(root);
  Result := list;
end;

end.
