unit f_sudoku;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,
  ExtCtrls, Windows,  LCLType,  LazStringUtils, Math,Printers,

  f_alternative_grid;

type

  { TForm_Sudoku_Level }

  TForm_Sudoku_Level = class(TForm)
    But_Pause: TButton;
    GroBox_Drag_Wrong: TGroupBox;
    Label1: TLabel;
    Lab_TimerLine1: TLabel;
    Lab_TimerLine2: TLabel;
    Lab_TimerHasStarted: TLabel;
    Lab_DragWrongLine1: TLabel;
    Lab_DragWrongLine2: TLabel;
    Lab_DragWrongLine3: TLabel;
    Lab_DragWrongLine4: TLabel;

    MainMenu_Level                  : TMainMenu;
    MenuItem_SaveOrLoad: TMenuItem;
    MenuItem_DisplayColour: TMenuItem;
    MenuItem_PaleRed: TMenuItem;
    MenuItem_White: TMenuItem;
    MenuItem_Cell: TMenuItem;
    MenuItem_A_to_I: TMenuItem;
      MenuItem_Settings             : TMenuItem;

      MenuItem_File                 : TMenuItem;
        MenuItem_Save               : TMenuItem;
        MenuItem_Load               : TMenuItem;

      MenuItem_Level                : TMenuItem;
        MenuItem_Beginner           : TMenuItem;
        MenuItem_Medium             : TMenuItem;
        MenuItem_Advanced             : TMenuItem;

      MenuItem_Select              : TMenuItem;
        MenuItem_1_to_9             : TMenuItem;
        MenuItem_Char             : TMenuItem;
        MenuItem_New_Grid           : TMenuItem;
        MenuItem_Select_Separator_1 : TMenuItem;
        MenuItem_Colours            : TMenuItem;

      MenuItem_Solution             : TMenuItem;
        MenuItem_Show_Solution      : TMenuItem;
        MenuItem_Hide_Solution      : TMenuItem;



      GroBox_SudokuPuzzle           : TGroupBox;
        Lab_DifficultyRating        : TLabel;
        StrGri_SudokuPuzzle         : TStringGrid;

      GroBox_Timer_Puzzle           : TGroupBox;
        GroBox_Timer                : TGroupBox;
          Shape_1st_Separator       : TShape;
            Lab_Minute              : TLabel;
            Lab_Minute_Separator    : TLabel;
            Lab_TimeMinute         : TLabel;
          Shape_2nd_Separator       : TShape;
            Lab_Second              : TLabel;
            Lab_Second_Separator    : TLabel;
            Lab_TimeSecond          : TLabel;
          Shape_3rd_Separator       : TShape;
          Shape_4th_Separator       : TShape;

         GroBox_Puzzle              : TGroupBox;
           ComBox_BMA               : TComboBox;
           But_New_Puzzle           : TButton;

         GroBox_SelectCharacter     : TGroupBox;
           StrGri_SelectCharacter   : TStringGrid;

      GroBox_SudokuGrid             : TGroupBox;
        StrGri_SudokuGrid           : TStringGrid;

      GroBox_NineCharacters         : TGroupBox;
        StrGri_NineCharacters       : TStringGrid;

      GroBox_SudokuSolution         : TGroupBox;
        StrGri_SudokuSolution       : TStringGrid;

      GroBox_Ratings                : TGroupBox;
         StrGri_Ratings             : TStringGrid;
            Memo1                   : TMemo;
            Memo_Ratings            : TMemo;

      SaveDial_SudokuGrids          : TSaveDialog;
      OpenDial_SudokuGrids          : TOpenDialog;
      Time_Second: TTimer;
      Time_Minute: TTimer;

      { ---------------------------------------------}

        procedure But_PauseClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);


        procedure MenuItem_CharClick(Sender: TObject);
        procedure MenuItem_PaleRedClick(Sender: TObject);





      { --------------------------------------------- }
      { -------------------Start--------------------- }
      { ----------------- Main Menu ----------------- }
      { --------------------------------------------- }
      { ---------------- File ( Start ) ------------- }
      {                                               }
        procedure MenuItem_SaveClick(Sender: TObject);
        procedure MenuItem_LoadClick(Sender: TObject);
      {                                               }
      { ----------------- File ( End ) -------------- }
      {                                               }
      { ---------------- Level ( Start ) ---------------- }
      {                                                   }
        procedure MenuItem_BeginnerClick(Sender: TObject);
        procedure MenuItem_MediumClick  (Sender: TObject);
        procedure MenuItem_AdvancedClick(Sender: TObject);
      {                                                   }
      { ---------------- Level ( End ) ------------------ }
      {                                                   }
      { ---------------- Select ( Start ) --------------- }
      {                                                   }
        procedure MenuItem_1_to_9Click  (Sender: TObject);
        procedure MenuItem_A_To_IClick  (Sender: TObject);
        procedure MenuItem_New_GridClick(Sender: TObject);
        procedure MenuItem_ColoursClick (Sender: TObject);


      {                                                   }
      { ---------------- Select ( End ) ----------------- }
      {                                                   }
      { ---------------- Solution ( Start ) ------------------ }
      {                                                        }
        procedure MenuItem_SolutionClick(Sender: TObject);
        procedure MenuItem_Show_SolutionClick(Sender: TObject);
        procedure MenuItem_Hide_SolutionClick(Sender: TObject);
      {                                                        }
      { ---------------- Solution ( End ) -------------------- }
      {                                                        }
      { ---------------- Close ( Start ) ------------- }
      {                                                }
        procedure MenuItem_CloseClick(Sender: TObject);
        procedure MenuItem_WhiteClick(Sender: TObject);

      {                                                }
      { ---------------- Close ( End ) --------------- }
      {                                                }
      { --------------------End----------------------- }
      { ----------------- Main Menu ------------------ }
      { ---------------------------------------------- }

      { ----------------------------------------------------------------- }
      { ------------ Sudoku Puzzle ( Start )----------------------------- }
      { ----------------------------------------------------------------- }
      {                                              }
        procedure StrGri_SudokuPuzzleDragDrop(Sender, Source: TObject; X,
                  Y: Integer);

        procedure StrGri_SudokuPuzzleDragOver(Sender, Source: TObject; X,
                  Y: Integer; State: TDragState; var Accept: Boolean);

        procedure StrGri_SudokuPuzzleDrawCell(Sender: TObject; aCol,
                  aRow: Integer; aRect: TRect; aState: TGridDrawState);

        function FInt_FindSameNumbers (PStrGri_AnyGrid : TStringGrid;
                                        PStr_ColOrRow   : String ) : Integer;

      { ----------------------------------------------------------------- }
      { ------------ Sudoku Puzzle ( End )------------------------------- }
      { ----------------------------------------------------------------- }
      {                                                                   }

      { ----------------------------------------------}
      { ------------------- Puzzle ( Start )----------}
      { ----------------------------------------------}
      {                                               }
        procedure But_New_PuzzleClick(Sender: TObject);
        procedure ComBox_BMAChange   (Sender: TObject);

      { ----------------------------------------------}
      { ------------ ------ Puzzle ( End )------------}
      { ----------------------------------------------}

      { ----------------------------------------------------------------- }
      { ------------ Select Character ( Start ) ------------------------- }
      { ----------------------------------------------------------------- }
      {                                              }
        procedure StrGri_SelectCharacterDragOver(Sender, Source: TObject; X,
                  Y: Integer; State: TDragState; var Accept: Boolean);

        procedure StrGri_SelectCharacterDrawCell(Sender: TObject; aCol,
                  aRow: Integer; aRect: TRect; aState: TGridDrawState);

        procedure StrGri_SelectCharacterMouseDown(Sender: TObject;
                  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

        procedure Time_MinuteTimer(Sender: TObject);

        procedure Time_SecondTimer(Sender: TObject);

      { ---------------------------------------------------------------- }
      { ------------ Select Character ( End ) -------------------------- }
      { -----------------------------------------------------------------}
      {                                                                  }



  private
    { --------- File ( Start )-------- }
    {                                  }

      function FStr_Grids     : String;
      function FStr_SaveComplete : string;
      function FStr_SaveGrids : string;
      function FStr_SaveTimer : string;
      function FStr_SavePath   ( PStr_GridPath , PStr_NewPath : String ) : String;
      function FStr_LoadFileName( PStr_GridPath : String ) : String;
      procedure P_SaveFileName ( PStr_GridPath , PStr_WriteToFile: String  );

    {                                  }
    { --------- File ( End )---------- }

    { --------- Level ( Start )----------------------- }
    {                                                  }
      procedure P_DisplayPuzzle ( PByt_Rating : Byte );
    {                                                  }
    { --------- Level ( End )------------------------- }

    { ---------------- Timer ( Start ) --------------- }
    {                                                  }
    //  procedure But_Pause_TimeClick (Sender: TObject);
    {                                                  }
    { ---------------- Timer ( End ) ------------------}




      procedure P_RandomizeGrid    ( PCha_Grid       : Char;
                                     PStrGri_Random  : TStringGrid );



      procedure P_DifficultyRating ( PByt_Rating : Byte );

      procedure P_EmptyGrid        ( PStrGri_EmptyGrid : TStringGrid );

      procedure P_CheckPuzzleGrid ( PInt_DestCol,PInt_DestRow : integer);

      procedure P_CellColourAndFont ( PByt_Col  : Byte;
                                      PByt_Row  : Byte;
                                      PRec_Rect : TRect );

      procedure P_Ratings;

      procedure P_RandomRatings;

      procedure P_ReadFromTextFile ( PStr_FileName : string;
                                      var PStr_FirstAndLastCharacters: String );




      procedure P_WriteToTextFile ( PStr_FileName : string;
                                          PStr_FirstAndLastCharacters: String );



    { procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: string);

     procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: string); }

     procedure P_Read  ( PStr_FileName : string; var PStr_Read : String );

     procedure P_Write ( PStr_FileName : string; PStr_Write : String );
  public

const
   G_ARRAY_COLOR_CELLS : array  [1..9] of TColor =
                                ( clBlack, clMaroon, clGreen ,
                                  clOlive, clNavy  , clPurple,
                                  clTeal , clGray  , clSilver );

  G_GRID =1; G_WRONG_POSITION = 2; G_TIMER = 3;

   G_BEGINNER = 1; G_MEDIUM = 2; G_ADVANCED = 3;
   G_1_TO_9   = 1; G_A_TO_I = 2; G_NEW_GRID = 3; G_COLOUR = 4;

   G_NUMBER_GRID  = '1'; G_CHARACTER_GRID = '2';
   G_PICTURE_GRID = '3'; G_COLOUR_GRID    = '4';

   G_EASY_PUZZLE = 1; G_MEDIUM_PUZZLE = 2;
   G_HARD_PUZZLE = 3; G_EXPERT_PUZZLE = 4;

   G_BEGINNER_RATING = 1; G_MEDIUM_RATING = 2; G_ADVANCED_RATING = 3;

   G_COMPLETED_GRID = 81;

   G_RANDOM_RATINGS_PATH_TO_EASY             = '\Ratings\1_Easy\Easy.txt';
   G_RANDOM_RATINGS_PATH_TO_MEDIUM           = '\Ratings\2_Medium\Medium.txt';
   G_RANDOM_RATINGS_PATH_TO_HARD             = '\Ratings\3_Hard\Hard.txt';
   G_RANDOM_RATINGS_PATH_TO_EXPERT           = '\Ratings\4_Expert\Expert.txt';

   G_SAVE_PATH_TO_EASY_COMPLETE              = '\Save\1_Easy\Complete\';
   G_SAVE_PATH_TO_MEDIUM_COMPLETE            = '\Save\2_Medium\Complete\';
   G_SAVE_PATH_TO_HARD_COMPLETE              = '\Save\3_Hard\Complete\';
   G_SAVE_PATH_TO_EXPERT_COMPLETE            = '\Save\4_Expert\Complete\';

   G_SAVE_PATH_TO_EASY_GRIDS                 = '\Save\1_Easy\Grids\';
   G_SAVE_PATH_TO_MEDIUM_GRIDS               = '\Save\2_Medium\Grids\';
   G_SAVE_PATH_TO_HARD_GRIDS                 = '\Save\3_Hard\Grids\';
   G_SAVE_PATH_TO_EXPERT_GRIDS               = '\Save\4_Expert\Grids\';

   G_SAVE_PATH_TO_EASY_TIMER                 = '\Save\1_Easy\Timer\';
   G_SAVE_PATH_TO_MEDIUM_TIMER               = '\Save\2_Medium\Timer\';
   G_SAVE_PATH_TO_HARD_TIMER                 = '\Save\3_Hard\Timer\';
   G_SAVE_PATH_TO_EXPERT_TIMER               = '\Save\4_Expert\Timer\';


  end;

var
  Form_Sudoku_Level: TForm_Sudoku_Level;

  GBoo_WrongPosition       , GBoo_ShowTimer ,

  GBoo_Solution            , GBoo_Timer     ,
  GBoo_Show                , GBoo_Hide      ,
  GBoo_TimerStarted        , GBoo_OpenWrong ,
  GBoo_DropRow             : Boolean;

  GByt_SelectRating        ,
  GByt_RatingsAcross       , GByt_RatingsDown    ,
  GByt_Puzzle              ,
  GByt_Across              , GByt_Down           ,
  GByt_FirstTimeRound      , GByt_ButtonSelected ,
  GByt_Characters_In_Grid  : Byte;

  GCha_FirstCharacter      , GCha_Grid : Char;

  GInt_DragPosCol , GInt_DragPosRow ,
  GInt_DropPosCol , GInt_DropPosRow ,


  GInt_ColourCol  , GInt_ColourRow  ,
  GInt_Min        , GInt_Sec        ,
  GInt_FormHeight , GInt_FormWidth  :  integer;

  GStr_RatingsDir ,  GStr_RandomRatings , GStr_SaveGridsDir ,
  GStr_SaveCompleteDir,GStr_SaveTimerDir, GStr_FilenameOnly ,
  GStr_FirstCharacter         , GStr_LastCharacter   ,
  GStr_FirstAndLastCharacters , GStr_RandomLine      ,

  GStr_NineCharacters         , GStr_Settings        ,

  GStr_RedNumber              , GStr_DragChars       , GStr_DropChars ,

  GStr_TimerPathAndFilename   , GStr_Timer           , GStr_Read      ,
  GStr_GridFileName           , GStr_NumCharOrColour , GStr_CompletePathAndFileName , GStr_PathAndFileName: string;

  GRect_DropRect : TRect;

  GState_DropState : TGridDrawState;

implementation

{$R *.lfm}

{ TForm_Sudoku_Level }

procedure TForm_Sudoku_Level.FormActivate(Sender: TObject);
begin
  GBoo_DropRow := False;
  GroBox_Drag_Wrong.Caption:='Drag Instructions';

  Lab_DragWrongLine1.left := 23;
  Lab_DragWrongLine1.Caption:='left click, hold and drag';

  Lab_DragWrongLine2.left := 32;
  Lab_DragWrongLine2.Caption:='selected number to';

  Lab_DragWrongLine3.left := 24;
  Lab_DragWrongLine3.Caption:='empty cell in 9x9 grid';

  Lab_DragWrongLine4.left := 64;
  Lab_DragWrongLine4.Caption:='above';

  P_Read ( 'Cell.txt', GStr_Read );

  if GStr_Read = '1' // True
    then
      MenuItem_PaleRedClick(Sender)
    else
      MenuItem_WhiteClick(Sender);


  P_Read ( 'Solution.txt', GStr_Read );

  if GStr_Read = '1' // True
    then
      MenuItem_Show_SolutionClick(Sender)
    else
      MenuItem_Hide_SolutionClick(Sender);

  GBoo_Show := True; GBoo_Hide := False;

  MenuItem_Settings.Caption := 'Settings :- ' + MenuItem_1_to_9.Caption;
  P_DisplayPuzzle    ( G_BEGINNER_RATING );

  GByt_Puzzle := G_EASY_PUZZLE;
  GByt_SelectRating := GByt_Puzzle;
  ComBox_BMA.ItemIndex:= GByt_Puzzle-1;

  GCha_Grid := G_NUMBER_GRID;
  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

  if GByt_FirstTimeRound = 0
    then
      begin
        GCha_Grid := G_CHARACTER_GRID;
        P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

        GCha_Grid := G_NUMBER_GRID;
        P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

        P_Ratings;

      end
    else
end; // FormActivate //

procedure TForm_Sudoku_Level.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TForm_Sudoku_Level.But_PauseClick(Sender: TObject);
begin
    //Stop Timer //
   Time_Second .Enabled := False;
   Time_Minute .Enabled := False;

   Lab_TimerLine1.Visible:=False;
   Lab_TimerLine2.Visible:=False;

   GroBox_Puzzle.Top := 64;

    MenuItem_File  .Enabled:=true;
end;

{ --------------------------------------------------------------}
{ ----------------- Main Menu --------------------------------- }
{ --------------------------------------------------------------}
{ ---------------- File ( Start ) ----------------------------- }
{                                                               }
 procedure TForm_Sudoku_Level.MenuItem_SaveClick(Sender: TObject);
 var
 //  LInt_Pos : integer;
     LStr_PathAndFileName , LStr_WriteToFile  : String;
//   LStr_FileName, LStr_CompletePathAndFileName, LStr_WriteToFile    : String;
 begin
   MenuItem_Save.Checked:=True;
   MenuItem_Load.Checked:=False;

   MenuItem_SaveOrLoad.Caption:='Save';
   MenuItem_SaveOrLoad.Enabled:=False;

   with SaveDial_SudokuGrids do
     begin
       InitialDir:= FStr_SaveGrids;

       Filter := 'Text files (*.txt)|*.txt';

       if Execute // Show Save Dialog //
         then
           begin

        // Save Sudoku Puzzle //
            LStr_PathAndFileName := Filename;
            StrGri_SudokuPuzzle.SaveToFile( LStr_PathAndFileName );

          // ------------------------------------- ---//

         // Save Sudoku Grid //
            LStr_PathAndFileName := FStr_SavePath ( FileName ,'Complete\');

            StrGri_SudokuGrid.SaveToFile( LStr_PathAndFileName );
         // -----------------------------------------------------------//

         // Stop Timer
             if GBoo_Timer
               then
                 begin
                   Time_Second    .Enabled :=False;
                   Time_Minute    .Enabled  :=False;
                 end
               else
          // ------------------------------------//

          // Save Timer //
             LStr_WriteToFile := 'Min :- ' + Lab_TimeMinute.Caption +
                           ' ' + 'Sec :- ' + Lab_TimeSecond.Caption;

             P_SaveFileName( FStr_SavePath ( FileName ,'Timer\') ,LStr_WriteToFile  );
          // ---------------------------------------------------------------------//

          // Save Wrong Position //
             LStr_WriteToFile := 'Col :- ' + inttostr(GInt_DropPosCol) +
                           ' ' + 'Row :- ' + inttostr(GInt_DropPosRow) +
                           ' ' + 'Char :- ' + StrGri_SelectCharacter.Cells[GInt_DragPosCol,GInt_DragPosRow] ;

              P_SaveFileName( FStr_SavePath ( FileName ,'Wrong_Position\') ,LStr_WriteToFile  );
           // ---------------------------------------------------------------------//

           end; // if Execute // Show Save Dialog //

          MenuItem_SaveOrLoad.Caption:='';



          GroBox_Drag_Wrong.Caption:='Drag Instructions';

          Lab_DragWrongLine1.left := 23;
          Lab_DragWrongLine1.Caption:='left click, hold and drag';

          Lab_DragWrongLine2.left := 32;
          Lab_DragWrongLine2.Caption:='selected number to';

          Lab_DragWrongLine3.left := 24;
          Lab_DragWrongLine3.Caption:='empty cell in 9x9 grid';

          Lab_DragWrongLine4.left := 64;
          Lab_DragWrongLine4.Caption:='above';





       end; // with SaveDial_SudokuGrids do //

   MenuItem_Save.Checked:=False;
   MenuItem_Load.Checked:=False;

   MenuItem_SaveOrLoad.Caption:='';
   MenuItem_SaveOrLoad.Enabled:=False;
 end; // MenuItem_SaveClick //

function TForm_Sudoku_Level.FStr_SavePath ( PStr_GridPath , PStr_NewPath : String ) : String;
var
  LInt_GridPos  : Integer;
  LStr_FileName , LStr_PathAndFileName : String;
begin
   LStr_FileName := ExtractFileName  ( PStr_GridPath );

  if PStr_NewPath = 'Wrong'
    then
      GBoo_OpenWrong := True
    else
      GBoo_OpenWrong := False;

  LInt_GridPos := AnsiPos('Grids',PStr_GridPath);LInt_GridPos  :=LInt_GridPos  - 1;

  LStr_PathAndFileName := Copy(PStr_GridPath,1,LInt_GridPos ) + PStr_NewPath
                                                              + FStr_Grids
                                                              + LStr_FileName;

  Result := LStr_PathAndFileName;
end; // FStr_SavePath //

 procedure TForm_Sudoku_Level.P_SaveFileName( PStr_GridPath , PStr_WriteToFile: String  );
 var
   LTexFil_FileName : TextFile;
 begin

   AssignFile(LTexFil_FileName,PStr_GridPath );

   ReWrite (LTexFil_FileName);

   WriteLn (LTexFil_FileName,  PStr_WriteToFile );
   CloseFile (LTexFil_FileName);

 end; // P_SaveFileName //

function  TForm_Sudoku_Level.FStr_Grids : String;
begin
  if GCha_Grid = G_NUMBER_GRID
     then
        Result := 'Number\'
     else
       if GCha_Grid = G_CHARACTER_GRID
         then
           Result :=  'Character\'
         else
           if GCha_Grid = G_COLOUR_GRID
             then
               Result := 'Colour\';
end; // FStr_Grids //


procedure TForm_Sudoku_Level.MenuItem_LoadClick(Sender: TObject);
const
  clPaleRed =   TColor($CCCCFF);

var
 LStr_PathAndFileName ,
 LStr_Timer           , LStr_TimerMin , LStr_TimerSec ,
 LStr_Wrong           , LStr_WrongCol , LStr_WrongRow , LStr_WrongChar : String;

begin
 //  LStr_WrongPosition := '';
  MenuItem_Load.Checked:=False;
  MenuItem_Save.Checked:=False;

   MenuItem_SaveOrLoad.Caption:='Load';
   MenuItem_SaveOrLoad.Enabled:=False;

   with OpenDial_SudokuGrids do
     begin
       Options := Options + [ofPathMustExist,ofFileMustExist];

       InitialDir :=FStr_SaveGrids;

        Filter := 'Text files (*.txt)|*.txt';

        if Execute // Show Open Dialog //
          then
            begin

              P_EmptyGrid        ( StrGri_SudokuPuzzle );

           // Load Sudoku Puzzle //
              LStr_PathAndFileName := Filename;
              StrGri_SudokuPuzzle.LoadFromFile(LStr_PathAndFileName);
           // ---------------------------------------- //

           // Load Sudoku Grid //
              LStr_PathAndFileName := FStr_SavePath ( Filename  ,'Complete\');
              StrGri_SudokuGrid.LoadFromFile(LStr_PathAndFileName );
           // ------------------------------------------------------------ //

           // Load Timer //
              LStr_Timer := FStr_LoadFileName(FStr_SavePath ( FileName ,'Timer\'));

              LStr_TimerMin := LStr_Timer[8] + LStr_Timer[9];
              LStr_TimerSec := LStr_Timer[18]+ LStr_Timer[19];

              Lab_TimeMinute.Caption:=LStr_TimerMin;
              Lab_TimeSecond.Caption:=LStr_TimerSec;

              GInt_Min := strtoqword(LStr_TimerMin);
              GInt_Sec := strtoqword(LStr_TimerSec);
           // ----------------------------------- //

           // Load Wrong Position //
              LStr_Wrong := FStr_LoadFileName( FStr_SavePath ( Filename  ,'Wrong_Position\'));

              LStr_WrongCol  := LStr_Wrong[8];
              LStr_WrongRow  := LStr_Wrong[17];
              LStr_WrongChar := LStr_Wrong[27];

              GInt_DropPosCol :=strtoqword(LStr_WrongCol);
              GInt_DropPosRow :=strtoqword(LStr_WrongRow);

              // Delete Wrong Charater //
              StrGri_SudokuPuzzle.Cells[GInt_DropPosCol,GInt_DropPosRow] := '';

             // GBoo_WrongPosition := True;
           // ---------------------------------------- //
            end; //  if Execute // Show Open Dialog //
     end; //  with OpenDial_SudokuGrids do  //

     MenuItem_Load.Checked:=False;
     MenuItem_Save.Checked:=False;

   MenuItem_SaveOrLoad.Caption:='';
   MenuItem_SaveOrLoad.Enabled:=False;
end; // MenuItem_File_Load //

function TForm_Sudoku_Level.FStr_LoadFileName( PStr_GridPath : String ) : String;
var
   LStr_Line        : String;
   LTexFil_FileName : TextFile;
 begin
   AssignFile(LTexFil_FileName,PStr_GridPath );

   Reset (LTexFil_FileName);
   while not eof (LTexFil_FileName) do
     begin
       readln(LTexFil_FileName,LStr_Line);
     end;

   result := LStr_Line;

   closefile (LTexFil_FileName);
 end; // FStr_LoadFileName //

function  TForm_Sudoku_Level.FStr_SaveComplete : string;
begin
  case GByt_SelectRating of

    1 : GStr_SaveCompleteDir := GetCurrentDir + G_SAVE_PATH_TO_EASY_COMPLETE   +  FStr_Grids;
    2 : GStr_SaveCompleteDir := GetCurrentDir + G_SAVE_PATH_TO_MEDIUM_COMPLETE +  FStr_Grids;
    3 : GStr_SaveCompleteDir := GetCurrentDir + G_SAVE_PATH_TO_HARD_COMPLETE   +  FStr_Grids;
    4 : GStr_SaveCompleteDir := GetCurrentDir + G_SAVE_PATH_TO_EXPERT_COMPLETE +  FStr_Grids;

  end; // case GByt_SelectRating //

  result := GStr_SaveGridsDir;

end; // FStr_SaveGrids //

function  TForm_Sudoku_Level.FStr_SaveGrids : string;
begin
  case GByt_SelectRating of

    1 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_EASY_GRIDS   +  FStr_Grids;
    2 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_MEDIUM_GRIDS +  FStr_Grids;
    3 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_HARD_GRIDS   +  FStr_Grids;
    4 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_EXPERT_GRIDS +  FStr_Grids;

  end; // case GByt_SelectRating //

  result := GStr_SaveGridsDir;

end; // FStr_SaveGrids //

function  TForm_Sudoku_Level.FStr_SaveTimer : string;
begin
  case GByt_SelectRating of

    1 : GStr_SaveTimerDir := GetCurrentDir + G_SAVE_PATH_TO_EASY_TIMER   +  FStr_Grids;
    2 : GStr_SaveTimerDir := GetCurrentDir + G_SAVE_PATH_TO_MEDIUM_TIMER +  FStr_Grids;
    3 : GStr_SaveTimerDir := GetCurrentDir + G_SAVE_PATH_TO_HARD_TIMER   +  FStr_Grids;
    4 : GStr_SaveTimerDir := GetCurrentDir + G_SAVE_PATH_TO_EXPERT_TIMER +  FStr_Grids;

  end; // case GByt_SelectRating //

  result := GStr_SaveTimerDir;

end; // FStr_SaveComplete //

{ ----------------- File ( End ) ----------------- }
{                                                  }
{ ---------------- Level ( Start ) --------------- }
{                                                  }
procedure TForm_Sudoku_Level.MenuItem_BeginnerClick(Sender: TObject);
begin

   P_DisplayPuzzle    ( G_BEGINNER_RATING );

   MenuItem_Beginner.Checked := True;
   MenuItem_Medium  .Checked := False;
   MenuItem_Advanced.Checked := False;

end; // MenuItem_BeginnerClick //

procedure TForm_Sudoku_Level.MenuItem_MediumClick(Sender: TObject);
begin

  P_DisplayPuzzle    ( G_MEDIUM_RATING );

  MenuItem_Beginner.Checked := False;
  MenuItem_Medium  .Checked := True;
  MenuItem_Advanced.Checked := False;

end; // MenuItem_MediumClick //

procedure TForm_Sudoku_Level.MenuItem_AdvancedClick(Sender: TObject);
begin

  P_DisplayPuzzle    ( G_ADVANCED_RATING );

  MenuItem_Beginner.Checked := False;
  MenuItem_Medium  .Checked := False;
  MenuItem_Advanced.Checked := True;

end; // MenuItem_AdvancedClick //
{                                                  }
{ ---------------- Level ( End ) ----------------- }
{                                                  }
{ ---------------- Select ( Start ) -------------- }
{                                                  }
procedure TForm_Sudoku_Level.MenuItem_1_to_9Click(Sender: TObject);
begin

   MenuItem_Settings.Caption:= 'Settings :- ' + MenuItem_1_To_9.Caption;

   MenuItem_1_To_9  .Checked := True;
   MenuItem_Char    .Checked := False;
   MenuItem_New_Grid.Checked := False;
   MenuItem_Colours .Checked := False;

   GCha_Grid := G_NUMBER_GRID;

   P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
   P_Ratings;
end; // MenuItem_1_to_9 //

procedure TForm_Sudoku_Level.MenuItem_A_To_IClick(Sender: TObject);
begin
  GStr_FirstAndLastCharacters := 'AI';

  P_WriteToTextFile ( 'FirstAndLastCharacters.txt',
                       GStr_FirstAndLastCharacters);

  MenuItem_Char.Caption := '( ' +
                         GStr_FirstAndLastCharacters[1] + ' - ' +
                         GStr_FirstAndLastCharacters[2] + ' )';

  MenuItem_CharClick(Sender);
end;

procedure TForm_Sudoku_Level.MenuItem_CharClick(Sender: TObject);
begin

  MenuItem_Settings.Caption:= 'Settings :- ' + MenuItem_Char.Caption;

  MenuItem_1_To_9  .Checked := False;
  MenuItem_Char    .Checked := True;
  MenuItem_New_Grid.Checked := False;
  MenuItem_Colours .Checked := False;

  GCha_FirstCharacter :=  MenuItem_Char.Caption[3];
  GCha_Grid :=G_CHARACTER_GRID;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;
end;

procedure TForm_Sudoku_Level.MenuItem_PaleRedClick(Sender: TObject);
begin
  MenuItem_PaleRed.Checked:=True;
  MenuItem_White.Checked:=False;

  MenuItem_DisplayColour.Caption:='PaleRed';

  P_Write ( 'Cell.txt', '1' );


end;









procedure TForm_Sudoku_Level.MenuItem_New_GridClick(Sender: TObject);
begin
  f_alternative_grid.Form_AlternativeGrid.Show;
end; // MenuItem_New_Grid //

procedure TForm_Sudoku_Level.MenuItem_ColoursClick(Sender: TObject);
begin
  MenuItem_Settings.Caption:= 'Settings :- ' + MenuItem_Colours.Caption;

  MenuItem_1_To_9  .Checked := False;
  MenuItem_Char    .Checked := False;
  MenuItem_New_Grid.Checked := False;
  MenuItem_Colours .Checked := True;

  GCha_Grid := G_COLOUR_GRID ;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;
end;





{ ---------------- Select ( End ) ---------------- }
{                                                  }
{ ---------------- Solution ( Start ) ----------------- }
{                                                       }
procedure TForm_Sudoku_Level.MenuItem_SolutionClick(Sender: TObject);
begin

end; // MenuItem_Solution //

procedure TForm_Sudoku_Level.MenuItem_Show_SolutionClick(Sender: TObject);
begin
  MenuItem_Show_Solution.Checked:=True;
  MenuItem_Hide_Solution.Checked:=False;

  GroBox_SudokuGrid.Visible:=True;

  GInt_FormWidth  := 603;
  Form_Sudoku_Level.Width:=GInt_FormWidth;

  P_Write ( 'Solution.txt', '1' );

end; // MenuItem_Show_Solution //

procedure TForm_Sudoku_Level.MenuItem_Hide_SolutionClick(Sender: TObject);
begin
  MenuItem_Show_Solution.Checked:=False;
  MenuItem_Hide_Solution.Checked:=True;

  GroBox_SudokuGrid.Visible:=False;

  GInt_FormWidth  := 421;
  Form_Sudoku_Level.Width:=GInt_FormWidth;

  P_Write ( 'Solution.txt', '0' );
end; // MenuItem_Hide_Solution //
{                                                       }
{ ---------------- Solution ( End ) ------------------- }
{                                                       }
{ ---------------- Close ( Start ) -------------}
{                                               }
 procedure TForm_Sudoku_Level.MenuItem_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Sudoku_Level.MenuItem_WhiteClick(Sender: TObject);
begin
    MenuItem_White.Checked:=True;
    MenuItem_PaleRed.Checked:=False;

     MenuItem_DisplayColour.Caption:='White';

    P_Write ( 'Cell.txt', '0' );

end;

{                                               }
{ ---------------- Close ( End ) ---------------}
{                                               }
{ --------------------End-----------------------}
{ ----------------- Main Menu ----------------- }
{ ----------------------------------------------}

procedure TForm_Sudoku_Level.But_New_PuzzleClick(Sender: TObject);
begin
  ComBox_BMAChange(Sender);
end;

procedure TForm_Sudoku_Level.ComBox_BMAChange(Sender: TObject);
begin
    if ComBox_BMA.Text = 'Easy'
    then
      GByt_SelectRating := G_EASY_PUZZLE;

  if ComBox_BMA.Text = 'Medium'
     then
       GByt_SelectRating := G_MEDIUM_PUZZLE;

   if ComBox_BMA.Text = 'Hard'
     then
      GByt_SelectRating := G_HARD_PUZZLE;

  if  ComBox_BMA.Text = 'Expert'
    then
      GByt_SelectRating :=  G_EXPERT_PUZZLE;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;

  Lab_TimeMinute.Caption:='00';
  Lab_TimeSecond.Caption:='00';

  GBoo_WrongPosition := False;

  StrGri_SudokuPuzzle.Cells[GInt_DropPosCol,GInt_DropPosRow] := '';



end;

procedure TForm_Sudoku_Level.P_Ratings;
var
 LByt_Row , LByt_Col , LByt_RandomLineLoop , LByt_RandomLineLength : Byte;
 LStr_RandomLine     : TStrings;
begin
  GByt_Characters_In_Grid:= 0;

  P_EmptyGrid(StrGri_SudokuPuzzle);
  P_RandomRatings;

  LStr_RandomLine:=  SplitString( GStr_RandomLine,',');

  for LByt_Row := 1 to 9 do
    begin
      LByt_RandomLineLength := length(LStr_RandomLine[ LByt_Row-1]);

      for LByt_RandomLineLoop := 1 to  LByt_RandomLineLength do
        StrGri_SudokuPuzzle  .Cells[strtoint(LStr_RandomLine[LByt_Row-1][LByt_RandomLineLoop ]),LByt_Row] :=
        StrGri_SudokuGrid.Cells[strtoint(LStr_RandomLine[LByt_Row-1][LByt_RandomLineLoop ]),LByt_Row];

      GByt_Characters_In_Grid := GByt_Characters_In_Grid + LByt_RandomLineLoop;



    end; // for LByt_Row //


end; // P_Ratings //

procedure TForm_Sudoku_Level.P_RandomRatings;
var
  LByt_RandomLine :byte;

begin

  case GByt_SelectRating of
    1 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_EASY;
    2 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_MEDIUM;
    3 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_HARD;
    4 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_EXPERT;
  end;

  Memo_Ratings.Lines.LoadFromFile( GStr_RandomRatings );

  LByt_RandomLine := RandomRange(1,9);
  GStr_RandomLine := Memo_Ratings.Lines[LByt_RandomLine];

end;

procedure TForm_Sudoku_Level.P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );
const
  L_EMPTY_CELL = '';
var
   LByt_Across, LByt_Down : byte;
begin
  with PStrGri_EmptyGrid do
    begin
      if VisibleRowCount = 1
        then
          for LByt_Across := 1 to 9 do
           cells[LByt_Across,1] := L_EMPTY_CELL
        else
           for LByt_Across := 1 to 9 do
             for LByt_Down := 1 to 9 do
               cells[LByt_Down,LByt_Across] := L_EMPTY_CELL;

    end; // with PStrGri_EmptyGrid //

end; // P_EmptyGrid //
{                                                                   }
{ ----------------- File ( End ) ---------------------------------- }

{ ---------------- Level ( Start ) -------------------------------- }
{                                                                   }


procedure TForm_Sudoku_Level.P_DisplayPuzzle    ( PByt_Rating : Byte );
begin
  P_DifficultyRating ( PByt_Rating );

end; // P_DisplayPuzzle //

procedure TForm_Sudoku_Level.P_DifficultyRating ( PByt_Rating : Byte );
begin
  case  PByt_Rating of

    G_BEGINNER_RATING :  begin


                           Form_Sudoku_Level.Width  := GInt_FormWidth;

                           GroBox_SudokuPuzzle.Caption := '';
                           GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                           + '( Beginner )';

                           Lab_DifficultyRating.Caption := '';
                           Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                           + '( Easy Only )';

                           ComBox_BMA.Clear;

                           ComBox_BMA.Items.Add('Easy');


                           ComBox_BMA.ItemIndex := 0;

                         end;

    G_MEDIUM_RATING   :  begin


                            Form_Sudoku_Level.Width  := GInt_FormWidth;

                            //Form_Sudoku_Level.Width  := 442;

                            GroBox_SudokuPuzzle.Caption := '';
                            GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                            + '( Medium )';

                            Lab_DifficultyRating.Caption := '';
                            Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                            + '( Easy and Medium )';

                            ComBox_BMA.Clear;

                            ComBox_BMA.Items.Add('Easy');
                            ComBox_BMA.Items.Add('Medium');

                            ComBox_BMA.ItemIndex :=0;

                         end;

    G_ADVANCED_RATING :  begin

                          //  Form_Sudoku_Level.Height := GInt_FormHeight;
                            Form_Sudoku_Level.Width  := GInt_FormWidth;

                          //  Form_Sudoku_Level.Width  := 421;

                            GroBox_SudokuPuzzle.Caption := '';
                            GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                            + '( Advanced )';

                            Lab_DifficultyRating.Caption := '';
                            Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                            + '( Hard and Expert )';

                            ComBox_BMA.Clear;

                            ComBox_BMA.Items.Add('Hard');
                            ComBox_BMA.Items.Add('Expert');

                            ComBox_BMA.ItemIndex := 0;
                         end;

  end; // case  PByt_Rating of  //

end; // P_DisplayPuzzle //

procedure  TForm_Sudoku_Level.P_RandomizeGrid ( PCha_Grid       : Char;
                                        PStrGri_Random  : TStringGrid );
var

  LByt_ColumnLoop  , LByt_RandomRow        , LByt_FoundColNo ,
  LByt_Across      , LByt_Down             , LByt_Found      ,
  LByt_FirstCharacter , LByt_FirstChar : Byte;

  LCha_FirstCharacter , LCha_FirstCharacterFromGrid : char;

  LStr_FindNumbers   , LStr_ReplaceNumbers , LStr_FirstCharacterFromGrid : string;
begin

{ ---------------------------------------------------------------------------  }
  for LByt_ColumnLoop := 1 to 9 do
    LStr_FindNumbers := LStr_FindNumbers + StrGri_SudokuSolution.Cells
                                                            [LByt_ColumnLoop,1];
{ ---------------------------------------------------------------------------  }
  Randomize;
  LByt_RandomRow := RandomRange(1,9);

  for LByt_ColumnLoop := 1 to 9 do
    LStr_ReplaceNumbers :=  LStr_ReplaceNumbers + PStrGri_Random.Cells
                                               [LByt_ColumnLoop,LByt_RandomRow];
{ ---------------------------------------------------------------------------  }
  for LByt_Across := 1 to 9 do
    StrGri_SudokuGrid.Cells[LByt_Across,1] :=
      LStr_ReplaceNumbers[LByt_Across];


  for LByt_Across := 1 to 9 do
    for LByt_Down := 1 to 9 do
      for LByt_Found := 1 to 9 do
        if StrGri_SudokuSolution.Cells[LByt_Found,1] =
          StrGri_SudokuSolution.Cells[LByt_Across,LByt_Down]
            then
              begin
                LByt_FoundColNo := LByt_Across;
                StrGri_SudokuGrid.Cells[LByt_FoundColNo,LByt_Down] := LStr_ReplaceNumbers[LByt_Found];
              end;

      for LByt_Across := 1 to 9 do
        StrGri_SelectCharacter.Cells[LByt_Across,1] := inttostr(LByt_Across);

   if PCha_Grid = G_CHARACTER_GRID
     then
       begin

         if MenuItem_Char.Caption[3] <> 'A'
           then
             begin
                Form_Sudoku_Level.Width:=GInt_FormWidth;
              // Form_Sudoku_Level.Width:=620;
               MenuItem_A_to_I.Visible:=true;
             end
           else
         begin
           Form_Sudoku_Level.Width:=GInt_FormWidth;
          // Form_Sudoku_Level.Width:=370;
           MenuItem_A_to_I.Visible:=false
         end;

         P_ReadFromTextFile  ( 'FirstAndLastCharacters.txt',
                               GStr_FirstAndLastCharacters);

         with f_alternative_grid.Form_AlternativeGrid do
           P_PutCharactersInToStringGrid ( StrGri_NineCharacters,
                                           GStr_FirstAndLastCharacters[1] );
         GStr_NineCharacters := '';

         for LByt_Across := 1 to 9 do
           GStr_NineCharacters := GStr_NineCharacters + StrGri_NineCharacters.Cells[LByt_Across,1];

        Form_Sudoku_Level.Width:=GInt_FormWidth;
      //  Form_Sudoku_level.Width := 458;

         LCha_FirstCharacter := GStr_FirstAndLastCharacters[1];
         LByt_FirstChar := ord( LCha_FirstCharacter)-49;

         for LByt_Across := 1 to 9 do
           for LByt_Down := 1 to 9 do
             StrGri_SudokuGrid.Cells[LByt_Across,LByt_Down] :=
               chr(ord(StrGri_SudokuGrid.Cells[LByt_Across,LByt_Down][1])+LByt_FirstChar);

         LByt_FirstCharacter := ord( LCha_FirstCharacter)-1;

         for LByt_Across := 1 to 9 do
           StrGri_SelectCharacter.Cells[LByt_Across,1] :=
             chr(ord(LByt_FirstCharacter+LByt_Across));

       end;






end; // P_RandomizeGrid //


procedure  TForm_Sudoku_Level.P_ReadFromTextFile ( PStr_FileName : string;
                                      var PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\First_And_Last_Char\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_FirstAndLastCharacters);

   CloseFile (LTexFil_FileName);



end; // P_ReadFromTextFile  //

procedure  TForm_Sudoku_Level.P_WriteToTextFile ( PStr_FileName : string;
                                          PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\First_And_Last_Char\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_FirstAndLastCharacters);
  CloseFile (LTexFil_FileName);

end; // P_WriteToTextFile //
{ ---------------- Level ( End ) --------------------------------------------- }
{                                                                              }
{ -----------------------------------------------------------------------------}
{ ---------------------- Sudoku Puzzle ( Start ) ----------------------------- }
{ -----------------------------------------------------------------------------}
{                                                                              }
procedure TForm_Sudoku_Level.StrGri_SudokuPuzzleDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  StrGri_SudokuPuzzle.MouseToCell(X,Y,GInt_DropPosCol,GInt_DropPosRow );
  GStr_DropChars := StrGri_SudokuPuzzle.Cells[GInt_DropPosCol,GInt_DropPosRow];

  { ----------------------------------------------------------------- }
  { ---------------------- Ignore Headers --------------------------- }
  { ----------------------------------------------------------------- }
   if ( GInt_DropPosRow <> 0 ) and (GInt_DropPosCol <> 0 )
    then
      begin
       P_CheckPuzzleGrid ( GInt_DropPosCol , GInt_DropPosRow );

      end;


end; // StrGri_SudokuPuzzleDragDrop //

procedure  TForm_Sudoku_Level.P_CheckPuzzleGrid ( PInt_DestCol,PInt_DestRow : integer);
const

   L_EMPTY_CELL = '';
var
  LByt_Across, LByt_Length, LByt_LengthLoop  : Byte;

  LInt_ButtonSelected      ,
  LInt_WrongColLoop        : Integer;

  LStr_SelectCharacter     ,
  LStr_PuzzleCellContents  ,
  LStr_GridCellContents    ,
  LStr_Duplicate           ,
  LStr_NumCharOrColour     ,
  LStr_GridName            ,
  LStr_Wrong               ,
  LStr_WrongCol            ,
  LStr_WrongRow            ,
  LStr_WrongChar           : string;

begin


  LStr_PuzzleCellContents          := StrGri_SudokuPuzzle.Cells
                                    [ PInt_DestCol,PInt_DestRow ];
  LStr_SelectCharacter              := StrGri_SelectCharacter.Cells
                                       [ GInt_DragPosCol,1 ];
  LStr_GridCellContents             := StrGri_SudokuGrid.Cells
                                    [ PInt_DestCol,PInt_DestRow ];

  LStr_NumCharOrColour := '';

{ ---------------------------------------------------------------------------- }
  Lab_TimerLine1.Visible:=true;
  Lab_TimerLine2.Visible:=true;

  GroBox_Puzzle.Top := 96;

  case GCha_Grid of
    G_NUMBER_GRID    : LStr_NumCharOrColour := 'Number';
    G_CHARACTER_GRID : LStr_NumCharOrColour := 'Character';
    G_COLOUR_GRID    : LStr_NumCharOrColour := 'Colour';
  end;
   GBoo_DropRow := True;
  if LStr_PuzzleCellContents <> L_EMPTY_CELL
    then
      MessageDlgPos( 'You cannot delete ' + LStr_NumCharOrColour + ' ' +
                                            LStr_GridCellContents,
                                            mtInformation, [mbOK], 0, 1020, 554);

     if LStr_PuzzleCellContents = L_EMPTY_CELL
   then
     if  LStr_SelectCharacter = LStr_GridCellContents
       then
         // Correct Position in Grid //
         begin
           GBoo_WrongPosition := False;

           GByt_Characters_In_Grid := GByt_Characters_In_Grid + 1;

           if GByt_Characters_In_Grid = G_COMPLETED_GRID
             then
               MessageDlgPos( 'Well done.  You have just solved the Grid',
                                            mtInformation, [mbOK], 0, 956, 554);

        // Put Correct Character in Right Position //
           StrGri_SudokuPuzzle   .Cells[PInt_DestCol,PInt_DestRow]:=
           StrGri_SelectCharacter.Cells[GInt_DragPosCol,GInt_DragPosRow];

        // Start Timer //
           Time_Second    .Enabled :=True;
           Time_Minute    .Enabled :=True;

           MenuItem_File.Enabled:=False;
         end
       else
         // Wrong Position in Grid //
         begin
         // Delete Wrong Charater //
            StrGri_SudokuPuzzle.Cells[GInt_DropPosCol,GInt_DropPosRow] := '';

         // Start Timer //
           Time_Second    .Enabled :=True;
           Time_Minute    .Enabled :=True;
         end;

        MenuItem_File.Enabled:=False;


end; // P_CheckPuzzleGrid //


procedure TForm_Sudoku_Level.StrGri_SudokuPuzzleDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

   Accept := (Source is TStringGrid);

end; // StrGri_SudokuPuzzleDragOver //

procedure TForm_Sudoku_Level.StrGri_SudokuPuzzleDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);

begin

    if GCha_Grid = G_COLOUR_GRID
      then
        P_CellColourAndFont ( aCol,aRow, aRect )
      else

end; // StrGri_SudokuPuzzle //

function TForm_Sudoku_Level.FInt_FindSameNumbers (PStrGri_AnyGrid : TStringGrid;
                               PStr_ColOrRow   : String ) : Integer;
var
  LInt_WrongColLoop, LInt_WrongRowLoop, LInt_WrongCol, LInt_WrongRow: integer;
  LStr_Wrong, LStr_WrongCol,LStr_WrongRow,LStr_WrongChar : string;
begin
   LStr_Wrong := FStr_LoadFileName( FStr_SavePath ( GStr_PathAndFileName ,'Wrong'));

   LStr_WrongCol  := LStr_Wrong[8];
   LStr_WrongRow  := LStr_Wrong[17];
   LStr_WrongChar := LStr_Wrong[27];

    if PStr_ColOrRow = 'Col'
     then
       begin
         for LInt_WrongColLoop := 1 to 9 do
           if PStrGri_AnyGrid.Cells[LInt_WrongColLoop,LInt_WrongRow] = LStr_WrongChar
             then
               Result := LInt_WrongColLoop;
       end; // PStr_ColOrRow = 'Col' //
     {else
        begin
         for LInt_WrongRowLoop := 1 to 9 do
           if PStrGri_AnyGrid.Cells[ LInt_WrongCol,LInt_WrongRowLoop ] = LStr_WrongChar
             then
               Result := LInt_WrongRowLoop;
       end // PStr_ColOrRow = 'Row' //      }
end;

procedure  TForm_Sudoku_Level.P_CellColourAndFont ( PByt_Col  : Byte;
                                             PByt_Row  : Byte;
                                             PRec_Rect : TRect );
const
  clPaleRed =   TColor($CCCCFF);
var
  LByt_Row , LByt_Col : byte;
  LStr_ColoredCell: string;
  LWor_SavedAlign: word;
begin
  if  GCha_Grid = G_NUMBER_GRID
    then
      exit;

  if (PByt_Col = 0) or (PByt_Row = 0)
    then
      Exit;

  if GBoo_WrongPosition
  and (PByt_Col = GInt_DropPosCol ) and (PByt_Row = GInt_DropPosRow )
    then
      begin

        Form_Sudoku_Level.Height:=590;

        GroBox_Timer_Puzzle.top := 280;

        StrGri_SudokuPuzzle.Canvas.Brush.Color:=clPaleRed ;
        StrGri_SudokuPuzzle.Canvas.FillRect(PRec_Rect);

        StrGri_SudokuPuzzle.Canvas.Font.Color:=clBlack;

        LWor_SavedAlign:= SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, TA_RIGHT);
        StrGri_SudokuPuzzle.Canvas.TextRect(PRec_Rect, PRec_Rect.Left + (PRec_Rect.Right - PRec_Rect.Left) div 2, PRec_Rect.Top + 2, GStr_DragChars);

        SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, LWor_SavedAlign);
      end
    else
      begin
        LStr_ColoredCell := StrGri_SudokuPuzzle.Cells[ PByt_Col,PByt_Row ];

        for LByt_Col:= 1 to 9 do
          for LByt_Row := 1 to 9 do
            if LStr_ColoredCell =inttostr(LByt_Row)
              then
                begin
                  StrGri_SudokuPuzzle.Canvas.Brush.Color:=G_ARRAY_COLOR_CELLS [LByt_Row ];
                  StrGri_SudokuPuzzle.Canvas.FillRect(PRec_Rect);

                  StrGri_SudokuPuzzle.Canvas.Font.Color:=clWhite;

                  LWor_SavedAlign:= SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, TA_CENTER);
                  StrGri_SudokuPuzzle.Canvas.TextRect(PRec_Rect, PRec_Rect.Left + (PRec_Rect.Right - PRec_Rect.Left) div 2, PRec_Rect.Top + 2, LStr_ColoredCell);

                  SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, LWor_SavedAlign);
                end; // if LStr_ColoredCell =inttostr(LByt_Row)
      end; // else //
end; // P_CellColourAndFont //
{ -----------------------------------------------------------------------------}
{ ---------------------- Sudoku Puzzle ( End ) ------------------------------- }
{ -----------------------------------------------------------------------------}
{                                                                              }
procedure TForm_Sudoku_Level.StrGri_SelectCharacterDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin


   Accept := (Source is TStringGrid);

end; // StrGri_SelectCharacterDragOver //

procedure TForm_Sudoku_Level.StrGri_SelectCharacterDrawCell(Sender: TObject;
  aCol, aRow: Integer; aRect: TRect; aState: TGridDrawState);
var
  LByt_Row , LByt_Col : byte;
  LStr_ColoredCell : string;

begin

  if  GCha_Grid <> G_COLOUR_GRID
    then
      Exit
  else

  if (aCol = 0) or (aRow = 0)
    then
      Exit;

  LStr_ColoredCell := StrGri_SelectCharacter.Cells[ aCol,aRow ];

  for LByt_Col:= 1 to 9 do
    for LByt_Row := 1 to 9 do
      if LStr_ColoredCell =inttostr(LByt_Row)
         then
           begin
             StrGri_SelectCharacter.Canvas.Brush.Color :=  G_ARRAY_COLOR_CELLS [LByt_Row];
             StrGri_SelectCharacter.Canvas.FillRect(aRect);
           end;
end;
procedure TForm_Sudoku_Level.StrGri_SelectCharacterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 // Lab_TimeMinute.Caption:='00';
 // Lab_TimeSecond.Caption:='00';

 // GInt_Min := 0;
 // GInt_Sec := 0;

  GroBox_Drag_Wrong.Caption:='Drag Instructions';

  Lab_DragWrongLine1.left := 23;
  Lab_DragWrongLine1.Caption:='left click, hold and drag';

  Lab_DragWrongLine2.left := 32;
  Lab_DragWrongLine2.Caption:='selected number to';

  Lab_DragWrongLine3.left := 24;
  Lab_DragWrongLine3.Caption:='empty cell in 9x9 grid';

  Lab_DragWrongLine4.left := 64;
  Lab_DragWrongLine4.Caption:='above';

   { Convert mouse coordinates X, Y to
    to StringGrid related col and row numbers }

   StrGri_SelectCharacter.MouseToCell(X, Y,GInt_DragPosCol,GInt_DragPosRow);

   GStr_DragChars  := StrGri_SelectCharacter.Cells[GInt_DragPosCol,GInt_DragPosRow];

   if GBoo_WrongPosition
     then
       begin

        GBoo_WrongPosition := False;
         StrGri_SudokuPuzzle   .Cells[GInt_DropPosCol , GInt_DropPosRow]:= '';

       end;

    if (Button = mbLeft)
    then
       { ----------------------------------------------------------------- }
       { ---------------------- Ignore Headers --------------------------- }
       { ----------------------------------------------------------------- }
      if ( GInt_DragPosCol = 0 ) or ( GInt_DragPosRow = 0 )
       then
     else
       StrGri_SelectCharacter.BeginDrag(False,5)

end; // StrGri_SelectCharacterMouseDown //

procedure TForm_Sudoku_Level.Time_MinuteTimer(Sender: TObject);
begin
   GInt_Min := GInt_Min + 1;

   if GInt_Min <= 9
     then
       Lab_TimeMinute.Caption:= '0' + inttostr(GInt_Min)
     else
       Lab_TimeMinute.Caption:=inttostr(GInt_Min);

   if GInt_Min = 59
    then
      GInt_Min := -1;
end;



procedure TForm_Sudoku_Level.Time_SecondTimer(Sender: TObject);
begin
   GInt_Sec := GInt_Sec + 1;

  if GInt_Sec <= 9
    then
      Lab_TimeSecond.Caption:= '0' + inttostr(GInt_Sec)
    else
      Lab_TimeSecond.Caption:=inttostr(GInt_Sec);

  if GInt_Sec = 59
    then
      GInt_Sec := -1;

end;


  procedure TForm_Sudoku_Level.P_Read ( PStr_FileName : string; var PStr_Read : String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Read_Boolean\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_Read );

   CloseFile (LTexFil_FileName);



end; // P_Read  //

procedure TForm_Sudoku_Level.P_Write( PStr_FileName : string; PStr_Write : String  );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Read_Boolean\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_Write );
  CloseFile (LTexFil_FileName);

end; // P_Write //

{procedure TForm_Sudoku_Level.P_WriteToFileName( PStr_FileName : string; PStr_Write : String  );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Read_Boolean\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_Write );
  CloseFile (LTexFil_FileName);

end; // P_Write //   }



end.

