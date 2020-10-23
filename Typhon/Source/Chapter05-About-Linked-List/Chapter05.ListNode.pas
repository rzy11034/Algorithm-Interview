unit Chapter05.ListNode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.Utils.UString;

type
  TListNode = class
  public
    Val: integer;
    Next: TListNode;

    constructor Create(x: integer);
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function FindNdoe(v: integer): TListNode;
    function ToString: UString; reintroduce;
    procedure CLearAndFree;
  end;

implementation

{ TListNode }

constructor TListNode.Create(x: integer);
begin
  Val := x;
  Next := nil;
end;

constructor TListNode.Create(arr: TArr_int);
var
  cur: TListNode;
  i: integer;
begin
  Assert(arr <> nil);

  Self.Val := arr[0];

  cur := self;
  for i := 1 to High(arr) do
  begin
    cur.Next := TListNode.Create(arr[i]);
    cur := cur.Next;
  end;
end;

procedure TListNode.CLearAndFree;
var
  cur, del: TListNode;
begin
  cur := Self;
  while cur.Next <> nil do
  begin
    del := cur.Next;
    cur.Next := del.Next;
    FreeAndNil(del);
  end;

  Self.Free;
end;

destructor TListNode.Destroy;
begin
  inherited Destroy;
end;

function TListNode.FindNdoe(v: integer): TListNode;
var
  cur: TListNode;
begin
  if Self = nil then exit;
  if self.Val = v then Exit(self);

  cur := self.Next;
  while cur <> nil do
  begin
    if cur.Val = v then
      Break;

    cur := cur.Next;
  end;

  Result := cur;
end;

function TListNode.ToString: UString;
var
  sb: TStringBuilder;
  cur: TListNode;
begin
  Assert(Self <> nil);
  sb := TStringBuilder.Create;

  cur := Self;
  while cur <> nil do
  begin
    sb.Append(cur.Val.ToString);

    if cur.Next <> nil then
      sb.Append(' -> ')
    else
      sb.Append(' -> NULL');

    cur := cur.Next;
  end;

  Result := UString(sb.ToString);
  sb.Free;
end;

end.
