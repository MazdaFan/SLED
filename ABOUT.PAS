unit ABOUT;
{
* FILENAME: About.pas
* Date Created: 12/29/2012
* Created By: Jamie Tomlinson (JRT)
*
* Purpose:  To provide information about the program and how to contact me (JRT)
*
* Uses: None
*
* Procedures/Functions:  None - Form is modal
*
* Variables: None
*
* Changes:
*     1/5/2013 - Added program information to form.
}
interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.

