unit frm_plataformas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, frm_connection, frm_barra, StdCtrls, DBCtrls,
  Mask, ExtCtrls, jpeg, ExtDlgs, DB, Global, Menus, frxClass, frxDBSet,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UnitExcepciones, unittbotonespermisos, UnitValidaTexto, unitactivapop, UFunctionsGHH,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControl, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, unitGenerales, MemDS, DBAccess, Uni;

type
  TfrmPlataformas = class(TForm)
    frmBarra1: TfrmBarra;
    frxPlataformas: TfrxReport;
    PopupPrincipal: TPopupMenu;
    Insertar1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Registrar1: TMenuItem;
    Can1: TMenuItem;
    N2: TMenuItem;
    Eliminar1: TMenuItem;
    Refresh1: TMenuItem;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N4: TMenuItem;
    Salir1: TMenuItem;
    ds_plataformas: TDataSource;
   // plataformas: TZQuery;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    grid_ubicacion_frentes: TcxGrid;
    pnl1: TPanel;
    cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Column2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Column3: TcxGridDBColumn;
    dsPlataformas: TfrxDBDataset;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tsidPlataforma: TcxDBTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    tsDescripcion: TcxDBTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    tlstatus: TcxDBComboBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    ds_activo: TDataSource;
    zActivo: TZQuery;
    cxActivo: TcxDBLookupComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    plataformas: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frmBarra1btnAddClick(Sender: TObject);
    procedure frmBarra1btnEditClick(Sender: TObject);
    procedure frmBarra1btnPostClick(Sender: TObject);
    procedure frmBarra1btnCancelClick(Sender: TObject);
    procedure frmBarra1btnDeleteClick(Sender: TObject);
    procedure frmBarra1btnRefreshClick(Sender: TObject);
    procedure frmBarra1btnExitClick(Sender: TObject);
    procedure grid_plataformasCellClick(Column: TColumn);
    procedure Insertar1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Registrar1Click(Sender: TObject);
    procedure Can1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure frmBarra1btnPrinterClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    function estaEnFrentes(sIdPlataforma: string): boolean;
    function estaEnJornadas(sIdPlataforma: string): boolean;
    function estaEnBitacoraDePersonal(sIdPlataforma: string): boolean;
    procedure GlobalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EnterControl(Sender: TObject);
    procedure SalidaControl(Sender: TObject);

  private
  sMenuP: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlataformas: TfrmPlataformas;
   sOpcion, lStatusOrig: string;
implementation

uses
frm_ordenes, frm_Presupuesto;
{$R *.dfm}

procedure TfrmPlataformas.GlobalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Perform( CM_DIALOGKEY, VK_TAB, 0 );
    Key := 0;
  end;
end;

procedure TfrmPlataformas.EnterControl(Sender: TObject);
begin
    if (sender is tcxDBTextEdit) then
        tcxDBTextEdit(sender).Style.Color := global_color_entradaERP;
    if (sender is tcxTextEdit) then
        tcxTextEdit(sender).Style.Color := global_color_entradaERP;

    if (sender is tcxDBDateEdit) then
        tcxDBDateEdit(sender).Style.Color := global_color_entradaERP;

    if (sender is tcxDBMaskEdit) then
        tcxDBMaskEdit(sender).Style.Color := global_color_entradaERP;

    if (sender is tcxDBMemo) then
        tcxDBMemo(sender).Style.Color := global_color_entradaERP;

    if (sender is tcxDbCheckBox) then
        tcxDBCheckBox(sender).Style.Color := global_color_entradaERP;

    if (sender is tcxDBComboBox) then
        tcxDBComboBox(sender).Style.Color := global_color_entradaERP;
end;

procedure TfrmPlataformas.SalidaControl(Sender: TObject);
begin
    if (sender is tcxDBTextEdit) then
        tcxDBTextEdit(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxTextEdit) then
        tcxTextEdit(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxDBDateEdit) then
        tcxDBDateEdit(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxDBMaskEdit) then
        tcxDBMaskEdit(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxDBMemo) then
        tcxDBMemo(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxDbCheckBox) then
        tcxDBCheckBox(sender).Style.Color := global_color_SalidaERP;

    if (sender is tcxDBComboBox) then
        tcxDBComboBox(sender).Style.Color := global_color_SalidaERP;
end;

procedure TfrmPlataformas.FormShow(Sender: TObject);
begin
  sMenuP:=stMenu;
  OpcButton := '' ;
  frmbarra1.btnCancel.Click ;
  Plataformas.active := false ;
  Plataformas.Open;
  zActivo.active := false ;
  zActivo.Open;
end;

procedure TfrmPlataformas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Plataformas.Cancel ;
  action := cafree ;
end;

function TfrmPlataformas.estaEnBitacoraDePersonal(
  sIdPlataforma: string): boolean;
begin
  result := false;
  with connection.QryBusca do
  begin
    Active := false;
    Filtered := false;
    SQL.Clear;
    SQL.Add('SELECT iIdDiario FROM bitacoradepersonal WHERE sIdPlataforma = :sIdPlataforma LIMIT 1');
    ParamByName('sIdPlataforma').Value := sIdPlataforma;
    Open;
    if RecordCount > 0 then
      result := true;
  end;
end;

function TfrmPlataformas.estaEnFrentes(sIdPlataforma: string): boolean;
begin
  result := false;
  with connection.QryBusca do
  begin
    Active := false;
    Filtered := false;
    SQL.Clear;
    SQL.Add('SELECT sNumeroOrden FROM ordenesdetrabajo WHERE sIdPlataforma = :sIdPlataforma LIMIT 1');
    ParamByName('sIdPlataforma').Value := sIdPlataforma;
    Open;
    if RecordCount > 0 then
      result := true;
  end;
end;

function TfrmPlataformas.estaEnJornadas(sIdPlataforma: string): boolean;
begin
  result := false;
  with connection.QryBusca do
  begin
    Active := false;
    Filtered := false;
    SQL.Clear;
    SQL.Add('SELECT dIdFecha FROM jornadasdiarias WHERE sIdPlataforma = :sIdPlataforma LIMIT 1');
    ParamByName('sIdPlataforma').Value := sIdPlataforma;
    Open;
    if RecordCount > 0 then
      result := true;
  end;
end;

procedure TfrmPlataformas.frmBarra1btnAddClick(Sender: TObject);
begin
   frmBarra1.btnAddClick(Sender);
   Insertar1.Enabled := False ;
   Editar1.Enabled := False ;
   Registrar1.Enabled := True ;
   Can1.Enabled := True ;
   Eliminar1.Enabled := False ;
   Refresh1.Enabled := False ;
   Salir1.Enabled := False ;
   Plataformas.Append ;
   Plataformas.FieldByName('sIdPlataforma').AsString := autoFolio(Plataformas, 'plataformas');
   Plataformas.FieldValues['sImagen'] := '' ;
   Plataformas.FieldValues['sIdDistrito'] := '' ;
   cxActivo.DataBinding.DataSource.DataSet.FieldByName('sIdActivo').AsString := zActivo.FieldByName('sIdActivo').AsString;
   Plataformas.FieldValues['sIdActivo'] := zActivo.FieldByName('sIdActivo').AsString;
   tsDescripcion.SetFocus ;
   grid_ubicacion_frentes.Enabled := False;
end;

procedure TfrmPlataformas.frmBarra1btnEditClick(Sender: TObject);
begin
   //activapop(frmPlataformas, popupprincipal);
   frmBarra1.btnEditClick(Sender);
   Insertar1.Enabled := False ;
   Editar1.Enabled := False ;
   Registrar1.Enabled := True ;
   Can1.Enabled := True ;
   Eliminar1.Enabled := False ;
   Refresh1.Enabled := False ;
   Salir1.Enabled := False ;
   sOpcion := 'Edit';
   lStatusOrig := Plataformas.FieldByName('lStatus').AsString;
   try
     Plataformas.Edit ;
   except
     on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Sitios de Trabajo/Plataformas ..', 'Al agregar registro', 0);
     frmbarra1.btnCancel.Click ;
     end;
   end ;
   tsIdPlataforma.SetFocus;
   grid_ubicacion_frentes.Enabled := False;

end;

procedure TfrmPlataformas.frmBarra1btnPostClick(Sender: TObject);
var
  nombres, cadenas: TStringList;
  sId : string;
begin
    {Validaciones de campos}
    nombres:=TStringList.Create;cadenas:=TStringList.Create;
    nombres.Add('Identificacion');      nombres.Add('Descripcion');      nombres.Add('Status');
    cadenas.Add(tsIdPlataforma.Text); cadenas.Add(tsDescripcion.Text); cadenas.Add(tlStatus.Text);
    if not validaTexto(nombres, cadenas, 'Identificacion',tsIdPlataforma.Text) then
    begin
       MessageDlg(UnitValidaTexto.errorValidaTexto, mtInformation, [mbOk], 0);
       exit;
    end;

    if (Plataformas.State = dsEdit) and (lStatusOrig <> tlStatus.Text) then
    begin
       if estaEnFrentes(Plataformas.FieldByName('sIdPlataforma').AsString) then
       begin
           MessageDlg('No es posible cambiar el status del registro porque ya ha sido ' + #10 +
           'usado en la ventana de registro de frentes de trabajo', mtInformation, [mbOk], 0);
           tlStatus.ItemIndex := 0;
       end
       else
       if estaEnJornadas(Plataformas.FieldByName('sIdPlataforma').AsString) then
       begin
           MessageDlg('No es posible cambiar el status del registro porque ya ha sido ' + #10 +
           'usado en la ventana de jornadas y tiempos', mtInformation, [mbOk], 0);
           tlStatus.ItemIndex := 0;
       end
       else
       if estaEnBitacoraDePersonal(Plataformas.FieldByName('sIdPlataforma').AsString) then
       begin
           MessageDlg('No es posible cambiar el status del registro porque ya ha sido ' + #10 +
           'usado en la ventana de registro de personal y equipo de construccion', mtInformation, [mbOk], 0);
           tlStatus.ItemIndex := 0;
       end;
    end;

    {Continua insercion de datos..}
  try
      //desactivapop(popupprincipal);
      sId := Plataformas.FieldValues['sIdPlataforma'];
      Plataformas.Post ;
      Insertar1.Enabled := True ;
      Editar1.Enabled := True ;
      Registrar1.Enabled := False ;
      Can1.Enabled := False ;
      Eliminar1.Enabled := True ;
      Refresh1.Enabled := True ;
      Salir1.Enabled := True ;
      grid_ubicacion_frentes.Enabled := True;

      if global_frmActivo = 'frmPresupuesto' then
      begin
       try
           frmPresupuesto.Plataformas.Refresh;
           frmPresupuesto.sIdPlataforma.DataBinding.DataSource.DataSet.FieldByName('sIdPlataforma').AsString :=sId;
           frmPresupuesto.sIdPlataforma.SetFocus;
           Close;
       Except
       end;
      end;

      frmBarra1.btnPostClick(Sender) ;
  except
      on e : exception do begin
          UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Sitios de Trabajo/Plataformas ..', 'Al salvar registro', 0);
          frmbarra1.btnCancel.Click ;
      end;
  end;
  if sOpcion = 'Edit' then
  begin
      grid_ubicacion_frentes.Enabled := True;
      sOpcion := '';
  end;

end;

procedure TfrmPlataformas.frmBarra1btnCancelClick(Sender: TObject);
begin
   frmBarra1.btnCancelClick(Sender);
   Plataformas.Cancel ;
   grid_ubicacion_frentes.Enabled := True;
   sOpcion := '';
end;

procedure TfrmPlataformas.frmBarra1btnDeleteClick(Sender: TObject);
begin
  If Plataformas.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Plataformas.Delete ;

      except
       on e : exception do begin
           UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Sitios de Trabajo/Plataformas ..', 'Al eliminar registro', 0);
       end;
      end
    end
end;

procedure TfrmPlataformas.frmBarra1btnRefreshClick(Sender: TObject);
begin
  Plataformas.refresh ;
end;

procedure TfrmPlataformas.frmBarra1btnExitClick(Sender: TObject);
begin
   frmBarra1.btnExitClick(Sender);
   Insertar1.Enabled := True ;
   Editar1.Enabled := True ;
   Registrar1.Enabled := False ;
   Can1.Enabled := False ;
   Eliminar1.Enabled := True ;
   Refresh1.Enabled := True ;
   Salir1.Enabled := True ;
   close;
end;


procedure TfrmPlataformas.grid_plataformasCellClick(Column: TColumn);
begin
  if frmbarra1.btnCancel.Enabled = True then
      frmbarra1.btnCancel.Click ;
end;

procedure TfrmPlataformas.Imprimir1Click(Sender: TObject);
begin
    frmBarra1.btnPrinter.Click;
end;

procedure TfrmPlataformas.Insertar1Click(Sender: TObject);
begin
    frmBarra1.btnAdd.Click
end;

procedure TfrmPlataformas.Editar1Click(Sender: TObject);
begin
    frmBarra1.btnEdit.Click
end;

procedure TfrmPlataformas.Registrar1Click(Sender: TObject);
begin
    frmBarra1.btnPost.Click
end;

procedure TfrmPlataformas.Can1Click(Sender: TObject);
begin
    frmBarra1.btnCancel.Click
end;

procedure TfrmPlataformas.Eliminar1Click(Sender: TObject);
begin
    frmBarra1.btnDelete.Click
end;

procedure TfrmPlataformas.Refresh1Click(Sender: TObject);
begin
    frmBarra1.btnRefresh.Click
end;

procedure TfrmPlataformas.Salir1Click(Sender: TObject);
begin
    frmBarra1.btnExit.Click
end;

procedure TfrmPlataformas.frmBarra1btnPrinterClick(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_MAS_plataformas.fr3') then
  begin
    showmessage('El archivo de reporte '+global_Mireporte+'_MAS_plataformas.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;
  If Plataformas.RecordCount > 0 Then
     frxPlataformas.LoadFromFile (global_files + global_miReporte  + '_MAS_plataformas.fr3') ;
  frxPlataformas.ShowReport();

end;

end.

