unit Chapter07._01_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  AI.TreeNode;

// 104. Maximum Depth of Binary Tree
// https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
// 时间复杂度: O(n), n是树中的节点个数
// 空间复杂度: O(h), h是树的高度
type
  TSolution = class(TObject)
  public
    function maxDepth(root: TTreeNode): integer;
  end;

procedure Main;

implementation

procedure Main;
begin

end;

{ TSolution }

function TSolution.maxDepth(root: TTreeNode): integer;
begin
  if root = nil then Exit(0);

  Result := Max(maxDepth(root.Left), maxDepth(root.Right)) + 1;
end;

end.
