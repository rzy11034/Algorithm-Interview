unit AI.TreeNode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

type
  TTreeNode = class(TObject)
  private
    procedure __clear;

  public
    Val: integer;
    Left: TTreeNode;
    Right: TTreeNode;

    constructor Create(newVal: integer = 0; newLeft: TTreeNode = nil; newRight: TTreeNode = nil);
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    procedure Add(n: integer);
    procedure ClearAndFree;
  end;

implementation

{ TTreeNode }

constructor TTreeNode.Create(newVal: integer; newLeft: TTreeNode; newRight: TTreeNode);
begin
  Val := newVal;
  Left := newLeft;
  Right := newRight;
end;

constructor TTreeNode.Create(arr: TArr_int);
var
  i: integer;
begin
  Create(arr[0]);

  for i := 1 to High(arr) do
  begin
    Add(arr[i]);
  end;
end;

procedure TTreeNode.Add(n: integer);
  function __add__(node: TTreeNode): TTreeNode;
  begin
    if node = nil then
    begin
      Result := TTreeNode.Create(n);
      Exit;
    end;

    if n < node.Val then
      node.Left := __add__(node.Left)
    else if n > node.Val then
      node.Right := __add__(node.Right)
    else
      node := node;

    Result := node;
  end;

begin
  Self := __add__(self);
end;

procedure TTreeNode.ClearAndFree;
begin
  __clear;
  self.Free;
end;

destructor TTreeNode.Destroy;
begin
  inherited Destroy;
end;

procedure TTreeNode.__clear;
  procedure __clear__(node: TTreeNode);
  begin
    if node = nil then Exit;

    __clear__(node.Left);
    __clear__(node.Right);
    FreeAndNil(node);
  end;

begin
  __clear__(Self.Left);
  __clear__(Self.Right);
end;

end.
