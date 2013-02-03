unit SETUP;
{
* FILENAME: Setup.pas
* Date Created: 12/29/2012
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:
*
* Uses:
*     Main.pas
*     Matrix.pas
*     Sequence.pas
*
* Procedures/Functions:
*    procedure bCancelClick(Sender: TObject);
*    procedure bOKClick(Sender: TObject);
*
* Variables:
*     ItemCount: Integer;
*     TotalChannels: Integer;    Total number of channels
*     StartChannel: Integer;     The starting channel of our lights
*     Universe: Integer;         The starting DMX universe
*
* Changes:
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TSetupForm = class(TForm)
    bCancel: TButton;
    bOK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    seUniverse: TSpinEdit;
    seChannel: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    seRows: TSpinEdit;
    seCols: TSpinEdit;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Label5: TLabel;
    procedure bCancelClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetupForm: TSetupForm;
  ItemCount: Integer;       //
  TotalChannels: Integer;   // Total number of channels
  StartChannel: Integer;    // The starting channel of our lights
  Universe: Integer;        // The starting DMX universe
  CustomTime: boolean;      // Are we setting a non standard time?

implementation

uses MAIN, Matrix, Sequence, Buffer, Playback;

{$R *.dfm}

procedure TSetupForm.bCancelClick(Sender: TObject);
begin
    Setup.SetupForm.Visible := False;
end;

procedure TSetupForm.bOKClick(Sender: TObject);
var
  Y: Integer;
  X: Integer;
begin
  Main.Cols := seCols.Value;
  Main.Rows := seRows.Value;
  Universe := seUniverse.Value;
  StartChannel := (((Universe - 1) * 512) + seChannel.Value) ;  // Our starting place in the world.
  TotalChannels := (StartChannel + ((Rows*Cols)*3));
  SetLength(ChannelArray, Rows, Cols);
  Matrix.FillChannels;
  SetLength(SwapMatrix, Rows, Cols);
  Matrix.FillChannels;
  if RadioGroup2.Buttons[0].Checked then IsLRL := False else IsLRL := True;
  Matrix.FillLightMatrix;
  Buffer.CreateBuffer;
  Sequence.CreateTrack;
  SetupForm.Visible := False;
  if CustomTime then TimeHack := Trunc((StrToFloat(Edit1.Text)*100));
  MainForm.Timer1.Interval := TimeHack * 10;
  fmPlayBack.ClientWidth := Cols * 10;
  fmPlayBack.ClientHeight := Rows * 10;
  fmPlayBack.Canvas.FloodFill(10,10,clBlack, fsSurface );
  fmPlayBack.Repaint;
end;

procedure TSetupForm.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex  of
    0: TimeHack := 100;
    1: TimeHack := 50;
    2: TimeHack := 25;
    3: Timehack := 10;
    4: TimeHack := 5;
    5: begin Label5.Enabled := True; Edit1.Enabled := True; CustomTime := True; end;


  end;

end;

end.
