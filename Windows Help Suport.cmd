
@echo off
@title Windows Help Suporte :3
cls

rem Created by   : Ichi Sawatari - Tyago
rem Contact      : tyago.ichi@outlook.co
REM
REM ==================================================================
REM   Author: Ichi Sawatari
REM   Discord: Tyago Ichi#3797
REM   Github: https://github.com/IchiSawatari/Windows-Help-suport
REM ==================================================================
REM   last update: 10/06/2020 02:51
REM ==================================================================
REM

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

echo. ===============================================================
echo   ====================== Menu Principal =======================
echo. ===============================================================
echo  1 - Instalar/Atualizar um aplicativo Appx (windows10)
echo. 2 - Instalar/Atualizar multiplos aplicativos Appx (windows10)
echo. 3 - Ver minha serial key
echo. 4 - Ativar windows por serial key
echo  5 - ativar windows por KMS server
echo  6 - Numero de serie Motherboard e BIOS
echo  7 - Windows Modo Teste
echo  8 - Rede
echo  9 - Atualiza para o windows 10 Pro
echo  10 - Info do PC e S.O
echo.
echo  A - Creditos
echo. ===============================================================
echo  S - SAIR
echo. ===============================================================

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
timeout /t 5 > nul
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
		powershell (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
		powershell Get-WMIObject -Class SoftwareLicensingService | Select-Object -Property *
	echo. Serial Key
		wmic path softwareLicensingService get OA3xOriginalProductKey
pause
goto:inicio

rem == Ativacao windows por serial key ==
:op4
cls
@title Ativar windows com uma serial key
echo.=====================================================================
echo.    1 - Ativar windows pela Serial Key :: 2 - Remover Serial Key
echo.=====================================================================
	set /p ativar_Key= ::
	if "%ativar_Key%" equ "1" (goto:key1)
	if "%ativar_Key%" equ "2" (goto:key2)

	if "%ativar_Key%" equ "b" (goto:back)
	if "%ativar_Key%" equ "B" (goto:back)
:key1
	echo.
	set /p SerialKeyAlter= Digite a Key (ex: xxxxx-xxxxx-xxxxx-xxxxx-xxxxx):
		slmgr.vbs -ipk %SerialKeyAlter%
		slmgr.vbs –ato
pause
goto:inicio

:key2
cls
	slmgr /upk
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
timeout /t 5 > nul
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
		
	rem = ERRO NOT FOUND ===========================================================
	:erro404
	cls
	echo ========================================================================
	echo            * Opcao Invalida! Escolha outra opcao do menu *
	echo ========================================================================
	echo.
	echo Retornando ao menu inicial...
	timeout /t 5 > nul
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
timeout /t 5 > nul
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
	timeout /t 5 > nul
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
	timeout /t 5 > nul
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
	timeout /t 5 > nul
goto:rede

rem == Ativar config DNS Auto ==
:rede4
	set /p Network_Local_NAME= Nome interface (ex: Wi-Fi): 
		netsh interface ipv4 set dnsservers name="%Network_Local_NAME%" dhcp
		netsh interface ipv6 set dnsservers name="%Network_Local_NAME%" dhcp
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 5 > nul
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
	timeout /t 5 > nul
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
	timeout /t 5 > nul
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
	timeout /t 5 > nul
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
	timeout /t 5 > nul
goto:rede

rem ===== LIMPAR DNS CACHE ========
:rede11
	cls
	echo.
		ipconfig /flushdns
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 5 > nul
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
			ipconfig /registerdns
		echo Reiniciando config de rede ETHERNET e Wi-Fi...
			timeout /t 5 > nul
			ipconfig /renew ET* >nul
			ipconfig /renew Con* >nul
			ipconfig /renew Wi* >nul
		echo Pronto...
pause
cls
	echo Retornando ao menu inicial...
	timeout /t 5 > nul
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
	timeout /t 5 > nul
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
timeout /t 5 > nul
goto:inicio

rem == informação sobre o pc ==
:op10
	cls
	echo.
		systeminfo
		systeminfo >> desktop.txt
	echo. 
	echo Um arquivo desktop.txt foi salvo com as info.
	pause
	
echo Retornando ao menu inicial...
timeout /t 5 > nul
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
	echo.   last update: 10/06/2020 02:51
	echo. ==================================================================
	echo.

echo. aperte qualquer tecla para retorna ao menu inicial.
pause >nul
echo Retornando ao menu inicial...
timeout /t 5 > nul
goto:inicio

:exit
cls
echo. Limpando variaveis...
timeout /t 5 > nul
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
echo. encerrando...
timeout /t 2 > nul
exit