# Adapted from: http://superuser.com/questions/51240/powershell-or-other-script-to-swap-mouse-buttons

[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

$SwapButtons = Add-Type -MemberDefinition @'
[DllImport("user32.dll")]
public static extern bool SwapMouseButton(bool swap);
'@ -Name "NativeMethods" -Namespace "PInvoke" -PassThru

[bool]$returnValue = $SwapButtons::SwapMouseButton(!([System.Windows.Forms.SystemInformation]::MouseButtonsSwapped))

Write-Host "Mouse buttons are swapped: " ([System.Windows.Forms.SystemInformation]::MouseButtonsSwapped)
