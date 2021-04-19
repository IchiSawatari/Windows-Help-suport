rem Created by   : Ichi Sawatari - Tyago
rem Contact      : tyago.ichi@outlook.com
REM
REM ==================================================================
REM   Author: Ichi Sawatari
REM   Discord: Tyago Ichi#3797
REM   Github: https://github.com/IchiSawatari/Windows-Help-suport
REM ==================================================================
REM   last update: 21/03/2021
REM ==================================================================
@echo off
CLS
ECHO.
ECHO =====================================
ECHO   https://github.com/ichiSawatari
ECHO =====================================
ECHO.

:init
setlocal DisableDelayedExpansion
set cmdInvoke=1
set winSysFolder=System32
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"

if '%cmdInvoke%'=='1' goto InvokeCmd 

ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
goto ExecElevation

:InvokeCmd
ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
"%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

@echo off
@title Windows Help Suporte :3
cls

chcp 437 >nul
cd /d "%~dp0"
setlocal EnableDelayedExpansion

:inicio
@title Windows Help Suporte :3
color 0f
cls
REM = LIMPANDO VARIAVEIS =
	SET Comando=
	SET ComandoREDE=
	SET Network_Name_Password=
	SET Appx_Instalando=
	SET Xap_Instalando=
	SET TesteMode=
	SET Network_Local_NAME=
	SET Network_Local_IP=
	SET Network_Local_IPv6=
	SET Network_DNS_ONE=
	SET Network_DNS_TWE=
	SET Network_DNS_ONEv6=
	SET Network_DNS_TWEv6=
	SET AcessPoint=
	SET ssidrede=
	SET passwordrede= 
	SET SerialKeyAlter=
	SET DNS_NAME_SERVER=
	SET KMS_SERIAL=
	SET KMS_SERVER=
	SET KMS_ATIVA_WIN=
	SET ativar_Key=
	SET r_Reparo=
	SET input_Reparo=

echo. ==================================================================
echo. ========================= Menu Principal ========================= 
echo. ==================================================================
echo. == 1 - Instalar/Atualizar um aplicativo Appx (windows10)        ==
echo. == 2 - Instalar/Atualizar multiplos aplicativos Appx (windows10)==
echo. == 3 - Ver minha serial key                                     ==
echo. == 4 - Ativar windows por serial key                            ==
echo. == 5 - ativar windows por KMS server                            ==
echo. == 6 - Numero de serie Motherboard e BIOS                       ==
echo. == 7 - Windows Modo Teste                                       ==
echo. == 8 - Rede                                                     ==
echo. == 9 - Atualiza para o windows 10 Pro                           ==
echo. == 10 - Remover apps nativos windows 10                         ==
echo. == 11 - Reparar problemas HDD / ARQUIVOS                        ==
echo. == 12 - Iniciar/Parar impressora servico                        ==
echo. == 13 - Info do PC e S.O                                        ==
echo. == 14 - Remover arquivos temporarias de updates e navegadores.  ==
echo. ==================================================================
echo. == A - Creditos  =================================================
echo. ==================================================================
echo. == S - SAIR  =====================================================
echo. ==================================================================

set /p Comando= :: 
if "%Comando%" equ "1" (goto:op1)
if "%Comando%" equ "2" (goto:op2)
if "%Comando%" equ "3" (goto:op3)
if "%Comando%" equ "4" (goto:op4)
if "%Comando%" equ "5" (goto:op5)
if "%Comando%" equ "6" (goto:op6)
if "%Comando%" equ "7" (goto:op7)
if "%Comando%" equ "8" (goto:op8)
if "%Comando%" equ "9" (goto:op9)
if "%Comando%" equ "10" (goto:op10)
if "%Comando%" equ "11" (goto:op11)
if "%Comando%" equ "12" (goto:op12)
if "%Comando%" equ "13" (goto:op13)
if "%Comando%" equ "14" (goto:op14) 

if "%Comando%" equ "a" (goto:Author)
if "%Comando%" equ "A" (goto:Author)
if "%Comando%" equ "Author" (goto:Author)
if "%Comando%" equ "author" (goto:Author)
if "%Comando%" equ "s" (goto:exit)
if "%Comando%" equ "S" (goto:exit)
if "%Comando%" equ "sair" (goto:exit)
if "%Comando%" equ "Sair" (goto:exit)
if "%Comando%" equ "SAIR" (goto:exit)
if "%Comando%" GEQ "00" (goto:erro404)
if "%Comando%" GEQ "aa" (goto:erro404)
if "%Comando%" GEQ "AA" (goto:erro404)

rem = ERRO NOT FOUND ===========================================================
:erro404
cls
color 03
echo ========================================================================
echo            * Opcao Invalida! Escolha outra opcao do menu *
echo ========================================================================
echo.
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

rem == Instalar um aplicativo windows appx
:op1
	echo. Digite apenas o nome do aplicativo mas sem espaço.
	echo. Nome do aplicativo:
	SET /p Appx_Instalando=
	pause
		"PowerShell" -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass Add-AppxPackage -Path %Appx_Instalando%.appx -Update
		"PowerShell" -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass Add-AppxPackage -Path %Appx_Instalando%.appx
pause
goto:inicio

rem == Instalar multiplos aplicativos windows ==
:op2
	set _c=0
	for /f %%a in ('dir /b "*.appx*" 2^>nul') do (call set /a _c+=1)
	if %_c% equ 0 goto :nofiles
	
		:run
		set count=0
		cls
		echo ============================================================
		echo 		Instalando multiplos apps...
		echo ============================================================
		echo. Antes de proseguir certifique-se de que:
		echo. os apps foram renomeado em sequencia numerica
		echo.	ex: '1.appx' '2.appx' '3.appx' etc...
		echo. sem aspas!
		echo ============================================================
		pause
		for /f %%G in ('dir /b /on "*.appx*"') do (call :start %%G)
		goto :fin
		
		:start
		set /a count+=1
		echo.
		echo Package %count% of %_c%: %~n1
		echo.
		if /i %~x1==appx (
		"PowerShell" -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass Add-AppxPackage -Path %1 -Update
		goto :eof
		)
		"PowerShell" -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass Add-AppxPackage -Path %1
		goto :eof
goto:inicio

rem == Ver minha serial key ==
:op3
cls
@title Minha serial key - Windows Help Suporte
cls
	echo. Serial Key gravada na BIOS:
		powershell -command "(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"
		powershell -command "Get-WMIObject -Class SoftwareLicensingService | Select-Object -Property *"
		powershell -command "Get-WMIObject -Class SoftwareLicensingService | Select-Object -Property *" >> infoKeyBIOS.txt
	echo. Serial Key
		powershell -command "wmic path softwareLicensingService get OA3xOriginalProductKey"
		powershell -command "wmic path softwareLicensingService get OA3xOriginalProductKey" >> infoKeyESD.txt
	echo. Serial por KMS
		sKeyWin.vbs
	echo. 
pause
goto:inicio

rem == Ativacao windows por serial key ==
:op4
cls
@title Ativar windows com uma serial key
echo.=====================================================================
echo.    1 - Ativar windows pela Serial Key :: 2 - Remover Serial Key
echo.=====================================================================
echo. B - Voltar ao menu inicial
echo.=====================================================================
	set /p ativar_Key= ::
	if "%ativar_Key%" equ "1" (goto:key1)
	if "%ativar_Key%" equ "2" (goto:key2)

	if "%ativar_Key%" equ "b" (goto:back)
	if "%ativar_Key%" equ "B" (goto:back)
:key1
	echo.
	set /p SerialKeyAlter= Digite a Key (ex: xxxxx-xxxxx-xxxxx-xxxxx-xxxxx):
		cscript.exe %windir%\system32\slmgr.vbs /rilc
		cscript.exe %windir%\system32\slmgr.vbs /ckms
		cscript.exe %windir%\system32\slmgr.vbs /cpky
		cscript.exe %windir%\system32\slmgr.vbs -ipk %SerialKeyAlter%
		cscript.exe %windir%\system32\slmgr.vbs –ato
		echo. Verificando Ativação...
		cscript.exe %windir%\system32\slmgr.vbs /xpr
pause
goto:inicio

:key2
cls
	cscript.exe %windir%\system32\slmgr.vbs /rilc
	cscript.exe %windir%\system32\slmgr.vbs /upk
	cscript.exe %windir%\system32\slmgr.vbs /ckms
	cscript.exe %windir%\system32\slmgr.vbs /cpky
	cscript.exe %windir%\system32\slmgr.vbs /xpr
pause
goto:inicio

:back
goto:inicio

rem == Ativacao windows por KMS ==
:op5
cls
@title Ativar windows por KMS
	echo.
	echo. === SERIAL KEY =======================================================================
	echo. 	  Home/Core                            TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
	echo. 	  Home/Core (Country Specific)         PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
	echo. 	  Home/Core (Single Language)          7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
	echo. 	  Home/Core N                          3KHY7-WNT83-DGQKR-F7HPR-844BM
	echo. 	  Professional                         W269N-WFGWX-YVC9B-4J6C9-T83GX
	echo. 	  Professional N                       MH37W-N47XK-V7XM9-C7227-GCQG9
	echo. 	  Enterprise                           NPPR9-FWDCX-D2C8J-H872K-2YT43
	echo. 	  Enterprise N                         DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
	echo. 	  Education                            NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
	echo. 	  Education N                          2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
	echo. 	  Enterprise 2015 LTSB                 WNMTR-4C88C-JK8YV-HQ7T2-76DF9
	echo. 	  Enterprise 2015 LTSB N               F77B-TNFGY-69QQF-B8YKP-D69TJ
	echo. 	  Enterprise 2016 LTSB                 DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
	echo. 	  Enterprise 2016 LTSB N               QFFDN-GRT3P-VKWWX-X7T3R-8B639
	echo. =====================================================================================
	echo.
	set /p KMS_SERIAL= digite a serial key correnspondente ao produto:
	set /p KMS_SERVER= Digite o host/IP do servidor kms:
				slmgr /upk
		cscript slmgr.vbs /ipk %KMS_SERIAL%
		cscript slmgr.vbs /skms %KMS_SERVER%
		cscript slmgr.vbs /ato
pause
cls
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

rem == Numero de serie Motherboard and BIOS ==
:op6

@title Serial Number of your Motherboard
	Echo
	cls

	wmic bios get BiosVersion
	Echo.
	wmic bios get serialnumber

pause
goto:inicio

rem == Entra no modo de testes do windows ==
:op7
	
@title  Windows Mode Test
@echo off
cls

REM = LIMPANDO VARIAVEIS =
	SET TesteMode=
	SET Comando=

echo ============================================================================
	echo   1. Windows - Mode Test On
	echo   2. Windows - Mode Test Off
	echo.
	echo   0. back
echo ============================================================================

	set /p TesteMode= :: 
		if "%TesteMode%" equ "1" (goto:modeOn)
		if "%TesteMode%" equ "2" (goto:modeOff)
		
		if "%TesteMode%" equ "0" (goto:back)
		if "%TesteMode%" GEQ "00" (goto:erro404)
		if "%TesteMode%" GEQ "aa" (goto:erro404)
		if "%TesteMode%" GEQ "AA" (goto:erro404)
		
	rem = ERRO NOT FOUND ===========================================================
	:erro404
	cls
	echo ========================================================================
	echo            * Opcao Invalida! Escolha outra opcao do menu *
	echo ========================================================================
	echo.
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
	goto:inicio
	rem = MODO ON ============================================================
	:modeOn
		bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS
		bcdedit -set TESTSIGNING ON
		echo.
		echo Modo de teste ATIVO, o Computador sera reiniciado para finalizar as configuracoes.
	pause
		%windir%\system32\shutdown.exe -r -t 0
		SET TesteMode=
	goto:back

	rem = MODO OFF ===========================================================
	:modeOff
		bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS
		bcdedit -set TESTSIGNING OFF
		echo.
		echo Modo de teste DESATIVADO, o Computador sera reiniciado para finalizar as configuracoes.
	pause
		%windir%\system32\shutdown.exe -r -t 0
		SET TesteMode=
	goto:back
	
:back
goto:inicio

rem == setting rede ==
:op8
cls

:rede
@echo off
@title Setting Rede Windows
cls
REM = LIMPANDO VARIAVEIS =
	SET Comando=
	SET ComandoREDE=
	SET Network_Name_Password=
	SET Network_Local_NAME=
	SET Network_Local_IP=
	SET Network_Local_IPv6=
	SET Network_DNS_ONE=
	SET Network_DNS_TWE=
	SET Network_DNS_ONEv6=
	SET Network_DNS_TWEv6=
	SET DNS_NAME_SERVER=

rem == Menu ==
echo. =====================================================================
echo   ====================== Setting Rede Windows =======================
echo. =====================================================================
echo  1 - Ver config de Rede
echo. 2 - Configurar IP estatico (IPV4 and IPV6)
echo. 3 - Ativar config DHCP
echo  4 - Ativar config DNS Auto
echo  5 - Config DNS Manual (IPV4 and IPV6)
echo  6 - Ver senhas de redes Wi-Fi
echo. 7 - Access Point (windows 8 and windows 7)
echo. 8 - Teste DNS
echo. 9 - Atualiza todas as concessoes de DHCP e registra novamente nomes DNS
echo. 10 - Exibir o conteudo do Cache do DNS Resolver
echo. 11 - Limpa o cache do DNS Resolver
echo. 12 - Reset config de rede
echo. =====================================================================
echo  0 - Voltar ao Menu inicial
echo. =====================================================================

set /p ComandoREDE= :: 
if "%ComandoREDE%" equ "1" (goto:rede1)
if "%ComandoREDE%" equ "2" (goto:rede2)
if "%ComandoREDE%" equ "3" (goto:rede3)
if "%ComandoREDE%" equ "4" (goto:rede4)
if "%ComandoREDE%" equ "5" (goto:rede5)
if "%ComandoREDE%" equ "6" (goto:rede6)
if "%ComandoREDE%" equ "7" (goto:rede7)
if "%ComandoREDE%" equ "8" (goto:rede8)
if "%ComandoREDE%" equ "9" (goto:rede9)
if "%ComandoREDE%" equ "10" (goto:rede10)
if "%ComandoREDE%" equ "11" (goto:rede11)
if "%ComandoREDE%" equ "12" (goto:rede12)

if "%ComandoREDE%" equ "0" (goto:inicio)
if "%ComandoREDE%" GEQ "00" (goto:erro404)
if "%ComandoREDE%" GEQ "aa" (goto:erro404)
if "%ComandoREDE%" GEQ "AA" (goto:erro404)

rem = ERRO NOT FOUND ===========================================================
:erro404
cls
color 03
echo ========================================================================
echo            * Opcao Invalida! Escolha outra opcao do menu *
echo ========================================================================
echo.
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio
rem == Mostra as configuração das Rede ==
:rede1
cls
	ipconfig /all
	echo.
	netsh interface ip show config
	netsh interface ip show config >> redeConfig.txt
	ipconfig /all >> redeConfig.txt
	echo Um arquivo redeConfig.txt foi salvo com as info.

pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == Configurar Rede IP estatico ==
:rede2
	echo.
	
		set /p Network_Local_NAME= Nome interface (ex: Wi-Fi):
	echo. Config IPV4 
	set /p Network_Local_IP= Endereco IP (ex: 192.168.1.2 255.255.255.0 192.168.1.1): 
		netsh int ipv4 set address name="%Network_Local_NAME%" source=static %Network_Local_IP%
	echo. Config IPV6
		set /p Network_Local_IPv6= Endereco IP (ex: 0:0:0:0:0:ffff:c0a8:1): 
		netsh int ipv6 set address name="%Network_Local_NAME%" source=static %Network_Local_IPv6%
	echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == Ativar config DHCP ==
:rede3
	echo.
			ipconfig /renew >nul
	set /p Network_Local_NAME= Nome interface (ex: Wi-Fi): 
		netsh interface ip set address name="%Network_Local_NAME%" dhcp
			ipconfig /renew6 >nul
		netsh interface ipv6 set address name="%Network_Local_NAME%" dhcp
	echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == Ativar config DNS Auto ==
:rede4
	set /p Network_Local_NAME= Nome interface (ex: Wi-Fi): 
		netsh interface ipv4 set dnsservers name="%Network_Local_NAME%" dhcp
		netsh interface ipv6 set dnsservers name="%Network_Local_NAME%" dhcp
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == Ativar config DNS Manual ==
:rede5
		ipconfig /flushdns > nul
		set /p Network_Local_NAME= Nome interface (ex: Wi-Fi):
	echo. DNS IPV4 
		set /p Network_DNS_ONE= IP do servidor DNS primario (ex: 8.8.8.8): 
			netsh interface ipv4 set dnsservers name="%Network_Local_NAME%" static %Network_DNS_ONE%
			echo. OK
		set /p Network_DNS_TWE= IP do servidor DNS secundario (ex: 8.8.4.4): 
			netsh interface ipv4 add dnsservers name="%Network_Local_NAME%" static %Network_DNS_TWE%
			echo. OK
	echo.
	echo. DNS IPV6
		set /p Network_DNS_ONEv6= IP do servidor DNS primario (ex: 2001:4860:4860::8888): 
			netsh interface ipv6 set dnsservers name="%Network_Local_NAME%" static %Network_DNS_ONEv6%
			echo. OK
		set /p Network_DNS_TWEv6= IP do servidor DNS secundario (ex: 2001:4860:4860::8844): 
			netsh interface ipv6 add dnsservers name="%Network_Local_NAME%" static %Network_DNS_TWEv6%
			echo. OK
	echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede


:rede6
	echo.
		set /p Network_Name_Password= Digite o nome da rede sem fio: 
		netsh wlan show profile name="%Network_Name_Password%" key=clear >> rede.txt
		netsh wlan show profile name="%Network_Name_Password%" key=clear
	echo. 
	echo Um arquivo rede.txt foi salvo com a senha.
	echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == Roteador wi-fi Access Point (windows8.1 and windows7) ==
:rede7
cls

@Echo off
@title Access Point
cls

REM LIMPANDO VARIAVEIS
	SET ComandoREDE=
	SET AcessPoint=
	SET ssidrede=
	SET passwordrede= 
	
:aPoint
cls

echo. =================================================================
echo                        ACESS POINT WINDOWS              
echo. =================================================================
echo.                                           
echo   1 - INICIAR AP                           
echo.  2 - DESLIGAR AP                          
echo.  3 - CONFIGURAR AP                        
echo   4 - INFORMACOES 
echo.    
echo   0 - SAIR                                 
echo.                                           
echo. =================================================================

set /p AcessPoint= ::
if "%AcessPoint%" equ "1" (goto:ac1)
if "%AcessPoint%" equ "2" (goto:ac2)
if "%AcessPoint%" equ "3" (goto:ac3)
if "%AcessPoint%" equ "4" (goto:ac4)

if "%AcessPoint%" equ "0" (goto:back)

:ac1
cls
netsh wlan start hostednetwork
echo Precione ENTER para volta ao menu
pause>nul
goto:aPoint

:ac2
cls
netsh wlan stop hostednetwork
echo Precione ENTER para volta ao menu
pause>nul
goto:aPoint

:ac3
cls

Echo Digite um nome para a Rede  :
set /p ssidrede=

Echo Digite uma senha para a Rede:
set /p passwordrede=

@Echo.

netsh wlan set hostednetwork mode=allow ssid=%ssidrede% key=%passwordrede%
Echo -------------------------------------
@Echo.
Echo SSID : %ssidrede% 
Echo SENHA: %passwordrede% 
@Echo.
Echo ------------------------------------

echo Precione ENTER para volta ao menu
pause>nul
goto:aPoint


:ac4
cls
netsh wlan show hostednetwork
pause
goto:aPoint

:back
netsh wlan stop hostednetwork
goto:rede
rem ==== FIM ACESS POINT ======

rem ==== TESTE DNS ====
:rede8
	echo.
	set /p DNS_NAME_SERVER= Digite o endereco do servidor(google.com): 
		ping %DNS_NAME_SERVER% >> testeDNS.txt
		ping %DNS_NAME_SERVER%
		nslookup %DNS_NAME_SERVER% >> testeDNS.txt
		nslookup %DNS_NAME_SERVER%
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 5 > nul
goto:rede

rem ===== Atualiza todas as concessões de DHCP e registra ========
:rede9
	cls
		echo.
			ipconfig /registerdns
		echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem ===== Exibir o conteúdo do Cache do DNS Resolver ========
:rede10
	cls
	echo.
		ipconfig /displaydns
	echo.
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem ===== LIMPAR DNS CACHE ========
:rede11
	cls
	echo.
		ipconfig /flushdns
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem ===== RESET CONFIG REDE ========
:rede12
@echo off
@title RESTAURANDO CONFIG DE REDE
	cls
		echo Reiniciando config de rede...
			timeout /t 5 > nul
			ipconfig /renew >nul
			ipconfig /renew6 >nul
			ipconfig /release *ET* >nul
			ipconfig /release *Con* >nul
			ipconfig /release *Wi* >nul
			ipconfig /release >nul
			ipconfig /release6 >nul
		echo Renovando endereco IP...
			timeout /t 5 > nul
			ipconfig /flushdns >nul
		echo Limpando cache do DNS...
			timeout /t 5 > nul
		echo Atualizando DNS...
			timeout /t 5 > nul 
			ipconfig /registerdns >nul
		echo Reiniciando config de rede ETHERNET e Wi-Fi...
			timeout /t 5 > nul
			ipconfig /renew ET* >nul
			ipconfig /renew Con* >nul
			ipconfig /renew Wi* >nul
			ipconfig /renew >nul
		netsh int ip reset c: /reset-log.txt
		ipconfig /release
		ipconfig /release6
		ipconfig /renew
		ipconfig /renew6
		echo Pronto...
		echo.
		echo O windows ira reiniciar para concluir as configuracoes...
		timeout /t 2 > nul
			%windir%\system32\shutdown.exe -r -t 0
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
goto:rede

rem == SAIR ==
:inicio
goto:inicio

rem ======================= FIM REDE ================================

rem == UPGRADE PARA WINDOWS 10 PRO ==
:op9
cls
@title Windows Upgrade para Windows 10 PRO
cls
	echo.
	echo. Antes de proseguir tenha em mente do que esta fazendo...
	echo. Caso queira cancelar precione Ctrl+C
	echo. depois que o processo começa nao e mais possivel concelar.
	echo.
		pause
	cls
		echo. tem certeza que deseja proseguir? (Ctrl+C para cancelar)
		pause >nul
		pause
	cls
	echo iniciando upgrade...
	timeout /t 2 > nul
		cscript.exe %windir%\system32\slmgr.vbs /rilc
		cscript.exe %windir%\system32\slmgr.vbs /upk
		cscript.exe %windir%\system32\slmgr.vbs /ckms
		cscript.exe %windir%\system32\slmgr.vbs /cpky
		cscript.exe %windir%\system32\slmgr.vbs /ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T
		sc config LicenseManager start= auto & net start LicenseManager
		sc config wuauserv start= auto & net start wuauserv
		clipup -v -o -altto c:\
	echo.
	pause
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

rem == Remover apps metro ==
:op10
cls
	SET Comando=
	SET NOTEBOOK=
	SET opc=
@echo off
@title Run clear windows apps v1.0
echo. %time% %OS% 
echo. %userprofile%
ECHO.
SET /p NOTEBOOK= Deseja remover apps nativos(S) ou Reinstalar(R)?
if "%NOTEBOOK%" equ "S" (goto:Desktop)
if "%NOTEBOOK%" equ "Sim" (goto:Desktop)
if "%NOTEBOOK%" equ "s" (goto:Desktop)
if "%NOTEBOOK%" equ "sim" (goto:Desktop)
if "%NOTEBOOK%" equ "R" (goto:Reinstall)
if "%NOTEBOOK%" equ "Rein" (goto:Reinstall)
if "%NOTEBOOK%" equ "r" (goto:Reinstall)
if "%NOTEBOOK%" equ "rein" (goto:Reinstall)

:Desktop
cls
ECHO.
ECHO =====================================
ECHO.
ECHO           Windows Clean Apps
ECHO.
ECHO   https://github.com/ichiSawatari
ECHO =====================================
ECHO.
echo. %time% %OS% 
echo. %userprofile%
ECHO.
@title Run clear windows Desktop v1.6
pause
    echo. Tentando remover apps microsoft
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Office.OneNote* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *WindowsScan* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Whiteboard* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *MinecraftUWP* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.OneConnect* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsNotepad* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *OneNote* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MSPaint* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.People* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Print3D* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Paint3D* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MSPaint3D* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Paint3D* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.RemoteDesktop* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.ScreenSketch* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Office.Sway* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft3DViewer* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.3dbuilder* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft3DViewer* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsAlarms* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.GetHelp* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsMaps* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Messaging* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *CommsPhone* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage"
	echo. Tentando remover Microsoft Newsletter
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.News* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Newsletter* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftNewsletter* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Microsoft.news* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Microsoft.newsletter* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Microsoft.MicrosoftNewsletter* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage *Newsletter* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage *MicrosoftNewsletter* | Remove-AppxPackage"
	    powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"
    SET opc=
    set /p opc= Deseja remover Skype ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage"
	:op2
    SET opc=
    set /p opc= Deseja remover Microsoft Musica ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.ZuneMusic* | Remove-AppxPackage"
    :op2
    SET opc=
    set /p opc= Deseja remover Microsoft Video ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.ZuneVideo* | Remove-AppxPackage"
    :op2
    SET opc=
    set /p opc= Deseja remover Microsoft Camera ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage -AllUsers *windowscamera* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.windowscamera* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *WindowsSoundRecorder* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
    :op2
    SET opc=
    echo.
    echo. Removendo apps de terceiros...
    SET opc=
    set /p opc= Deseja remover Netflix ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *netflix* | Remove-AppxPackage"
    :op2
    SET opc=
    set /p opc= Deseja remover Spotify ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage *Spotify* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *spotify* | Remove-AppxPackage"
    :op2
    SET opc=
        powershell -command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *facebook* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *twitter* | Remove-AppxPackage"
    echo.
    SET opc=
    echo. Removendo demais apps de terceiros AutodeskSketchBook...
        	powershell -command "Get-AppxPackage -AllUsers *AutodeskSketchBook* | Remove-AppxPackage"
		echo. PandoraMediaInc
			powershell -command "Get-AppxPackage -AllUsers *PandoraMediaInc* | Remove-AppxPackage"
		echo. CandyCrushSodaSaga
        	powershell -command "Get-AppxPackage -AllUsers *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
		echo. DrawboardPDF
        	powershell -command "Get-AppxPackage -AllUsers *Microsoft.DrawboardPDF* | Remove-AppxPackage"
		echo. Appconnector
        	powershell -command "Get-AppxPackage -AllUsers *Microsoft.Appconnector* | Remove-AppxPackage"
		echo. Asphalt8Airborne
        	powershell -command "Get-AppxPackage -AllUsers *Microsoft.Asphalt8Airborne* | Remove-AppxPackage"
    echo. Tentando Remover Apps BING...
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingWeather* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingNews* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *bingsports* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *bingfinance* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.bingWeather* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.bingnews* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *BingNews* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *bingnews* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *bingsports* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *bingfinance* | Remove-AppxPackage"
    echo. Tentando Remover microsoft edge...
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdge* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Edge* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Edge* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Microsoft.MicrosoftEdge.Beta* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdge.Canary* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"
    echo. Tentando Remover a Cortana...
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.Cortana* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.Cortana_1.13.0.18362_neutral_neutral_cw5n1h2txyewy* | Remove-AppxPackage"
    echo.
    pause
    SET opc=
    set /p opc= Deseja remover Windows Xbox? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
    @title XBOX Apps
        echo. Tentando remover XBOX Apps...
        powershell -command "Get-AppxPackage -AllUsers *XboxOneSmartGlass* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxApp* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxIdentityProvider_12.58.1001.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay_3.34.15002.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay_1.47.14001.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameCallableUI_1000.18362.449.0_neutral_neutral_cw5n1h2txyewy* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Xbox.TCUI_1.24.10001.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage"
        @title Run clear windows apps v1.6

    :op2
	SET opc=
    set /p opc= Deseja remover Windows Extensions? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
	:op
	@title Remover Extensions
		Echo. Removendo Extensions...
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.VCLibs.140.00* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.VCLibs* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
		powershell -command "Get-AppxPackage -AllUsers *Microsoft.WebpImageExtension* | Remove-AppxPackage"
		@title Run clear windows apps v1.6
	
	:op2
    SET opc=
    set /p opc= Deseja remover Windows Email? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
    @title Remover Windows Email
        Echo. Remover Windows Email...
        powershell -command "Get-AppxPackage -AllUsers *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
        @title Run clear windows apps v1.6
    :op2

    SET opc=
    set /p opc= Deseja remover a Windows Store? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op

    @title Remover Windows Store
        Echo. remover Windows Store...
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
        powershell -command "Get-AppxPackage -AllUsers *Microsoft.Wallet* | Remove-AppxPackage"
        @title Run clear windows apps v1.6

    :op2
    SET opc=
    set /p opc= Deseja Desativa ConnectivityStore ? (Y/N) : 
    if "%opc%" equ "y" (goto:op)
    if "%opc%" equ "n" (goto:op2)
	if "%opc%" equ "Y" (goto:op)
    if "%opc%" equ "N" (goto:op2)
    :op
        powershell -command "Get-AppxPackage -AllUsers *ConnectivityStore* | Remove-AppxPackage"
    :op2
	SET opc=
    @title Run clear windows apps v1.6
    SET opc=
    echo. Aplicando nos registro do windows
        powershell -command "Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online"
    echo.
    echo Finalizado!
	
:Reinstall
	ECHO.
	ECHO =====================================
	ECHO.
	ECHO           Windows Apps
	ECHO.
	ECHO   by : Thiago Erick
	ECHO   https://github.com/ichiSawatari
	ECHO =====================================
	ECHO.
	    echo. %time% %OS% 
	    echo. %userprofile%
	ECHO.
	    rem powershell -command "Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)AppXManifest.xml”}"
    echo Finalizado!
    echo Recomendo reiniciar o windows
    pause
    cls
    echo o computador vai reiniciar
        %windir%\system32\shutdown.exe -r -t 0
:appS
goto:inicio
rem == REPARO WINDOWS ==
:op11
:InicioReparo
SET r_Reparo=
SET input_Reparo=
cls
@title REPARO/RECUPERACAO WINDOWS v1.0
echo.=====================================================================
echo.    1 - Examine os arquivos do sistema em busca de problemas 
echo.    2 - Encontrar drivers ausentes
echo.    3 - Buscar problemas em disco e corrigir 
echo.    4 - Verificar integridade dos arquivos do sistema 
echo.    5 - Excluir arquivos definitivamente do HD 
echo.=====================================================================
echo. B - Voltar ao menu inicial =========================================
echo.=====================================================================
	set /p r_Reparo= ::
	if "%r_Reparo%" equ "1" (goto:Reparo1)
	if "%r_Reparo%" equ "2" (goto:Reparo2)
	if "%r_Reparo%" equ "3" (goto:Reparo3)
	if "%r_Reparo%" equ "4" (goto:Reparo4)
	if "%r_Reparo%" equ "5" (goto:Reparo5)
	if "%r_Reparo%" equ "6" (goto:Reparo6)

	if "%r_Reparo%" equ "b" (goto:back)
	if "%r_Reparo%" equ "B" (goto:back)
	if "%r_Reparo%" GEQ "aa" (goto:erro404)
	if "%r_Reparo%" GEQ "AA" (goto:erro404)

rem = ERRO NOT FOUND ===========================================================
:erro404
cls
color 03
echo ========================================================================
echo            * Opcao Invalida! Escolha outra opcao do menu *
echo ========================================================================
echo.
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:InicioReparo

rem REPARO 01
:Reparo1
	cls
	echo. Iniciando verificacao
		sfc /scannow
		sfc /scannow > log_do_scanner.log
	pause
	echo. Retornando ao menu de reparo...
	timeout /t 2 > nul
goto:InicioReparo

rem REPARO 02
:Reparo2
	cls
		driverquery -v
	pause
	echo. Retornando ao menu de reparo...
	timeout /t 2 > nul
goto:InicioReparo

rem REPARO 03
:Reparo3
	cls
		SET /p input_Reparo= Digite a letra do disco a ser reparada EX( C: ) : 
		chkdsk /f/r/x %input_Reparo%
	pause
	echo. Retornando ao menu de reparo...
	timeout /t 2 > nul
goto:InicioReparo

rem REPARO 04
:Reparo4
	cls
		sfc	/VERIFYONLY
	pause
	echo. Retornando ao menu de reparo...
	timeout /t 2 > nul
goto:InicioReparo

rem REPARO 05
:Reparo5
	cls
		SET /p input_Reparo= Digite a letra do disco a ser reparada EX( C ) : 
		cipher / w: %input_Reparo%
	pause
	echo. Retornando ao menu de reparo...
	timeout /t 2 > nul
goto:InicioReparo

:back
goto:inicio

rem == Impressora Serviço ==
:op12

:InicioImpressora
cls
@title SERVICO DE IMPRESSORA WINDOWS v1.0
echo.=====================================================================
echo.    1 - Forca ativacao Spooler Impressora 
echo.    2 - Forca parada Spooler Impressora
echo.    3 - Forca parada e restart Spooler Impressora
echo.=====================================================================
echo. B - Voltar ao menu inicial =========================================
echo.=====================================================================
	set /p Spooler_Impressoras= ::
	if "%Spooler_Impressoras%" equ "1" (goto:SpoolerImpressora1)
	if "%Spooler_Impressoras%" equ "2" (goto:SpoolerImpressora2)
	if "%Spooler_Impressoras%" equ "3" (goto:SpoolerImpressora3)

	if "%Spooler_Impressoras%" equ "b" (goto:Spoolerback)
	if "%Spooler_Impressoras%" equ "B" (goto:Spoolerback)
	if "%Spooler_Impressoras%" GEQ "aa" (goto:erro404)
	if "%Spooler_Impressoras%" GEQ "AA" (goto:erro404)

rem = ERRO NOT FOUND ===========================================================
:erro404
cls
color 03
echo ========================================================================
echo            * Opcao Invalida! Escolha outra opcao do menu *
echo ========================================================================
echo.
echo Retornando ao menu inicial...
timeout /t 1 > nul
goto:InicioImpressora

	:SpoolerImpressora1
		sc config Spooler start=auto
		net start Spooler
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
	goto:InicioImpressora

	:SpoolerImpressora2
		sc config Spooler start=disabled
		net stop Spooler
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
	goto:InicioImpressora
	
	:SpoolerImpressora3
		sc config Spooler start=auto
		net start Spooler
		net stop Spooler
		net start Spooler
	pause
	echo Retornando ao menu inicial...
	timeout /t 2 > nul
	goto:InicioImpressora
	
:Spoolerback
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

rem == informação sobre o pc ==
:op13
	cls
	echo.
		systeminfo
		systeminfo >> desktop.txt
	echo. 
	echo Um arquivo desktop.txt foi salvo com as info.
	pause
	
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

rem == Clear diario ==
:op14
@title Clear diario arquivos temporarios
	cls
	REM ELIMINAR ALGUNS PROCESSOS DESNECESSARIOS
	echo. Fechando processos desnecessarios...
	timeout /t 2 > nul
	rem taskkill /F /IM "KMS-R@1n.exe"
	rem taskkill /F /IM ".exe"
		taskkill /F /IM "ccleaner64.exe"
		taskkill /F /IM "ccleaner.exe"
		taskkill /F /IM "AnyDesk.exe"
		taskkill /F /IM "ctfmon.exe"
		taskkill /F /IM "TeamViewer.exe"
		taskkill /F /IM "TeamViewer_Service.exe"
		taskkill /F /IM "tv_x32.exe"
		taskkill /F /IM "tv_x64.exe"
		taskkill /F /IM "CareScan.exe"
		taskkill /F /IM "DriverBooster.exe"
		taskkill /F /IM "SearchIndexer.exe"
		taskkill /F /IM "msedge.exe"
		taskkill /F /IM "vivaldi.exe"
		taskkill /F /IM "firefox.exe"
		taskkill /F /IM "chrome.exe"
		taskkill /F /IM "brave.exe"
		taskkill /F /IM "spotify.exe"
		taskkill /F /IM "Steam.exe"
		taskkill /F /IM "openvpn-gui.exe"
		taskkill /F /IM "steamwebhelper.exe"
		taskkill /F /IM "steamwebhelper.exe"
		taskkill /F /IM "HD-Player.exe"
		taskkill /F /IM "HD-Agent.exe"
		taskkill /F /IM "Bluestacks.exe"
		taskkill /F /IM "Bluestacks.exe"
		taskkill /F /IM "BstkSVC.exe"
		taskkill /F /IM "FilesBlueStacksHD-Player.exe"
		taskkill /F /IM "FilesBlueStacksHD-Agent.exe"
		taskkill /F /IM "FilesBlueStacksBluestacks.exe"
		taskkill /F /IM "FilesBlueStacksBstkSVC.exe"
		
	
	REM Apaga todas as pastas temporárias e arquivos temporários do usuário
	cls
	echo. Apagando todas as pastas temporarias e arquivos temporarios do usuario...
	timeout /t 2 > nul
		takeown /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
		icacls C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
		rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
		md C:\Users\%USERNAME%\AppData\Local\Temp\
	
	cls
	echo. Apagando os arquivos de \Windows\Temp...
	timeout /t 2 > nul
		takeown /A /R /D Y /F C:\windows\temp
		icacls C:\windows\temp /grant administradores:F /T /C
			rmdir /q /s c:\windows\temp
			md c:\windows\temp
	
	REM Apagando algumas pastas desnecessarias
		rd /q /s C:\Users\%USERNAME%\AppData\Roaming\IObit 
		rd /q /s C:\Users\%USERNAME%\AppData\LocalLow\IObit
		rd /q /s C:\temp
		rd /q /s C:\Temp
	
	REM Apaga arquivos de log
	cls
	echo. Apagando arquivos de log...
	timeout /t 2 > nul
		del c:\windows\logs\cbs\*.log
		del C:\Windows\Logs\MoSetup\*.log
		del C:\Windows\Panther\*.log /s /q
		del C:\Windows\inf\*.log /s /q
		del C:\Windows\logs\*.log /s /q
		del C:\Windows\SoftwareDistribution\*.log /s /q
		del C:\Windows\Microsoft.NET\*.log /s /q
		del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
		del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
		del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
		del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
		rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\
	
	REM ******************** EDGE ********************
	echo.
		taskkill /F /IM "msedge.exe"		
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\GrShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\ShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\ext\
		 
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Storage\ext\
			
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Storage\ext\
		
	
	REM ******************** FIREFOX ********************
		taskkill /F /IM "firefox.exe"
		REM define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
			set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
			for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
			del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q
	
	REM ******************** CHROME ********************
		taskkill /F /IM "chrome.exe"
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\GrShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\ShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Storage\ext\
		
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Storage\ext\
		 
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Storage\ext\
		
	REM ******************** VIVALDI ********************
		taskkill /F /IM "vivaldi.exe"
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\GrShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\ShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\Default\Storage\ext\
			
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 1"\Storage\ext\
			
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Vivaldi\"User Data"\"Profile 2"\Storage\ext\
	
	REM ******************** BRAVE ********************
		taskkill /F /IM "brave.exe"
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\f*.
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\index.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\GrShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\ShaderCache\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\ext\
	
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Storage\ext\
			
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\data*.
			del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\f*.
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\Database\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\GPUCache\
			rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Storage\ext\
	cls
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio


rem ======================= Author ================================
:Author
cls
@title Creditos
cls
	echo.
	echo. ==================================================================
	echo.   Author: Ichi Sawatari
	echo.   Discord: Tyago Ichi#3797
	echo.   Github: https://github.com/IchiSawatari/Windows-Help-suport
	echo. ==================================================================
	echo.   last update: 11/03/2021
	echo. ==================================================================
	echo.

echo. aperte qualquer tecla para retorna ao menu inicial.
pause >nul
echo Retornando ao menu inicial...
timeout /t 2 > nul
goto:inicio

:exit
cls
echo. Limpando variaveis...
timeout /t 2 > nul
REM = LIMPANDO VARIAVEIS =
	SET Comando=
	SET ComandoREDE=
	SET Network_Name_Password=
	SET Appx_Instalando=
	SET Xap_Instalando=
	SET TesteMode=
	SET Network_Local_NAME=
	SET Network_Local_IP=
	SET Network_Local_IPv6=
	SET Network_DNS_ONE=
	SET Network_DNS_TWE=
	SET Network_DNS_ONEv6=
	SET Network_DNS_TWEv6=
	SET AcessPoint=
	SET ssidrede=
	SET passwordrede= 
	SET SerialKeyAlter=
	SET DNS_NAME_SERVER=
	SET KMS_SERIAL=
	SET KMS_SERVER=
	SET KMS_ATIVA_WIN=
	SET ativar_Key=
	SET r_Reparo=
	SET input_Reparo=

echo. encerrando...
timeout /t 2 > nul
exit
