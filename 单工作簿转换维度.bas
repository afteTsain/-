Attribute VB_Name = "��������ת��ά��"
Sub ��������ת��()

Dim r, c '����Դ�������ǿյ�Ԫ��
Dim wb As Workbook, range2 As Worksheet, wb2 As Workbook
Dim month, row_num, year, m, t
'�����ƻ���wb '��ϸ��range2
Application.ScreenUpdating = False
    Set wb2 = Workbooks.Add(xlWBATWorksheet)
    Set range2 = wb2.Sheets(1) '�����ܱ�ֵ��range2
    'month = --Left(wb.Name, Application.Find("��", wb.Name, 1) - 1)
'���õ�ǰ���
'��ȡ��ǰ�����������
    t = Timer
    row_num = 2 'range2.UsedRange.Rows.Count
    'range2.Rows(row_num & ":65536").Delete Shift:=xlShiftUp
    range2.Rows(row_num & ":65536").Clear '��ջ��ܱ���Դ����
    range2.Range("a1:e1") = Array("�Ա��", "��������", "��������", "������", "��·")
'    Dim filename
'    filename = Dir(wb2.Path & "\*.xls")
'    Do While filename <> "" '
'        If filename <> wb2.Name Then '�ж��ļ��Ƿ��ǻ������ݹ�����
'            Set wb = GetObject(wb2.Path & "\" & filename) '��Ҫ���ܵĹ�������ֵ������wb
                '��һ��forѭ�� ��������Դ�����й�����sheets(x)
                Set wb = ThisWorkbook
                year = Left(wb.Sheets(1).Cells(2, 1), 4) + 1
                month = Mid(wb.Sheets(1).Cells(2, 1), 6, 2)
                For x = 1 To wb.Worksheets.Count
                    Dim location As String
                    '���ַ���location��ֵ��ǰ�������������Ϊ�����ص�
                    location = wb.Sheets(x).Name
                    '�ڶ���&������forѭ����������ǰ����������е�Ԫ��
                    For r = 5 To wb.Sheets(x).UsedRange.Rows.Count
                        For c = 3 To wb.Sheets(x).UsedRange.Columns.Count
                            Dim rng As Range
                            Set rng = wb.Sheets(x).Cells(r, c)
                            '�жϵ�ǰ��Ԫ�����ַ��Ƿ���ڡ�3��
                                        If Left(rng.Value, 1) = "3" Then
                                        'Exit For
                                        '���������ж���ǰ��Ԫ����б������б��⣬���������ںͱ�������
                                        
                            Dim xx, day, level As String, line As String
                            '�жϻ��Ԫ����б����Ƿ�Ϊ��
                            If InStr(rng.Value, "·") > 0 Then
                                line = Mid(rng.Value, 7, InStr(rng.Value, "·") - 7)
                            Else
                                line = Right(rng.Value, 2)
                            End If
                            'line = Mid(rng.Value, 7, Application.Find("·", rng.Value) - 7) '��ȡ��·��
                            num = rng.Column
                            xx = wb.Sheets(x).Cells(3, rng.Column).Value
                                While xx = ""
                                    num = num - 1
                                    xx = wb.Sheets(x).Cells(3, num).Value
                                Wend
                            level = Left(xx, 2) '��������ֵ
                            '�жϻ��Ԫ����б���
                            num = rng.Row
                            xx = wb.Sheets(x).Cells(rng.Row, 1).Value
                                While xx = ""
                                    num = num - 1
                                    xx = wb.Sheets(x).Cells(num, 1).Value
                                Wend
                            day = xx '�������ڸ�ֵ
                            
                            '��rang2�����Ԫ����и�ֵ
                            range2.Cells(row_num, 1) = Left(rng.Value, 5)
                            range2.Cells(row_num, 2) = level
                            range2.Cells(row_num, 3) = VBA.DateSerial(year, month, day)
                            range2.Cells(row_num, 4) = location
                            range2.Cells(row_num, 5) = line
                            row_num = row_num + 1
                            m = m + 1
                            End If
                        Next c
                    Next r
                Next x
'                wb.Close False
'            End If
'            filename = Dir '��dir����ȡ�������ļ���������ֵ������wb
'        Loop
    Columns.EntireColumn.AutoFit
    t = Timer - t
    Application.ScreenUpdating = True
    MsgBox "�깤" & Chr(10) & "�Ѽ���" & m & "��������Ϣ��" & Chr(10) & "ֻ����0" & t & "��������~", , "~\(�R���Q)/~"
End Sub



