unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.InertialMovement, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    procedure FormShow(Sender: TObject);
    procedure VertScrollBox1ViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
  private
    { Private declarations }
  public
   procedure SoftScroll(AScroll: TFmxObject);
  end;

var
  Form1: TForm1;
implementation

{$R *.fmx}

procedure TForm1.SoftScroll(AScroll: TFmxObject);
var
  AniCalculations: TAniCalculations;
begin
  AniCalculations := TAniCalculations.Create(nil);
  try
    AniCalculations.Animation := True;
    AniCalculations.BoundsAnimation := True;
    AniCalculations.Averaging := True;
    AniCalculations.AutoShowing := True;
    AniCalculations.DecelerationRate := 1.3;
    AniCalculations.Elasticity := 100;

    if AScroll is TVertScrollBox then
    begin
      TVertScrollBox(AScroll).AniCalculations.Assign(AniCalculations);
      TVertScrollBox(AScroll).AniCalculations.TouchTracking := [ttVertical];
    end
    else if AScroll is THorzScrollBox then
    begin
      THorzScrollBox(AScroll).AniCalculations.Assign(AniCalculations);
      THorzScrollBox(AScroll).AniCalculations.TouchTracking := [ttHorizontal];
    end;
  finally
    AniCalculations.DisposeOf;
  end;
end;

procedure TForm1.VertScrollBox1ViewportPositionChange(Sender: TObject;
  const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
 { if Trunc(NewViewportPosition.Y) = (VertScrollBox1.ContentBounds.Height - VertScrollBox1.ClientHeight) then
  begin
    ShowMessage('O scroll chegou ao fim.');
  end;  }
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SoftScroll(VertScrollBox1);
end;

end.
