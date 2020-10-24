unit Chapter06._02_Solution3;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode,
  DeepStar.Utils;

// 145. Binary Tree Postorder Traversal
// https://leetcode.com/problems/binary-tree-postorder-traversal/description/
// 二叉树的后序遍历
// 时间复杂度: O(n), n为树的节点个数
// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  public
    function postorderTraversal(root: TTreeNode): TList_int;
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
    l := postorderTraversal(t);
    TArrayUtils_int.Print(l.ToArray);
    Free;
  end;

  l.Free;
  t.ClearAndFree;
end;

{ TSolution }

function TSolution.postorderTraversal(root: TTreeNode): TList_int;
var
  list: TList_int;

  procedure __post__(node: TTreeNode);
  begin
    if node = nil then Exit;

    __post__(node.Left);
    __post__(node.Right);
    list.AddLast(node.Val);
  end;

begin
  list := TList_int.Create;
  __post__(root);
  Result := list;
end;

end.
