unit Chapter07._05_Solution1;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  AI.TreeNode;

/// 437. Path Sum III
/// https://leetcode.com/problems/path-sum-iii/description/
/// 时间复杂度: O(n), n为树的节点个数
/// 空间复杂度: O(h), h为树的高度
type
  TSolution = class(TObject)
  private
    // 在以node为根节点的二叉树中,寻找包含node的路径,和为num
    // 返回这样的路径个数
    function __findPath(node: TTreeNode; num: integer): integer;

  public
    // 在以root为根节点的二叉树中,寻找和为sum的路径,返回这样的路径个数
    function pathSum(root: TTreeNode; sum: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
begin

end;

{ TSolution }

function TSolution.pathSum(root: TTreeNode; sum: integer): integer;
begin
  if root = nil then
    Exit(0);

  Result := __findPath(root, sum)
    + __findPath(root.Left, sum)
    + __findPath(root.Right, sum);
end;

function TSolution.__findPath(node: TTreeNode; num: integer): integer;
var
  res: integer;
begin
  if node = nil then
    Exit(0);

  res := 0;
  if node.Val = num then
    res += 1;

  res += __findPath(node.Left, num - node.Val);
  res += __findPath(node.Right, num - node.Val);

  Result := res;
end;

end.
